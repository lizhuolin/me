package com.poobo.core.entity;

import java.sql.Timestamp;

/**
 * TblReportwarn entity. @author MyEclipse Persistence Tools
 */

public class TblReportwarn implements java.io.Serializable {

	// Fields

	private String reportwarnId;
	private TblUser tblUser;
	private TblTask tblTask;
	private TblPlan tblPlan;
	private Timestamp createTime;
	private Integer dataStatus;
	private TblLog tblLog;
	private String type;

	// Constructors

	/** default constructor */
	public TblReportwarn() {
	}


	// Property accessors

	public String getReportwarnId() {
		return this.reportwarnId;
	}

	public void setReportwarnId(String reportwarnId) {
		this.reportwarnId = reportwarnId;
	}

	public TblUser getTblUser() {
		return this.tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}


	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Integer getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(Integer dataStatus) {
		this.dataStatus = dataStatus;
	}


	public TblTask getTblTask() {
		return tblTask;
	}

	public void setTblTask(TblTask tblTask) {
		this.tblTask = tblTask;
	}

	public TblPlan getTblPlan() {
		return tblPlan;
	}

	public void setTblPlan(TblPlan tblPlan) {
		this.tblPlan = tblPlan;
	}


	public TblLog getTblLog() {
		return tblLog;
	}


	public void setTblLog(TblLog tblLog) {
		this.tblLog = tblLog;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}

}