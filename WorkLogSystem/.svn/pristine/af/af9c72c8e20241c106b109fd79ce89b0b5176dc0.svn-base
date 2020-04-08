package com.poobo.core.entity;

import java.sql.Timestamp;

/**
 * TblRecords entity. @author MyEclipse Persistence Tools
 */

public class TblRecords implements java.io.Serializable {

	// Fields

	private String recodeId;
	private TblProject tblProject;
	private TblProjectChild tblProjectChild;
	private TblPlan tblPlan;
	private String recodeMsg;
	private Timestamp recodeOperate;
	private Integer dataStatus;
	private Timestamp createTime;
	private String changeId;
	private String remark;

	// Constructors

	/** default constructor */
	public TblRecords() {
	}

	/** minimal constructor */
	public TblRecords(TblProject tblProject, TblProjectChild tblProjectChild,
			TblPlan tblPlan, Integer dataStatus, String changeId) {
		this.tblProject = tblProject;
		this.tblProjectChild = tblProjectChild;
		this.tblPlan = tblPlan;
		this.dataStatus = dataStatus;
		this.changeId = changeId;
	}

	/** full constructor */
	public TblRecords(TblProject tblProject, TblProjectChild tblProjectChild,
			TblPlan tblPlan, String recodeMsg, Timestamp recodeOperate,
			Integer dataStatus, Timestamp createTime, String changeId,
			String remark) {
		this.tblProject = tblProject;
		this.tblProjectChild = tblProjectChild;
		this.tblPlan = tblPlan;
		this.recodeMsg = recodeMsg;
		this.recodeOperate = recodeOperate;
		this.dataStatus = dataStatus;
		this.createTime = createTime;
		this.changeId = changeId;
		this.remark = remark;
	}

	// Property accessors

	public String getRecodeId() {
		return this.recodeId;
	}

	public void setRecodeId(String recodeId) {
		this.recodeId = recodeId;
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

	public TblPlan getTblPlan() {
		return this.tblPlan;
	}

	public void setTblPlan(TblPlan tblPlan) {
		this.tblPlan = tblPlan;
	}

	public String getRecodeMsg() {
		return this.recodeMsg;
	}

	public void setRecodeMsg(String recodeMsg) {
		this.recodeMsg = recodeMsg;
	}

	public Timestamp getRecodeOperate() {
		return this.recodeOperate;
	}

	public void setRecodeOperate(Timestamp recodeOperate) {
		this.recodeOperate = recodeOperate;
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

	public String getChangeId() {
		return this.changeId;
	}

	public void setChangeId(String changeId) {
		this.changeId = changeId;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}