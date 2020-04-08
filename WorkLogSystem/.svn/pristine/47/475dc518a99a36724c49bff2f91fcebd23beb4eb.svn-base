package com.poobo.dept.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblDept;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.dept.dao.IDeptDao;

public class DeptDaoImpl extends BaseDaoImpl<TblDept> implements IDeptDao{

	@Override
	public List<TblDept> findDeptsByCompanyId(String companyId) {
		Query query = getSession().createQuery("FROM TblDept WHERE tblCompany.companyId = ? AND dataStatus = ?");
		query.setParameter(0, companyId);
		query.setParameter(1, EnumDataStatus.NORMAL.getValue());
		return query.list();
	}
	
}
