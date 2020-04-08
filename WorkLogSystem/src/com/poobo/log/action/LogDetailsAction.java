package com.poobo.log.action;

import java.util.List;

import javax.annotation.Resource;

import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblLogDetail;
import com.poobo.log.service.ILogDetailsService;
import com.poobo.log.service.ILogService;

public class LogDetailsAction extends BaseAction{
	
	@Resource
	private ILogDetailsService logDetailsService;
	@Resource
	private ILogService logService;
	private TblLogDetail tblLogDetails;
	private List<TblLogDetail> logDetailList;
	private TblLog tblLog;
	
	public String logDetailList(){
		if(tblLog!=null){
			String id=tblLog.getLogId();
			tblLog=logService.findObjectById(id);
			logDetailList = logDetailsService.findAllByLogId(id);
		}
		return "logDetailList";
	}

	public TblLogDetail getTblLogDetails() {
		return tblLogDetails;
	}

	public void setTblLogDetails(TblLogDetail tblLogDetails) {
		this.tblLogDetails = tblLogDetails;
	}

	public List<TblLogDetail> getLogDetailList() {
		return logDetailList;
	}

	public void setLogDetailList(List<TblLogDetail> logDetailList) {
		this.logDetailList = logDetailList;
	}

	public TblLog getTblLog() {
		return tblLog;
	}

	public void setTblLog(TblLog tblLog) {
		this.tblLog = tblLog;
	}
	
}
