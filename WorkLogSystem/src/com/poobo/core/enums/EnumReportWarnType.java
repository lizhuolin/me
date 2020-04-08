package com.poobo.core.enums;

public enum EnumReportWarnType {
	TASK("0", "任务"), PLAN("1", "计划"),LOG("2","日志");
	
	private String value;
	private String desc;

	EnumReportWarnType(String value, String desc) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public String getDesc() {
		return desc;
	}

	
	
	

}
