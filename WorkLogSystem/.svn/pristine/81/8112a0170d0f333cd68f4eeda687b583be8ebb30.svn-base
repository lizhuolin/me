package com.poobo.core.util;

import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PropertyUtil {

	public static Properties configProperty = new Properties();
	public static Properties wechatProperty = new Properties();
	private static final Logger log = LoggerFactory.getLogger(PropertyUtil.class);
	
	static {
		try {
			//configProperty.load(PropertyUtil.class.getResourceAsStream("/../config/properties/config.properties"));
			//wechatProperty.load(PropertyUtil.class.getResourceAsStream("/../config/properties/wechat.properties"));
			wechatProperty.load(PropertyUtil.class.getResourceAsStream("/wechat.properties"));
		} catch (Exception e) {
			log.error("load properties error  "+e);
			//log.debug("加载properties文件失败");
		}
	}

}
