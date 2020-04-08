package com.poobo.task.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblTask;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.task.dao.ITaskDao;

public class TaskDaoImpl extends BaseDaoImpl<TblTask> implements ITaskDao{

	@Override
	public List<TblTask> findTaskByCompanyId(String companyId) {
		Query query = getSession().createQuery("FROM TblTask WHERE tblCompany.companyId= ?");
		query.setParameter(0, companyId);
		return query.list();
	}

	@Override
	public List<TblTask> findTaskByUserId(String userId) {
		Query query = getSession().createQuery("FROM TblTask WHERE taskResponsible.userId= ?");
		query.setParameter(0, userId);
		return query.list();
	}

	@Override
	public List<TblTask> findTaskByUserIdAndTime(String userId, Date taskInDate) {
		Query query =getSession().createQuery("FROM TblTask t WHERE t.taskResponsible.userId= ? and t.dataStatus= ? and  ? between t.taskStartTime and t.taskEndTime");
		query.setParameter(0, userId);
		query.setParameter(1, EnumDataStatus.NORMAL.getValue());
		
		query.setParameter(2, taskInDate);
		List<TblTask> list=query.list();
		return query.list();
	}
	
	

}
