package com.poobo.core.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * TblNotice entity. @author MyEclipse Persistence Tools
 */

public class TblNotice implements java.io.Serializable {

	// Fields

	private String noticeId;
	private TblUser tblUser;
	private TblCompany tblCompany;
	private Timestamp noticeCreatetime;
	private String noticeMsg;
	private Integer dataStatus;
	private Timestamp noticeStartTime;
	private Timestamp noticeEndTime;
	private String noticeCreaterId;
	private String noticeIntroduction;
	private String noticeTitle;
	private String image;
	// Constructors

	/** default constructor */
	public TblNotice() {
	}


	// Property accessors

	public String getNoticeId() {
		return this.noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
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

	public Timestamp getNoticeCreatetime() {
		return this.noticeCreatetime;
	}

	public Date getNoticeStartTime() {
		return noticeStartTime;
	}




	public Date getNoticeEndTime() {
		return noticeEndTime;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}




	public void setNoticeStartTime(Timestamp noticeStartTime) {
		this.noticeStartTime = noticeStartTime;
	}


	public void setNoticeEndTime(Timestamp noticeEndTime) {
		this.noticeEndTime = noticeEndTime;
	}


	public void setNoticeCreatetime(Timestamp noticeCreatetime) {
		this.noticeCreatetime = noticeCreatetime;
	}

	public String getNoticeMsg() {
		return this.noticeMsg;
	}

	public void setNoticeMsg(String noticeMsg) {
		this.noticeMsg = noticeMsg;
	}


	public Integer getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(Integer dataStatus) {
		this.dataStatus = dataStatus;
	}



	public String getNoticeCreaterId() {
		return this.noticeCreaterId;
	}

	public void setNoticeCreaterId(String noticeCreaterId) {
		this.noticeCreaterId = noticeCreaterId;
	}

	public String getNoticeIntroduction() {
		return this.noticeIntroduction;
	}

	public void setNoticeIntroduction(String noticeIntroduction) {
		this.noticeIntroduction = noticeIntroduction;
	}

	public String getNoticeTitle() {
		return this.noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

}