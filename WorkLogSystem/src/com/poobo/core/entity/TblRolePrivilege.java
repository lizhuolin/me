package com.poobo.core.entity;

/**
 * TblRolePrivilege entity. @author MyEclipse Persistence Tools
 */

public class TblRolePrivilege implements java.io.Serializable {

	// Fields

	private TblRolePrivilegeId id;

	// Constructors

	/** default constructor */
	public TblRolePrivilege() {
	}

	/** full constructor */
	public TblRolePrivilege(TblRolePrivilegeId id) {
		this.id = id;
	}

	// Property accessors

	public TblRolePrivilegeId getId() {
		return this.id;
	}

	public void setId(TblRolePrivilegeId id) {
		this.id = id;
	}

}