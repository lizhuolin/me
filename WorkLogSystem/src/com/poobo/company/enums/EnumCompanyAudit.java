package com.poobo.company.enums;



/**
 * 公司审核状态枚举
 * @author 黄都比
 *
 */
public enum EnumCompanyAudit {
	C_PASS(true, "审核通过"), C_UNPASS(false, "审核未通过");

	private boolean value;
	private String desc;

	EnumCompanyAudit(boolean value, String desc) {
		this.value = value;
	}

	public boolean getValue() {
		return value;
	}

	public String getDesc() {
		return desc;
	}

	
	
	

}
