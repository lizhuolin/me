package com.poobo.core.entity;

/**
 * TblUserPrivilegeId entity. @author MyEclipse Persistence Tools
 */

public class TblUserPrivilegeId implements java.io.Serializable {

	// Fields

	private TblPrivilege tblPrivilege;
	private TblUser tblUser;

	// Constructors

	/** default constructor */
	public TblUserPrivilegeId() {
	}

	/** full constructor */
	public TblUserPrivilegeId(TblPrivilege tblPrivilege, TblUser tblUser) {
		this.tblPrivilege = tblPrivilege;
		this.tblUser = tblUser;
	}

	// Property accessors

	public TblPrivilege getTblPrivilege() {
		return this.tblPrivilege;
	}

	public void setTblPrivilege(TblPrivilege tblPrivilege) {
		this.tblPrivilege = tblPrivilege;
	}

	public TblUser getTblUser() {
		return this.tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TblUserPrivilegeId))
			return false;
		TblUserPrivilegeId castOther = (TblUserPrivilegeId) other;

		return ((this.getTblPrivilege() == castOther.getTblPrivilege()) || (this
				.getTblPrivilege() != null
				&& castOther.getTblPrivilege() != null && this
				.getTblPrivilege().equals(castOther.getTblPrivilege())))
				&& ((this.getTblUser() == castOther.getTblUser()) || (this
						.getTblUser() != null && castOther.getTblUser() != null && this
						.getTblUser().equals(castOther.getTblUser())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getTblPrivilege() == null ? 0 : this.getTblPrivilege()
						.hashCode());
		result = 37 * result
				+ (getTblUser() == null ? 0 : this.getTblUser().hashCode());
		return result;
	}

}