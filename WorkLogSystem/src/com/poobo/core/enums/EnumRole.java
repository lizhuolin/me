package com.poobo.core.enums;

public enum EnumRole {
	SUPERADMIN("0", "超级管理员"), CADMIN("1", "公司管理员"),PUSER("2","平台用户"),CUSER("3","公司用户");
	
	private String value;
	private String desc;

	EnumRole(String value, String desc) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public String getDesc() {
		return desc;
	}

	
	
	

}
