package com.poobo.reportwarn.action;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;

import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblReportwarn;
import com.poobo.core.util.ResultData;
import com.poobo.log.service.ILogService;
import com.poobo.reportwarn.service.IReportWarnService;

public class ReportWarnAction extends BaseAction<TblReportwarn> {

	@Resource
	private IReportWarnService reportwarnService;
	@Resource
	private ILogService logService;
	private TblReportwarn reportwarn;
	private TblLog log;
	private String ids;
	private ResultData resultData;

	public String reportwarnList() {
		pageList = reportwarnService.findReportwarnList(reportwarn, pageNow, pageSize);
		return "reportwarnList";
	}
	

	public String delete()
	{
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			reportwarnService.delReportWarnByIds(idList);
			resultData.setResultFlag(true);
		}
		
		return SUCCESS;
		
	}
	/**
	 * 到提醒详细页面
	 * 
	 */
	
	public String remindDetail(){
		if(log != null)
			log = logService.findObjectById(log.getLogId());
		if(reportwarn != null)
			reportwarn = reportwarnService.findObjectById(reportwarn.getReportwarnId());
		return "remindDetail";
	}
	public TblReportwarn getReportwarn() {
		return reportwarn;
	}

	public void setReportwarn(TblReportwarn reportwarn) {
		this.reportwarn = reportwarn;
	}



	public String getIds() {
		return ids;
	}



	public void setIds(String ids) {
		this.ids = ids;
	}


	public ResultData getResultData() {
		return resultData;
	}


	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}


	public TblLog getLog() {
		return log;
	}


	public void setLog(TblLog log) {
		this.log = log;
	}
	
	
}
