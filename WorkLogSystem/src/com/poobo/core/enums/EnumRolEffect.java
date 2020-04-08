package com.poobo.core.enums;

public enum EnumRolEffect {
	ISEFFECT("1", "有效"), NOTEFFECT("0", "无效");
	
	private String value;
	private String desc;

	EnumRolEffect(String value, String desc) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public String getDesc() {
		return desc;
	}

	
	
	

}
