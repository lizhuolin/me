package com.poobo.timereport.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblTimereport;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.DateTimeUtil;
import com.poobo.core.util.ExcelUtil;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;
import com.poobo.timereport.dao.ITimeReportDao;
import com.poobo.timereport.service.ITimeReportService;

@Service("timeReportService")
public class TimeReportServiceImpl extends BaseServiceImpl<TblTimereport>
		implements ITimeReportService {
	
	private ITimeReportDao timeReportDao;
	@Resource
	public void setTimeReportDaoDao(ITimeReportDao timeReportDao) {
		super.setBaseDao(timeReportDao);
		this.timeReportDao = timeReportDao;
	}

	/**
	 * 执行定时报告
	 * @author hao.wang 2016年3月18日09:15:52
	 */
	@Override
	public void doTimeReport() {
		TblTimereport timeReport = null;
		List<TblProject> projectList = timeReportDao.findOneMonthProject();
		for (TblProject project : projectList) {
			timeReport = new TblTimereport();
			timeReport.setProjectEndTime(project.getProjectEndTime());
			timeReport.setProjectManager(project.getProjectManager().getName());
			timeReport.setProjectName(project.getProjectName());
			timeReport.setProjectProgress(project.getProjectProgress());
			timeReport.setProjectRealStartTime(project.getProjectRealStartTime());
			timeReport.setProjectRealEndTime(project.getProjectRealEndTime());
			timeReport.setProjectRemaks(project.getProjectRemaks());
			timeReport.setProjectStartTime(project.getProjectStartTime());
			timeReport.setProjectStatus(project.getProjectStatus());
			timeReport.setProjectTarget(project.getProjectTarget());
			timeReport.setTblCompany(project.getTblCompany());
			timeReport.setCreateTime(DateTimeUtil.getNowTimestamp());
			timeReportDao.save(timeReport);
		}
	}

	/**
	 * 获取定时报告分页对象
	 * @author hao.wang 2016年3月18日09:15:52
	 * @param timeReport，pageNow，pageSize
	 * @return PageController
	 */
	@Override
	public PageController<TblTimereport> getPageList(TblTimereport t,
			int pageNow, int pageSize) {
		Criteria criteria = timeReportDao.createCriteria(TblTimereport.class);
		
		criteria.addOrder(Order.desc("projectStartTime"));
		return timeReportDao.findPageByCriteria(criteria, pageNow, pageSize);
	}

	/**
	 * 导出定时报告excel
	 * @param findAll
	 * @param outputStream
	 */
	public void exportExcel(List timeReports, ServletOutputStream outputStream) {
			ExcelUtil.exportUserExcel(timeReports, outputStream);

	}


	public PageController<TblTimereport> findTimeReportList(
			Calendar cal1,Calendar cal2, int pageNow, int pageSize) {
		Criteria criteria = timeReportDao.createCriteria(TblTimereport.class);
		if(!GetSessionData.getUser().getIsUserPlatform()){
			criteria.add(Restrictions.eq("tblCompany", GetSessionData.getUser().getTblCompany()));
		}
		if(cal1 != null && cal2 != null){
		criteria.add(Restrictions.between("createTime", cal1.getTime(), cal2.getTime()));
		criteria.addOrder(Order.desc("projectStartTime"));
		}
		return timeReportDao.findPageByCriteria(criteria, pageNow, pageSize);
	}

	/**
	 * 通过年份获取月
	 */
	public List<Integer> getMonthByYear(Integer year) {
		Calendar cal = Calendar.getInstance();
		List<Integer> monthList = new ArrayList<Integer>();
		if(cal.get(Calendar.YEAR) != year){
			for (int i = 1; i < 13; i++) {
				monthList.add(i);
			}
		}else{
			for (int i = cal.get(Calendar.MONTH); i > 0 ; i--) {
				monthList.add(i);
			}
		}
		return monthList;
	}

	@Override
	public List<TblTimereport> findByYearAndMonth(int year,int month) {
		return timeReportDao.findByYearAndMonth(year,month);
	}

	
}
