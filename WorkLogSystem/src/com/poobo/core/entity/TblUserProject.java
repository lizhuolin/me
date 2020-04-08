package com.poobo.core.entity;

/**
 * TblUserProject entity. @author MyEclipse Persistence Tools
 */

public class TblUserProject implements java.io.Serializable {

	// Fields

	private TblUserProjectId id;

	// Constructors

	/** default constructor */
	public TblUserProject() {
	}

	/** full constructor */
	public TblUserProject(TblUserProjectId id) {
		this.id = id;
	}

	// Property accessors

	public TblUserProjectId getId() {
		return this.id;
	}

	public void setId(TblUserProjectId id) {
		this.id = id;
	}

}