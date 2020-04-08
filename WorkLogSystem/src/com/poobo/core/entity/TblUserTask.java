package com.poobo.core.entity;

/**
 * TblUserTask entity. @author MyEclipse Persistence Tools
 */

public class TblUserTask implements java.io.Serializable {

	// Fields

	private TblUserTaskId id;

	// Constructors

	/** default constructor */
	public TblUserTask() {
	}

	/** full constructor */
	public TblUserTask(TblUserTaskId id) {
		this.id = id;
	}

	// Property accessors

	public TblUserTaskId getId() {
		return this.id;
	}

	public void setId(TblUserTaskId id) {
		this.id = id;
	}

}