package com.poobo.log.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblLogFile;

public interface ILogDao extends IBaseDao<TblLog>{

	TblLog findTblLogByUserDate(String userId, Date newDate);

	List<TblLog> findAllByHQL(Date dString, Date dEnd);

	List<TblLogFile> findAllFileByLogId(String logId);

}
