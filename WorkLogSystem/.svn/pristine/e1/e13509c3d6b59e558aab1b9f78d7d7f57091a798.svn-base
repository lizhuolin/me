package com.poobo.core.entity;

/**
 * TblRolePrivilegeId entity. @author MyEclipse Persistence Tools
 */

public class TblRolePrivilegeId implements java.io.Serializable {

	// Fields

	private TblPrivilege tblPrivilege;
	private TblRole tblRole;

	// Constructors

	/** default constructor */
	public TblRolePrivilegeId() {
	}

	/** full constructor */
	public TblRolePrivilegeId(TblPrivilege tblPrivilege, TblRole tblRole) {
		this.tblPrivilege = tblPrivilege;
		this.tblRole = tblRole;
	}

	// Property accessors

	public TblPrivilege getTblPrivilege() {
		return this.tblPrivilege;
	}

	public void setTblPrivilege(TblPrivilege tblPrivilege) {
		this.tblPrivilege = tblPrivilege;
	}

	public TblRole getTblRole() {
		return this.tblRole;
	}

	public void setTblRole(TblRole tblRole) {
		this.tblRole = tblRole;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TblRolePrivilegeId))
			return false;
		TblRolePrivilegeId castOther = (TblRolePrivilegeId) other;

		return ((this.getTblPrivilege() == castOther.getTblPrivilege()) || (this
				.getTblPrivilege() != null
				&& castOther.getTblPrivilege() != null && this
				.getTblPrivilege().equals(castOther.getTblPrivilege())))
				&& ((this.getTblRole() == castOther.getTblRole()) || (this
						.getTblRole() != null && castOther.getTblRole() != null && this
						.getTblRole().equals(castOther.getTblRole())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getTblPrivilege() == null ? 0 : this.getTblPrivilege()
						.hashCode());
		result = 37 * result
				+ (getTblRole() == null ? 0 : this.getTblRole().hashCode());
		return result;
	}

}