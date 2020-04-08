package com.poobo.core.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * TblChangelog entity. @author MyEclipse Persistence Tools
 */

public class TblChangelog implements java.io.Serializable {

	// Fields
	private String changelogId;
	private TblUser tblUser;
	private TblCompany tblCompany;
	private String changelogmodel;
	private String changelogContent;
	private Integer changelogType;
	private String changelogRemaks;
	private Integer dataStatus;
	private Timestamp changelogTime;
	private Timestamp createTime;
	
	public static List<String> MODEL_LIST;
	static {
		MODEL_LIST = new ArrayList();
		MODEL_LIST.add("任务");
		MODEL_LIST.add("项目");
		MODEL_LIST.add("项目人员");
		MODEL_LIST.add("子项目");
		MODEL_LIST.add("角色");
		MODEL_LIST.add("个人日志");
		MODEL_LIST.add("项目计划");
		MODEL_LIST.add("公司");
		MODEL_LIST.add("用户");
		MODEL_LIST.add("部门");
		MODEL_LIST.add("公告");
	}

	// Constructors

	/** default constructor */
	public TblChangelog() {
	}



	public String getChangelogId() {
		return changelogId;
	}



	public void setChangelogId(String changelogId) {
		this.changelogId = changelogId;
	}



	public TblUser getTblUser() {
		return this.tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}

	public String getChangelogContent() {
		return this.changelogContent;
	}

	public void setChangelogContent(String changelogContent) {
		this.changelogContent = changelogContent;
	}
	



	public Integer getChangelogType() {
		return this.changelogType;
	}

	public void setChangelogType(Integer changelogType) {
		this.changelogType = changelogType;
	}

	public String getChangelogRemaks() {
		return this.changelogRemaks;
	}

	public void setChangelogRemaks(String changelogRemaks) {
		this.changelogRemaks = changelogRemaks;
	}

	public Integer getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(Integer dataStatus) {
		this.dataStatus = dataStatus;
	}

	public Timestamp getChangelogTime() {
		return this.changelogTime;
	}

	public void setChangelogTime(Timestamp changelogTime) {
		this.changelogTime = changelogTime;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public TblCompany getTblCompany() {
		return tblCompany;
	}

	public void setTblCompany(TblCompany tblCompany) {
		this.tblCompany = tblCompany;
	}


	public String getChangelogmodel() {
		return changelogmodel;
	}


	public void setChangelogmodel(String changelogmodel) {
		this.changelogmodel = changelogmodel;
	}
	

}