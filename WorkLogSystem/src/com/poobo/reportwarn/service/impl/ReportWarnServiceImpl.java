package com.poobo.reportwarn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblPlan;
import com.poobo.core.entity.TblReportwarn;
import com.poobo.core.entity.TblTask;
import com.poobo.core.entity.TblTease;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.enums.EnumReportWarnType;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.DateTimeUtil;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;
import com.poobo.reportwarn.dao.IReportWarnDao;
import com.poobo.reportwarn.service.IReportWarnService;

@Service("reportWarnService")
public class ReportWarnServiceImpl extends BaseServiceImpl<TblReportwarn> implements IReportWarnService{
	private IReportWarnDao reportWarnDao;
	@Resource 
	public void setReportwarnDao(IReportWarnDao reportWarnDao) {
		super.setBaseDao(reportWarnDao);
		this.reportWarnDao =reportWarnDao;
	}
	
	


	@Override
	public PageController<TblReportwarn> findReportwarnList(TblReportwarn reportwarn, int pageNow,int pageSize) {
		/*Criteria criteria = reportWarnDao.createCriteria(TblReportwarn.class);
		criteria.add(Restrictions.eq("dataStatus", EnumDataStatus.NORMAL.getValue()));
		if(!GetSessionData.getUser().getIsUserPlatform()){
			criteria.add(Restrictions.eq("tblUser.tblCompany.companyId", GetSessionData.getUser().getTblCompany().getCompanyId()));
		}
		criteria.addOrder(Order.desc("createTime"));
		*/
		
		StringBuffer sb=new StringBuffer();
		sb.append(" from TblReportwarn where 1=1 ");
		Map<String, Object> namedParam = new HashMap<String, Object>();
		sb.append(" and dataStatus =:dataStatus");
		namedParam.put("dataStatus", EnumDataStatus.NORMAL.getValue());
		if(!GetSessionData.getUser().getIsUserPlatform()){
			sb.append(" and tblUser.tblCompany.companyId =:company");
			namedParam.put("company", GetSessionData.getUser().getTblCompany().getCompanyId());
		}
		sb.append(" order by createTime desc");
		
		return reportWarnDao.findPageByHql(sb.toString(), namedParam,  pageNow, pageSize);
	}
	
	/**
	 * 每日生成提醒报告
	 * @author hao.wang 2016年4月13日11:19:48
	 */
	public void doReportWarn(){
		reportWarnDao.deleteAllReportWarns();
		List<TblTask> taskList = reportWarnDao.findTasks();
		List<TblPlan> planList = reportWarnDao.findPlans();
		List<TblLog> logList = reportWarnDao.findLog4Yesterday(false);
		
		
		TblReportwarn reportwarn = null;
		for (TblTask task : taskList) {
			reportwarn = new TblReportwarn();
			reportwarn.setCreateTime(DateTimeUtil.getNowTimestamp());
			reportwarn.setDataStatus(EnumDataStatus.NORMAL.getValue());
			reportwarn.setTblTask(task);
			reportwarn.setTblUser(task.getTaskResponsible());
			reportwarn.setType(EnumReportWarnType.TASK.getValue());
			reportWarnDao.save(reportwarn);
		}
		
		for (TblPlan plan : planList) {
			reportwarn = new TblReportwarn();
			reportwarn.setCreateTime(DateTimeUtil.getNowTimestamp());
			reportwarn.setDataStatus(EnumDataStatus.NORMAL.getValue());
			reportwarn.setTblPlan(plan);
			reportwarn.setTblUser(plan.getPlanManager());
			reportwarn.setType(EnumReportWarnType.PLAN.getValue());
			reportWarnDao.save(reportwarn);
		}
		for (TblLog log : logList) {
			reportwarn = new TblReportwarn();
			reportwarn.setCreateTime(DateTimeUtil.getNowTimestamp());
			reportwarn.setDataStatus(EnumDataStatus.NORMAL.getValue());
			reportwarn.setTblLog(log);
			reportwarn.setTblUser(log.getTblUser());
			reportwarn.setType(EnumReportWarnType.LOG.getValue());
			reportWarnDao.save(reportwarn);
		}
		
	}


	





	@Override
	public List<TblLog> findLog4Yesterday(boolean isHome) {
		return reportWarnDao.findLog4Yesterday(isHome);
	}


	/**
	 * 查找在消息主页显示的提醒报告
	 * @return
	 */
	public List<TblReportwarn> findReportWarns() {
		return reportWarnDao.findReportWarns();
	}




	@Override
	public void delReportWarnByIds(String[] idList) {
			for(String id:idList){
				
				TblReportwarn rw = reportWarnDao.findObjectById(id);
				rw.setDataStatus(EnumDataStatus.DEL.getValue());
				//初始化任务未开始
				reportWarnDao.merge(rw);
			}
			
	}








	
	
	
	
	
	
	
	
}
