package com.poobo.log.service;

import java.util.List;

import com.poobo.core.entity.TblLogDetail;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface ILogDetailsService extends IBaseService<TblLogDetail>{

	List<TblLogDetail> findAllByLogId(String logId);

	PageController getPageList(TblLogDetail tblLogDetails, int pageNow,
			int pageSize, String logId);

	
}
