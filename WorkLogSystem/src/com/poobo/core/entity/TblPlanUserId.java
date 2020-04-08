package com.poobo.core.entity;

/**
 * TblPlanUserId entity. @author MyEclipse Persistence Tools
 */

public class TblPlanUserId implements java.io.Serializable {

	// Fields

	private TblUser tblUser;
	private TblPlan tblPlan;

	// Constructors

	/** default constructor */
	public TblPlanUserId() {
	}

	/** full constructor */
	public TblPlanUserId(TblUser tblUser, TblPlan tblPlan) {
		this.tblUser = tblUser;
		this.tblPlan = tblPlan;
	}

	// Property accessors

	public TblUser getTblUser() {
		return this.tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}

	public TblPlan getTblPlan() {
		return this.tblPlan;
	}

	public void setTblPlan(TblPlan tblPlan) {
		this.tblPlan = tblPlan;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TblPlanUserId))
			return false;
		TblPlanUserId castOther = (TblPlanUserId) other;

		return ((this.getTblUser() == castOther.getTblUser()) || (this
				.getTblUser() != null && castOther.getTblUser() != null && this
				.getTblUser().equals(castOther.getTblUser())))
				&& ((this.getTblPlan() == castOther.getTblPlan()) || (this
						.getTblPlan() != null && castOther.getTblPlan() != null && this
						.getTblPlan().equals(castOther.getTblPlan())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getTblUser() == null ? 0 : this.getTblUser().hashCode());
		result = 37 * result
				+ (getTblPlan() == null ? 0 : this.getTblPlan().hashCode());
		return result;
	}

}