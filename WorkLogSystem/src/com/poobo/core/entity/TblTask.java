package com.poobo.core.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * TblTask entity. @author MyEclipse Persistence Tools
 */

public class TblTask implements java.io.Serializable {

	// Fields

	private String taskId;
	private TblUser tblUser;
	private TblCompany tblCompany;
	private String taskMsg;
	private Timestamp taskStartTime;
	private Timestamp taskEndTime;
	private Timestamp taskRealStartTime;
	private Timestamp taskRealEndTime;
	private Integer dataStatus;
	private Timestamp createTime;
	private String taskRemaks;
	private Integer taskLevel;
	private Integer taskTime;
	private String taskTarget;
	private TblUser taskResponsible;
	private String taskProgress;
	private TblUser createrUser;
	private Boolean isPush;
	private String taskDesc;
	private Set tblUserTasks = new HashSet(0);
	public Object getId;

	public static List<String> PROGRESS_LIST;
	static {
		PROGRESS_LIST = new ArrayList();
		PROGRESS_LIST.add("0%");
		PROGRESS_LIST.add("10%");
		PROGRESS_LIST.add("20%");
		PROGRESS_LIST.add("30%");
		PROGRESS_LIST.add("40%");
		PROGRESS_LIST.add("50%");
		PROGRESS_LIST.add("60%");
		PROGRESS_LIST.add("70%");
		PROGRESS_LIST.add("80%");
		PROGRESS_LIST.add("90%");
		PROGRESS_LIST.add("100%");
	}

	// Constructors

	/** default constructor */
	public TblTask() {
	}


	// Property accessors

	public String getTaskId() {
		return this.taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public TblUser getTblUser() {
		return this.tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}

	public TblCompany getTblCompany() {
		return this.tblCompany;
	}

	public void setTblCompany(TblCompany tblCompany) {
		this.tblCompany = tblCompany;
	}

	public String getTaskMsg() {
		return this.taskMsg;
	}

	public void setTaskMsg(String taskMsg) {
		this.taskMsg = taskMsg;
	}

	public Timestamp getTaskStartTime() {
		return this.taskStartTime;
	}

	public void setTaskStartTime(Timestamp taskStartTime) {
		this.taskStartTime = taskStartTime;
	}

	public Timestamp getTaskEndTime() {
		return this.taskEndTime;
	}

	public void setTaskEndTime(Timestamp taskEndTime) {
		this.taskEndTime = taskEndTime;
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

	public String getTaskRemaks() {
		return this.taskRemaks;
	}

	public void setTaskRemaks(String taskRemaks) {
		this.taskRemaks = taskRemaks;
	}

	public Integer getTaskLevel() {
		return this.taskLevel;
	}

	public void setTaskLevel(Integer taskLevel) {
		this.taskLevel = taskLevel;
	}

	public Integer getTaskTime() {
		return this.taskTime;
	}

	public void setTaskTime(Integer taskTime) {
		this.taskTime = taskTime;
	}

	public String getTaskTarget() {
		return this.taskTarget;
	}

	public void setTaskTarget(String taskTarget) {
		this.taskTarget = taskTarget;
	}


	public String getTaskProgress() {
		return this.taskProgress;
	}

	public void setTaskProgress(String taskProgress) {
		this.taskProgress = taskProgress;
	}

	


	public TblUser getTaskResponsible() {
		return taskResponsible;
	}


	public void setTaskResponsible(TblUser taskResponsible) {
		this.taskResponsible = taskResponsible;
	}


	public TblUser getCreaterUser() {
		return createrUser;
	}

	public void setCreaterUser(TblUser createrUser) {
		this.createrUser = createrUser;
	}

	public Set getTblUserTasks() {
		return this.tblUserTasks;
	}

	public void setTblUserTasks(Set tblUserTasks) {
		this.tblUserTasks = tblUserTasks;
	}

	public Boolean getIsPush() {
		return isPush;
	}

	public void setIsPush(Boolean isPush) {
		this.isPush = isPush;
	}


	public Timestamp getTaskRealStartTime() {
		return taskRealStartTime;
	}


	public void setTaskRealStartTime(Timestamp taskRealStartTime) {
		this.taskRealStartTime = taskRealStartTime;
	}


	public Timestamp getTaskRealEndTime() {
		return taskRealEndTime;
	}


	public void setTaskRealEndTime(Timestamp taskRealEndTime) {
		this.taskRealEndTime = taskRealEndTime;
	}


	public String getTaskDesc() {
		return taskDesc;
	}


	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}


	public Object getGetId() {
		return getId;
	}


	public void setGetId(Object getId) {
		this.getId = getId;
	}

}