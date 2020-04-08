package com.poobo.company.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.company.dao.CompanyDao;
import com.poobo.company.enums.EnumCompanyAudit;
import com.poobo.company.service.CompanyService;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblTask;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataPrivilege;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;
import com.poobo.core.util.QueryHelper;
import com.poobo.task.enums.EnumTaskStatus;

@Service("companyService")
public class CompanyServiceImpl extends BaseServiceImpl<TblCompany> implements
		CompanyService {
	private CompanyDao companyDao;
	@Resource 
	public void setCompanyDao(CompanyDao companyDao) {
		super.setBaseDao(companyDao);
		this.companyDao = companyDao;
	}
	@Override
	public PageController<TblCompany> getPageList(TblCompany tblcompany,
			int pageNow, int pageSize) {
		Criteria criteria=companyDao.createCriteria(TblCompany.class);
		
		criteria.add(Restrictions.eq("dataStatus", 0));
		criteria.addOrder(Order.desc("createTime"));
		
		return companyDao.findPageByCriteria(criteria, pageNow, pageSize);
	}
	
	@Override
	public void delcompanyByIds(String[] idList) {
		companyDao.delcompanyByIds(idList);
	}
	
	@Override
	public void newCompany(TblCompany tblcompany) {
		// TODO Auto-generated method stub
		tblcompany.setDataStatus(EnumDataStatus.NORMAL.getValue());
		tblcompany.setCreateTime(DateUtils.getCurrentDateTimeStamp());
		
		
		super.save(tblcompany);
	}
	
	@Override
	public void auditCompanyByIds(String id) {
			
				TblUser user = new TblUser();
				TblCompany company = companyDao.findObjectById(id);
				company.setIsVerification(EnumCompanyAudit.C_PASS.getValue());
				//初始化任务未开始
				companyDao.merge(company);
		
	}
	
	@Override
	public void freezeCompanyByIds(String[] idList) {
		
		for(String id:idList){
			TblCompany company = companyDao.findObjectById(id);
			company.setIsVerification(EnumCompanyAudit.C_UNPASS.getValue());
			company.setIsFreeze(true);
			//初始化任务未开始
			companyDao.merge(company);
		
	}
	}
	
	@Override
	public TblCompany getCompanyById(Serializable companyId) {
		return companyDao.findObjectById(companyId);
	}
	@Override
	public PageController<TblCompany> findCompanyList(TblCompany tblcompany,
			int pageNow, int pageSize) {
		Criteria criteria = companyDao.createCriteria(TblCompany.class);
		criteria.add(Restrictions.eq("dataStatus", EnumDataStatus.NORMAL.getValue()));
		criteria.addOrder(Order.desc("createTime"));
		if(GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
			criteria.add(Restrictions.eq("gsAdmin.userId",GetSessionData.getUser().getUserId()));
		}
		if(!GetSessionData.getUser().getIsUserPlatform())
			  criteria.add(Restrictions.eq("companyId", GetSessionData.getUser().getTblCompany().getCompanyId()));
		if(null != tblcompany){
		  criteria.add(Restrictions.ilike("companyName", "%" + tblcompany.getCompanyName() +"%"));
		  criteria.add(Restrictions.ilike("companyAdmin", "%" + tblcompany.getCompanyAdmin() +"%"));
		  criteria.add(Restrictions.ilike("companyMobile", "%" + tblcompany.getCompanyMobile() +"%"));
		  //criteria.add(Restrictions.eq("isEffect",company.getIsEffect()));
		  if(!tblcompany.getCompanyName().equals("%")){//解决输入%查询出所有
		      criteria.add(Restrictions.ilike("companyName", "%" + tblcompany.getCompanyName() +"%"));
			}else{
				criteria.add(Restrictions.ilike("companyName", "%"  + "\\%"  +"%"));
			}
		  if(!tblcompany.getCompanyAdmin().equals("%")){//解决输入%查询出所有
		      criteria.add(Restrictions.ilike("companyAdmin", "%" + tblcompany.getCompanyAdmin() +"%"));
			}else{
				criteria.add(Restrictions.ilike("companyAdmin", "%"  + "\\%"  +"%"));
			}
		  if(!tblcompany.getCompanyMobile().equals("%")){//解决输入%查询出所有
		      criteria.add(Restrictions.ilike("companyMobile", "%" + tblcompany.getCompanyMobile() +"%"));
			}else{
				criteria.add(Restrictions.ilike("companyMobile", "%"  + "\\%"  +"%"));
			}
		}
		return companyDao.findPageByCriteria(criteria, pageNow, pageSize);
	}
	@Override
	public boolean checkCompanyname(TblCompany tblcompany) {
		QueryHelper queryHelper = new QueryHelper(TblCompany.class,"u");
		queryHelper.addCondition("u.companyName=?",tblcompany.getCompanyName());
		queryHelper.addCondition("u.dataStatus=?",EnumDataStatus.NORMAL.getValue());
		List<TblCompany> list =findObjects(queryHelper);
		if(list == null || list.size() == 0){
			return true;
		}else{
			// 排除编辑情况下，检测当前编辑的对象
			if(list.size() == 1 && tblcompany.getCompanyId()!=null){
				if(tblcompany.getCompanyId().equals(list.get(0).getCompanyId())){
					return true;
				}
			}
			return false;
		}
	}
	@Override
	public boolean checkCompanymobile(TblCompany tblcompany) {
		QueryHelper queryHelper = new QueryHelper(TblCompany.class,"u");
		queryHelper.addCondition("u.companyMobile=?",tblcompany.getCompanyMobile());
		queryHelper.addCondition("u.dataStatus=?",EnumDataStatus.NORMAL.getValue());
		List<TblCompany> list =findObjects(queryHelper);
		if(list == null || list.size() == 0){
			return true;
		}else{
			// 排除编辑情况下，检测当前编辑的对象
			if(list.size() == 1 && tblcompany.getCompanyId()!=null){
				if(tblcompany.getCompanyId().equals(list.get(0).getCompanyId())){
					return true;
				}
			}
			return false;
		}
	}
	@Override
	public boolean checkRegisteCompanyname(TblCompany tblcompany) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public void notfreezeCompanyByIds(String[] idList) {
		for(String id:idList){
			TblCompany company = companyDao.findObjectById(id);
			company.setIsVerification(EnumCompanyAudit.C_PASS.getValue());
			company.setIsFreeze(false);
			//初始化任务未开始
			companyDao.merge(company);
		
	}
		
	}
	
	
	}
	

	

