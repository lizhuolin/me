package com.poobo.core.entity;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * TblTimereport entity. @author MyEclipse Persistence Tools
 */

public class TblTimereport implements java.io.Serializable {

	// Fields

	private String timereportId;
	private TblCompany tblCompany;
	private Date createTime;
	private String projectProgress;
	private Date projectStartTime;
	private Date projectEndTime;
	private Date projectRealStartTime;
	private Date projectRealEndTime;
	private String projectTarget;
	private Integer projectStatus;
	private String projectRemaks;
	private String projectName;
	private String projectManager;
	public static List<Integer> yearList;


	static{
		yearList = new ArrayList<Integer>();
		Calendar cal=Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		yearList.add(year);
		yearList.add(year-1);
		yearList.add(year-2);
		
	}
	/** default constructor */
	public TblTimereport() {
	}


	// Property accessors

	public String getTimereportId() {
		return this.timereportId;
	}

	public void setTimereportId(String timereportId) {
		this.timereportId = timereportId;
	}

	public TblCompany getTblCompany() {
		return this.tblCompany;
	}

	public void setTblCompany(TblCompany tblCompany) {
		this.tblCompany = tblCompany;
	}
	
	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public String getProjectProgress() {
		return this.projectProgress;
	}

	public void setProjectProgress(String projectProgress) {
		this.projectProgress = projectProgress;
	}

	public Date getProjectStartTime() {
		return this.projectStartTime;
	}

	public void setProjectStartTime(Date projectStartTime) {
		this.projectStartTime = projectStartTime;
	}

	public Date getProjectEndTime() {
		return this.projectEndTime;
	}

	public void setProjectEndTime(Date projectEndTime) {
		this.projectEndTime = projectEndTime;
	}


	public Date getProjectRealStartTime() {
		return projectRealStartTime;
	}

	public void setProjectRealStartTime(Date projectRealStartTime) {
		this.projectRealStartTime = projectRealStartTime;
	}

	public Date getProjectRealEndTime() {
		return projectRealEndTime;
	}

	public void setProjectRealEndTime(Date projectRealEndTime) {
		this.projectRealEndTime = projectRealEndTime;
	}

	public String getProjectTarget() {
		return this.projectTarget;
	}

	public void setProjectTarget(String projectTarget) {
		this.projectTarget = projectTarget;
	}

	public Integer getProjectStatus() {
		return this.projectStatus;
	}

	public void setProjectStatus(Integer projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getProjectRemaks() {
		return this.projectRemaks;
	}

	public void setProjectRemaks(String projectRemaks) {
		this.projectRemaks = projectRemaks;
	}

	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectManager() {
		return this.projectManager;
	}

	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}

}