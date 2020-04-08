package com.poobo.core.entity;

/**
 * TblUserPrivilege entity. @author MyEclipse Persistence Tools
 */

public class TblUserPrivilege implements java.io.Serializable {

	// Fields

	private TblUserPrivilegeId id;
	private TblUser tblUser;
	private TblPrivilege tblPrivilege;

	// Constructors

	/** default constructor */
	public TblUserPrivilege() {
	}

	/** minimal constructor */
	public TblUserPrivilege(TblUserPrivilegeId id) {
		this.id = id;
	}

	/** full constructor */
	public TblUserPrivilege(TblUserPrivilegeId id, TblUser tblUser,
			TblPrivilege tblPrivilege) {
		this.id = id;
		this.tblUser = tblUser;
		this.tblPrivilege = tblPrivilege;
	}

	// Property accessors

	public TblUserPrivilegeId getId() {
		return this.id;
	}

	public void setId(TblUserPrivilegeId id) {
		this.id = id;
	}

	public TblUser getTblUser() {
		return this.tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}

	public TblPrivilege getTblPrivilege() {
		return this.tblPrivilege;
	}

	public void setTblPrivilege(TblPrivilege tblPrivilege) {
		this.tblPrivilege = tblPrivilege;
	}

}