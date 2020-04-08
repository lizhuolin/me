package com.poobo.core.entity;

/**
 * TblUserTaskId entity. @author MyEclipse Persistence Tools
 */

public class TblUserTaskId implements java.io.Serializable {

	// Fields

	private String userId;
	private TblTask tblTask;

	// Constructors

	/** default constructor */
	public TblUserTaskId() {
	}

	/** full constructor */
	public TblUserTaskId(String userId, TblTask tblTask) {
		this.userId = userId;
		this.tblTask = tblTask;
	}

	// Property accessors

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public TblTask getTblTask() {
		return this.tblTask;
	}

	public void setTblTask(TblTask tblTask) {
		this.tblTask = tblTask;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TblUserTaskId))
			return false;
		TblUserTaskId castOther = (TblUserTaskId) other;

		return ((this.getUserId() == castOther.getUserId()) || (this
				.getUserId() != null && castOther.getUserId() != null && this
				.getUserId().equals(castOther.getUserId())))
				&& ((this.getTblTask() == castOther.getTblTask()) || (this
						.getTblTask() != null && castOther.getTblTask() != null && this
						.getTblTask().equals(castOther.getTblTask())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUserId() == null ? 0 : this.getUserId().hashCode());
		result = 37 * result
				+ (getTblTask() == null ? 0 : this.getTblTask().hashCode());
		return result;
	}

}