package com.poobo.changelog.action;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.poobo.changelog.service.IChangelogService;
import com.poobo.company.service.CompanyService;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblChangelog;
import com.poobo.core.util.ResultData;

public class ChangelogAction extends BaseAction{
	@Resource
	private IChangelogService changelogService;
	@Resource
	private CompanyService companyService;
	private TblChangelog logs;
	private ResultData resultData;
	
	private TblChangelog changelogmodel;
	private List<TblChangelog> listUI;
	private List<TblChangelog> modelList;
	private Timestamp startTime;
	private Timestamp endTime;
	
	public String listUI(){
		ActionContext.getContext().getContextMap().put("modelList", TblChangelog.MODEL_LIST);
		//pageList = changelogService.findChangelogList(changelogmodel, pageNow, pageSize);
		pageList = changelogService.findChangelogList(startTime,endTime,logs, pageNow, pageSize);
		//String companyId = GetSessionData.getUser().getTblCompany().getCompanyId();
		//listUI = changelogService.findChangelogByCompanyId(companyId);
		return "listUI";
	}

	public TblChangelog getLogs() {
		return logs;
	}

	public void setLogs(TblChangelog logs) {
		this.logs = logs;
	}
	
	public ResultData getResultData() {
		return resultData;
	}

	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}

	public TblChangelog getChangelogmodel() {
		return changelogmodel;
	}

	public void setChangelogmodel(TblChangelog changelogmodel) {
		this.changelogmodel = changelogmodel;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
}
