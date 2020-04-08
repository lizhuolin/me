package com.poobo.core.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * TblTease entity. @author MyEclipse Persistence Tools
 */

public class TblTease implements java.io.Serializable {

	// Fields

	private String teaseId;
	private TblUser tblUser;
	private TblCompany tblCompany;
	private String teaseTitle;
	private String teaseContent;
	private String teasePart;
	private Integer dataStatus;
	private Timestamp createTime;
	private String replyMsg;
	public TblTease() {
	}


	public String getTeaseId() {
		return this.teaseId;
	}

	public void setTeaseId(String teaseId) {
		this.teaseId = teaseId;
	}

	public TblUser getTblUser() {
		return this.tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}

	public TblCompany getTblCompany() {
		return this.tblCompany;
	}

	public void setTblCompany(TblCompany tblCompany) {
		this.tblCompany = tblCompany;
	}

	public String getTeaseTitle() {
		return this.teaseTitle;
	}

	public void setTeaseTitle(String teaseTitle) {
		this.teaseTitle = teaseTitle;
	}

	public String getTeaseContent() {
		return this.teaseContent;
	}

	public void setTeaseContent(String teaseContent) {
		this.teaseContent = teaseContent;
	}

	public String getTeasePart() {
		return this.teasePart;
	}

	public void setTeasePart(String teasePart) {
		this.teasePart = teasePart;
	}

	public Integer getDataStatus() {
		return dataStatus;
	}

	public void setDataStatus(Integer dataStatus) {
		this.dataStatus = dataStatus;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}


	public String getReplyMsg() {
		return replyMsg;
	}


	public void setReplyMsg(String replyMsg) {
		this.replyMsg = replyMsg;
	}

}