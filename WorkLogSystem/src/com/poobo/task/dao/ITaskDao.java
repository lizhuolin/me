package com.poobo.task.dao;

import java.util.Date;
import java.util.List;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblTask;

public interface ITaskDao extends IBaseDao<TblTask>{

	List<TblTask> findTaskByCompanyId(String companyId);

	List<TblTask> findTaskByUserId(String userId);

	List<TblTask> findTaskByUserIdAndTime(String userId, Date taskInDate);
	
}
