package com.poobo.log.service;

import java.util.Date;
import java.util.List;

import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblLogFile;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface ILogService extends IBaseService<TblLog>{

	PageController <TblLog> getPageListByUserid(String userId,int pageNow, int pageSize);

	PageController <TblLog> findLogList(TblLog tblLog, int pageNow, int pageSize);

	TblLog findlogByUserDate(String userId, Date newDate);

	boolean checklogTime(TblLog tblLog);

	List<TblLog> findMonthlogListByDate(Date dStart,Date dEnd);

	List<TblLogFile> findAllFilebylogId(String logId);

	

}
