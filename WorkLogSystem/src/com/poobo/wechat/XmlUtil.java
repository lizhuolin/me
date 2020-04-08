package com.poobo.wechat;

import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.xml.sax.InputSource;


public class XmlUtil {
	private static Logger log = Logger.getLogger(XmlUtil.class);
	/**
	 * 组装xml
	 * @param params
	 * @return
	 */
	public static String toXml(List<NameValuePair> params) {
		StringBuilder sb = new StringBuilder();
		sb.append("<xml>");
		for (int i = 0; i < params.size(); i++) {
			sb.append("<"+params.get(i).getName()+">");


			sb.append(params.get(i).getValue());
			sb.append("</"+params.get(i).getName()+">");
		}
		sb.append("</xml>");

		return sb.toString();
	}
	
	public static Map<String, String> parseXMLToMap(String content){
		Map<String, String> map = new HashMap<String, String>();
		try {
			InputSource is = new InputSource(new StringReader(content));   
			Document doc = new SAXReader().read(is);
			
			Element root = doc.getRootElement();
			List<Element> children = root.elements();
			for(Element ele : children){
				map.put(ele.getName(), ele.getTextTrim());
			}
			if(map.size() <= 0){
				map = null;
			}
		} catch (Exception e) {
			log.error("解析xml失败!");
			e.printStackTrace();
			map = null;
		}
		return map;
	}
}
