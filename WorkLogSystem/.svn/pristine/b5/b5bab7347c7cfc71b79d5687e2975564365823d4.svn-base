package com.poobo.wechat;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class MessageUtil {
	public MessageUtil() {
	}

	public static Map<String, String> parseXml(HttpServletRequest request)
			throws Exception {
		Map<String, String> map = new HashMap();

		InputStream inputStream = request.getInputStream();

		SAXReader reader = new SAXReader();
		Document document = reader.read(inputStream);

		Element root = document.getRootElement();

		List<Element> elementList = root.elements();

		for (Element e : elementList) {
			map.put(e.getName(), e.getText());
		}

		inputStream.close();
		inputStream = null;

		return map;
	}


}
