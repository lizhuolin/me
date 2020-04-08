package com.poobo.core.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * TblPrivilege entity. @author MyEclipse Persistence Tools
 */

public class TblPrivilege implements java.io.Serializable {

	// Fields

	private String privilegeId;
	private String privilegeName;
	private String privilegeDescription;
	private TblPrivilege parentPrivilege;
	private Integer dataStatus;
	private String code;
	private Set<TblPrivilege> childPrivilege;
	private Set tblUserPrivileges = new HashSet(0);
	private Set tblRolePrivileges = new HashSet(0);

	
	// Constructors

	/** default constructor */
	public TblPrivilege() {
	}


	// Property accessors

	public String getPrivilegeId() {
		return this.privilegeId;
	}

	public void setPrivilegeId(String privilegeId) {
		this.privilegeId = privilegeId;
	}

	public String getPrivilegeName() {
		return this.privilegeName;
	}

	public void setPrivilegeName(String privilegeName) {
		this.privilegeName = privilegeName;
	}

	public String getPrivilegeDescription() {
		return this.privilegeDescription;
	}

	public void setPrivilegeDescription(String privilegeDescription) {
		this.privilegeDescription = privilegeDescription;
	}


	public TblPrivilege getParentPrivilege() {
		return parentPrivilege;
	}


	public void setParentPrivilege(TblPrivilege parentPrivilege) {
		this.parentPrivilege = parentPrivilege;
	}


	public Integer getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(Integer dataStatus) {
		this.dataStatus = dataStatus;
	}

	public Set getTblUserPrivileges() {
		return this.tblUserPrivileges;
	}

	public void setTblUserPrivileges(Set tblUserPrivileges) {
		this.tblUserPrivileges = tblUserPrivileges;
	}

	public Set getTblRolePrivileges() {
		return this.tblRolePrivileges;
	}

	public void setTblRolePrivileges(Set tblRolePrivileges) {
		this.tblRolePrivileges = tblRolePrivileges;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public Set<TblPrivilege> getChildPrivilege() {
		return childPrivilege;
	}


	public void setChildPrivilege(Set<TblPrivilege> childPrivilege) {
		this.childPrivilege = childPrivilege;
	}


	
	
}