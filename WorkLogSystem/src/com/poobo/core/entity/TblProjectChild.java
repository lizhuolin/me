package com.poobo.core.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TblProjectChild entity. @author MyEclipse Persistence Tools
 */

public class TblProjectChild implements java.io.Serializable {

	// Fields

	private String projectChildRealId;
	private TblProject tblProject;
	private String projectChildId;
	private String projectFatherId;
	private String projectName;
	private Integer projectLevel;
	private Timestamp projectChildStarttime;
	private Timestamp projectChildEndtime;
	private String projectChildTarget;
	private Integer projectChildStatus;
	private Timestamp projectChildRealendtime;
	private Integer dataStatus;
	private Timestamp creteTime;
	private Integer taskPriority;
	private Timestamp projectChildRealstarttime;
	private Integer planTime;
	private Integer realTime;
	private TblUser responsible;
	private String projectProgress;
	private TblUser creater;
	private Set tblRecordses = new HashSet(0);
	private Set tblPlans = new HashSet(0);


	// Property accessors

	public String getProjectChildRealId() {
		return this.projectChildRealId;
	}

	public void setProjectChildRealId(String projectChildRealId) {
		this.projectChildRealId = projectChildRealId;
	}

	public TblProject getTblProject() {
		return this.tblProject;
	}

	public void setTblProject(TblProject tblProject) {
		this.tblProject = tblProject;
	}

	public String getProjectChildId() {
		return this.projectChildId;
	}

	public void setProjectChildId(String projectChildId) {
		this.projectChildId = projectChildId;
	}

	public String getProjectFatherId() {
		return this.projectFatherId;
	}

	public void setProjectFatherId(String projectFatherId) {
		this.projectFatherId = projectFatherId;
	}

	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Integer getProjectLevel() {
		return this.projectLevel;
	}

	public void setProjectLevel(Integer projectLevel) {
		this.projectLevel = projectLevel;
	}

	public Timestamp getProjectChildStarttime() {
		return this.projectChildStarttime;
	}

	public void setProjectChildStarttime(Timestamp projectChildStarttime) {
		this.projectChildStarttime = projectChildStarttime;
	}

	public Timestamp getProjectChildEndtime() {
		return this.projectChildEndtime;
	}

	public void setProjectChildEndtime(Timestamp projectChildEndtime) {
		this.projectChildEndtime = projectChildEndtime;
	}

	public String getProjectChildTarget() {
		return this.projectChildTarget;
	}

	public void setProjectChildTarget(String projectChildTarget) {
		this.projectChildTarget = projectChildTarget;
	}

	public Integer getProjectChildStatus() {
		return this.projectChildStatus;
	}

	public void setProjectChildStatus(Integer projectChildStatus) {
		this.projectChildStatus = projectChildStatus;
	}

	public Timestamp getProjectChildRealendtime() {
		return this.projectChildRealendtime;
	}

	public void setProjectChildRealendtime(Timestamp projectChildRealendtime) {
		this.projectChildRealendtime = projectChildRealendtime;
	}

	public Integer getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(Integer dataStatus) {
		this.dataStatus = dataStatus;
	}

	public Timestamp getCreteTime() {
		return this.creteTime;
	}

	public void setCreteTime(Timestamp creteTime) {
		this.creteTime = creteTime;
	}

	public Integer getTaskPriority() {
		return this.taskPriority;
	}

	public void setTaskPriority(Integer taskPriority) {
		this.taskPriority = taskPriority;
	}

	public Timestamp getProjectChildRealstarttime() {
		return this.projectChildRealstarttime;
	}

	public void setProjectChildRealstarttime(Timestamp projectChildRealstarttime) {
		this.projectChildRealstarttime = projectChildRealstarttime;
	}

	public Integer getPlanTime() {
		return this.planTime;
	}

	public void setPlanTime(Integer planTime) {
		this.planTime = planTime;
	}

	public Integer getRealTime() {
		return this.realTime;
	}

	public void setRealTime(Integer realTime) {
		this.realTime = realTime;
	}

	public String getProjectProgress() {
		return this.projectProgress;
	}

	public void setProjectProgress(String projectProgress) {
		this.projectProgress = projectProgress;
	}
	
	
	public TblUser getResponsible() {
		return responsible;
	}

	public void setResponsible(TblUser responsible) {
		this.responsible = responsible;
	}

	public TblUser getCreater() {
		return creater;
	}

	public void setCreater(TblUser creater) {
		this.creater = creater;
	}

	public Set getTblRecordses() {
		return this.tblRecordses;
	}

	public void setTblRecordses(Set tblRecordses) {
		this.tblRecordses = tblRecordses;
	}

	public Set getTblPlans() {
		return this.tblPlans;
	}

	public void setTblPlans(Set tblPlans) {
		this.tblPlans = tblPlans;
	}

}