package com.poobo.changelog.service.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.changelog.dao.IChangelogDao;
import com.poobo.changelog.service.IChangelogService;
import com.poobo.company.service.CompanyService;
import com.poobo.core.entity.TblChangelog;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.DateTimeUtil;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;

@Service("changelogService")
public class ChangelogServiceImpl extends BaseServiceImpl<TblChangelog> implements IChangelogService{
	@Resource
	private CompanyService companyService;
	
	private IChangelogDao changelogDao;
	@Resource
	public void setChangelogDao(IChangelogDao changelogDao){
		super.setBaseDao(changelogDao);
		this.changelogDao=changelogDao;
	}

	public PageController<TblChangelog> getPageList(TblChangelog logs, int pageNow, int pageSize) {
		Criteria criteria=changelogDao.createCriteria(IChangelogDao.class);
		
		//criteria.add(Restrictions.eq("dataStatus", EnumDataStatus.NORMAL.getValue()));
		return changelogDao.findPageByCriteria(criteria, pageNow, pageSize);
	}
	

	/**
	 * 操作日志
	 * @param changelogContent 修改内容
	 * @param changelogType 日志类型：0添加，1编辑，2删除，3导出，4登陆
	 * @param changelogmodel  操作模块
	 */
	
	public  void logRemable(String changelogContent,Integer changelogType,String changelogmodel){
		
		//String userId ,String companyId, String changelogRemaks
		TblUser tbluser =  GetSessionData.getUser();
		
		TblCompany company = companyService.findObjectById(tbluser.getTblCompany().getCompanyId());
		//TblUser tblUser=new TblUser();
		//tblUser.setUserId(userId);
		
		//TblCompany tblCompany=new TblCompany();
		//tblCompany.setCompanyId(companyId);
		
		
		TblChangelog changelog=new TblChangelog();
		changelog.setTblUser(tbluser);
		changelog.setTblCompany(company);
		changelog.setChangelogContent(changelogContent);
		changelog.setChangelogType(changelogType);
		changelog.setChangelogTime(DateTimeUtil.getNowTimestamp());
		changelog.setCreateTime(DateTimeUtil.getNowTimestamp());
		//changelog.setChangelogRemaks(changelogRemaks);
		changelog.setChangelogmodel(changelogmodel);
		changelog.setDataStatus(EnumDataStatus.NORMAL.getValue());
		changelogDao.save(changelog);
	}

	@Override
	public PageController<TblChangelog> findChangelogList(Timestamp startTime, Timestamp endTime, TblChangelog logs,
			int pageNow, int pageSize) {
	
			DetachedCriteria detachedCriteria=DetachedCriteria.forClass(TblChangelog.class).createAlias("tblUser", "u");
			if(!GetSessionData.getUser().getIsUserPlatform()){
			  detachedCriteria.add(Restrictions.eq("tblCompany", GetSessionData.getUser().getTblCompany()));
			}
			detachedCriteria.addOrder(Order.desc("createTime"));
			
			if(null != logs){
				if(!logs.getTblUser().getName().equals("%")){
				if(null!=logs.getTblUser()&&StringUtils.isNotEmpty(logs.getTblUser().getName())){
					if(null!=logs.getChangelogType()){	
					detachedCriteria.add(Restrictions.ilike("u.name",logs.getTblUser().getName(), MatchMode.ANYWHERE)).add(Restrictions.eq("changelogType",logs.getChangelogType()));	
					}else{
						detachedCriteria.add(Restrictions.ilike("u.name",logs.getTblUser().getName(), MatchMode.ANYWHERE));
					}
					
				   }else{
					if(null!=logs.getChangelogType()){
					detachedCriteria.add(Restrictions.eq("changelogType",logs.getChangelogType()));
					}
					
				}
				}else{
					detachedCriteria.add(Restrictions.ilike("u.name","\\%"));
				}
				//根据操作模块查询
				if(StringUtils.isNotEmpty(logs.getChangelogmodel())){
					detachedCriteria.add(Restrictions.eq("changelogmodel",logs.getChangelogmodel()));
				}
				
				if(startTime != null && endTime !=null){
					detachedCriteria.add(Restrictions.between("changelogTime", startTime, endTime));
				  }else if(startTime != null && endTime ==null){
					  detachedCriteria.add(Restrictions.gt("changelogTime", startTime));
				  }else if(startTime == null && endTime !=null){
					  detachedCriteria.add(Restrictions.lt("changelogTime", endTime));
				  }
				
			  }
				
		
			return changelogDao.getListByDetachedCriteria(detachedCriteria,pageNow,pageSize);
			

	}
	
}

