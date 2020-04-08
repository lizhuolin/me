package com.poobo.core.enums;

public enum EnumDataStatus {
	NORMAL(1, "正常"), DEL(0, "删除");
	
	private int value;
	private String desc;

	EnumDataStatus(int value, String desc) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}

	public String getDesc() {
		return desc;
	}

	
	
	

}
