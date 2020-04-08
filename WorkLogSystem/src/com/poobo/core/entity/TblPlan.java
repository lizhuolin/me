package com.poobo.core.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TblPlan entity. @author MyEclipse Persistence Tools
 */

public class TblPlan implements java.io.Serializable {

	// Fields

	private String planId;
	private TblProject tblProject;
	private TblProjectChild tblProjectChild;
	private Timestamp planStartTime;
	private Timestamp planEndTime;
	private Timestamp planRealEndTime;
	private Timestamp planRealStartTime;
	private String planMsg;
	private Integer planTime;
	private Integer planClass;
	private Integer planRealTime;
	private Integer planProgress;
	private Integer dataStatus;
	private Timestamp createTime;
	private String planRemarks;
	private String planTarget;
	private String projectProgress;
	private String planName;
	private Integer planStatus;
	private TblUser planCreater;
	private TblUser planManager;

	private Timestamp planCreateTime;
	private Set tblRecordses = new HashSet(0);
	private Set tblPlanUsers = new HashSet(0);

	// Constructors

	/** default constructor */
	public TblPlan() {
	}


	// Property accessors

	public String getPlanId() {
		return this.planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public TblProject getTblProject() {
		return this.tblProject;
	}

	public void setTblProject(TblProject tblProject) {
		this.tblProject = tblProject;
	}

	public TblProjectChild getTblProjectChild() {
		return this.tblProjectChild;
	}

	public void setTblProjectChild(TblProjectChild tblProjectChild) {
		this.tblProjectChild = tblProjectChild;
	}

	public Timestamp getPlanEndTime() {
		return this.planEndTime;
	}

	public void setPlanEndTime(Timestamp planEndTime) {
		this.planEndTime = planEndTime;
	}

	public Timestamp getPlanRealEndTime() {
		return this.planRealEndTime;
	}

	public void setPlanRealEndTime(Timestamp planRealEndTime) {
		this.planRealEndTime = planRealEndTime;
	}

	public Timestamp getPlanRealStartTime() {
		return this.planRealStartTime;
	}

	public void setPlanRealStartTime(Timestamp planRealStartTime) {
		this.planRealStartTime = planRealStartTime;
	}

	public String getPlanMsg() {
		return this.planMsg;
	}

	public void setPlanMsg(String planMsg) {
		this.planMsg = planMsg;
	}

	public Integer getPlanTime() {
		return this.planTime;
	}

	public void setPlanTime(Integer planTime) {
		this.planTime = planTime;
	}

	public Integer getPlanClass() {
		return this.planClass;
	}

	public void setPlanClass(Integer planClass) {
		this.planClass = planClass;
	}

	public Integer getPlanRealTime() {
		return this.planRealTime;
	}

	public void setPlanRealTime(Integer planRealTime) {
		this.planRealTime = planRealTime;
	}

	public Integer getPlanProgress() {
		return this.planProgress;
	}

	public void setPlanProgress(Integer planProgress) {
		this.planProgress = planProgress;
	}

	public Integer getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(Integer dataStatus) {
		this.dataStatus = dataStatus;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getPlanRemarks() {
		return this.planRemarks;
	}

	public void setPlanRemarks(String planRemarks) {
		this.planRemarks = planRemarks;
	}

	public String getPlanTarget() {
		return this.planTarget;
	}

	public void setPlanTarget(String planTarget) {
		this.planTarget = planTarget;
	}

	public String getProjectProgress() {
		return this.projectProgress;
	}

	public void setProjectProgress(String projectProgress) {
		this.projectProgress = projectProgress;
	}

	public String getPlanName() {
		return this.planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public Integer getPlanStatus() {
		return this.planStatus;
	}

	public void setPlanStatus(Integer planStatus) {
		this.planStatus = planStatus;
	}

	public TblUser getPlanCreater() {
		return planCreater;
	}


	public void setPlanCreater(TblUser planCreater) {
		this.planCreater = planCreater;
	}


	public Timestamp getPlanCreateTime() {
		return this.planCreateTime;
	}

	public void setPlanCreateTime(Timestamp planCreateTime) {
		this.planCreateTime = planCreateTime;
	}

	public Set getTblRecordses() {
		return this.tblRecordses;
	}

	public void setTblRecordses(Set tblRecordses) {
		this.tblRecordses = tblRecordses;
	}

	public Set getTblPlanUsers() {
		return this.tblPlanUsers;
	}

	public void setTblPlanUsers(Set tblPlanUsers) {
		this.tblPlanUsers = tblPlanUsers;
	}

	public TblUser getPlanManager() {
		return planManager;
	}

	public void setPlanManager(TblUser planManager) {
		this.planManager = planManager;
	}


	public Timestamp getPlanStartTime() {
		return planStartTime;
	}


	public void setPlanStartTime(Timestamp planStartTime) {
		this.planStartTime = planStartTime;
	}

}