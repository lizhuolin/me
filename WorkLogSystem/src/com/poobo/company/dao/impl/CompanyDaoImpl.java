package com.poobo.company.dao.impl;

import com.poobo.company.dao.CompanyDao;
import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.enums.EnumDataStatus;

public class CompanyDaoImpl extends BaseDaoImpl<TblCompany> implements CompanyDao {

	@Override
	public void delcompanyByIds(String[] idList) {
		for(String id:idList){
			TblCompany company=super.findObjectById(id);
			company.setDataStatus(EnumDataStatus.DEL.getValue());
			//初始化任务未开始
			//super.merge(company);
			super.update(company);
		}
	}

	
}
