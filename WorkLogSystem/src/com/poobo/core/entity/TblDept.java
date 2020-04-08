package com.poobo.core.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TblDept entity. @author MyEclipse Persistence Tools
 */

public class TblDept implements java.io.Serializable {

	// Fields

	private String deptId;
	private TblCompany tblCompany;
	private String deptName;
	private String deptDecription;
	private TblUser manager;
	private Integer dataStatus;
	private Timestamp createTime;
	private Set tblUsers = new HashSet(0);


	public String getDeptId() {
		return this.deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public TblCompany getTblCompany() {
		return this.tblCompany;
	}

	public void setTblCompany(TblCompany tblCompany) {
		this.tblCompany = tblCompany;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptDecription() {
		return this.deptDecription;
	}

	public void setDeptDecription(String deptDecription) {
		this.deptDecription = deptDecription;
	}

	

	public TblUser getManager() {
		return manager;
	}

	public void setManager(TblUser manager) {
		this.manager = manager;
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

	public Set getTblUsers() {
		return this.tblUsers;
	}

	public void setTblUsers(Set tblUsers) {
		this.tblUsers = tblUsers;
	}

}