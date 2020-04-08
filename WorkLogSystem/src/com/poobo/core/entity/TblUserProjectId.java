package com.poobo.core.entity;

/**
 * TblUserProjectId entity. @author MyEclipse Persistence Tools
 */

public class TblUserProjectId implements java.io.Serializable {

	// Fields

	private TblProject tblProject;
	private TblUser tblUser;

	// Constructors

	/** default constructor */
	public TblUserProjectId() {
	}

	/** full constructor */
	public TblUserProjectId(TblProject tblProject, TblUser tblUser) {
		this.tblProject = tblProject;
		this.tblUser = tblUser;
	}

	// Property accessors

	public TblProject getTblProject() {
		return this.tblProject;
	}

	public void setTblProject(TblProject tblProject) {
		this.tblProject = tblProject;
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
		if (!(other instanceof TblUserProjectId))
			return false;
		TblUserProjectId castOther = (TblUserProjectId) other;

		return ((this.getTblProject() == castOther.getTblProject()) || (this
				.getTblProject() != null && castOther.getTblProject() != null && this
				.getTblProject().equals(castOther.getTblProject())))
				&& ((this.getTblUser() == castOther.getTblUser()) || (this
						.getTblUser() != null && castOther.getTblUser() != null && this
						.getTblUser().equals(castOther.getTblUser())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getTblProject() == null ? 0 : this.getTblProject()
						.hashCode());
		result = 37 * result
				+ (getTblUser() == null ? 0 : this.getTblUser().hashCode());
		return result;
	}

}