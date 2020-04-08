package com.poobo.core.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TblCompany entity. @author MyEclipse Persistence Tools
 */

public class TblCompany implements java.io.Serializable {

	// Fields

	private String companyId;
	private String companyName;
	private String companyMobile;
	private String companyAdress;
	private Boolean isVerification;
	private String charter;
	private String companyAdmin;
	private Integer dataStatus;
	private Timestamp createTime;
	private String companyType;
	private String companyIntroduction;
	private String companyLogo;
	private Boolean isFreeze;
	private TblUser gsAdmin;
	private String idcard;
	private String email;
	private Set tblUsers = new HashSet(0);
	private Set tblTimereports = new HashSet(0);
	private Set tblTasks = new HashSet(0);
	private Set tblRoles = new HashSet(0);
	private Set tblDepts = new HashSet(0);
	private Set tblProjects = new HashSet(0);
	private Set tblTasks_1 = new HashSet(0);

	// Constructors

	/** default constructor */
	public TblCompany() {
	}


	// Property accessors

	public String getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyMobile() {
		return this.companyMobile;
	}

	public void setCompanyMobile(String companyMobile) {
		this.companyMobile = companyMobile;
	}

	public String getCompanyAdress() {
		return this.companyAdress;
	}

	public void setCompanyAdress(String companyAdress) {
		this.companyAdress = companyAdress;
	}

	public Boolean getIsVerification() {
		return this.isVerification;
	}

	public void setIsVerification(Boolean isVerification) {
		this.isVerification = isVerification;
	}

	public String getCharter() {
		return this.charter;
	}

	public void setCharter(String charter) {
		this.charter = charter;
	}




	public String getIdcard() {
		return idcard;
	}


	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getCompanyAdmin() {
		return companyAdmin;
	}


	public void setCompanyAdmin(String companyAdmin) {
		this.companyAdmin = companyAdmin;
	}

	

	public TblUser getGsAdmin() {
		return gsAdmin;
	}


	public void setGsAdmin(TblUser gsAdmin) {
		this.gsAdmin = gsAdmin;
	}


	public Integer getDataStatus() {
		return this.dataStatus;
	}

	public void setDataStatus(Integer dataStatus) {
		this.dataStatus = dataStatus;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getCompanyType() {
		return this.companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getCompanyIntroduction() {
		return this.companyIntroduction;
	}

	public void setCompanyIntroduction(String companyIntroduction) {
		this.companyIntroduction = companyIntroduction;
	}

	public String getCompanyLogo() {
		return this.companyLogo;
	}

	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}

	public Set getTblUsers() {
		return this.tblUsers;
	}

	public void setTblUsers(Set tblUsers) {
		this.tblUsers = tblUsers;
	}

	public Set getTblTimereports() {
		return this.tblTimereports;
	}

	public void setTblTimereports(Set tblTimereports) {
		this.tblTimereports = tblTimereports;
	}

	public Set getTblTasks() {
		return this.tblTasks;
	}

	public void setTblTasks(Set tblTasks) {
		this.tblTasks = tblTasks;
	}

	public Set getTblRoles() {
		return this.tblRoles;
	}

	public void setTblRoles(Set tblRoles) {
		this.tblRoles = tblRoles;
	}

	public Set getTblDepts() {
		return this.tblDepts;
	}

	public void setTblDepts(Set tblDepts) {
		this.tblDepts = tblDepts;
	}


	public Set getTblProjects() {
		return this.tblProjects;
	}

	public void setTblProjects(Set tblProjects) {
		this.tblProjects = tblProjects;
	}

	public Set getTblTasks_1() {
		return this.tblTasks_1;
	}

	public void setTblTasks_1(Set tblTasks_1) {
		this.tblTasks_1 = tblTasks_1;
	}


	public Boolean getIsFreeze() {
		return isFreeze;
	}


	public void setIsFreeze(Boolean isFreeze) {
		this.isFreeze = isFreeze;
	}

}