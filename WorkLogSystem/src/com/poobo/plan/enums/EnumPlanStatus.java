package com.poobo.plan.enums;

public enum EnumPlanStatus {
	 N_START(0, "未开始"), ING(1, "进行中"), OVER(2, "已结束");
		
		private int value;
		private String desc;

		EnumPlanStatus(int value, String desc) {
			this.value = value;
			this.desc = desc;
		}

		public int getValue() {
			return value;
		}

		public String getDesc() {
			return desc;
		}
}
