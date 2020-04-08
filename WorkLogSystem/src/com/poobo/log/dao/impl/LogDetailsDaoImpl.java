package com.poobo.log.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblLogDetail;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.log.dao.ILogDetailsDao;

public class LogDetailsDaoImpl extends BaseDaoImpl<TblLogDetail> implements ILogDetailsDao{

	@Override
	public List<TblLogDetail> findAllByLogId(String logId) {
		Query query = getSession().createQuery(" FROM TblLogDetail WHERE tblLog.logId =?");
		query.setParameter(0, logId);
		return query.list();
	}

}
