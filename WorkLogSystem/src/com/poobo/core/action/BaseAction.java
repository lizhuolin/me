package com.poobo.core.action;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.poobo.core.util.PageController;
import com.poobo.wechat.core.WechatRequest;

public abstract class BaseAction<E> extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	protected HttpServletResponse response;
	public PageController<E> pageList;
	public int pageNow = 1;
	public int pageSize = 10;
	public int rowIndex= 0;
	
	
	protected String toJson(String jsonStr) {
		if(jsonStr==null) return null;
		
		OutputStream os=null;
		try {
			response.setHeader("Pragma","No-cache");
			response.setHeader("Cache-Control","no-cache");
			response.setDateHeader("Expires", 0);
			
			os=response.getOutputStream();
			os.write(jsonStr.getBytes("utf8"));
			response.flushBuffer();
		} catch (Exception e) {
			//log.error(e.toString(),e);
			e.printStackTrace();
		} finally {
			if(os!=null) {
				try {
					os.close();
				} catch (IOException e) {
				}
			}
		}
		
		return null;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		
	}

	public PageController<E> getPageList() {
		return pageList;
	}
	public void setPageList(PageController<E> pageList) {
		this.pageList = pageList;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRowIndex() {
		return rowIndex;
	}
	public void setRowIndex(int rowIndex) {
		this.rowIndex = rowIndex;
	}
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;
	}

}
