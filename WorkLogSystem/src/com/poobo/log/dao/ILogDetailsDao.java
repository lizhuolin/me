package com.poobo.log.dao;

import java.util.List;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblLogDetail;

public interface ILogDetailsDao extends IBaseDao<TblLogDetail>{

	List<TblLogDetail> findAllByLogId(String logId);

}
