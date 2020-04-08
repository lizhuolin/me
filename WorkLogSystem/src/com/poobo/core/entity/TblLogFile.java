package com.poobo.core.entity;

/**
 * TblLogFile entity. @author MyEclipse Persistence Tools
 */

public class TblLogFile implements java.io.Serializable {

	// Fields

	private String tblLogFileId;
	private TblLog tblLog;
	private String fileUrl;

	// Constructors

	/** default constructor */
	public TblLogFile() {
	}

	/** full constructor */
	public TblLogFile(TblLog tblLog, String fileUrl) {
		this.tblLog = tblLog;
		this.fileUrl = fileUrl;
	}

	// Property accessors

	public String getTblLogFileId() {
		return this.tblLogFileId;
	}

	public void setTblLogFileId(String tblLogFileId) {
		this.tblLogFileId = tblLogFileId;
	}

	public TblLog getTblLog() {
		return this.tblLog;
	}

	public void setTblLog(TblLog tblLog) {
		this.tblLog = tblLog;
	}

	public String getFileUrl() {
		return this.fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

}