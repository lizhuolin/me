package com.poobo.core.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSON;
import com.poobo.core.util.ResultData;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		if(StringUtils.isEmpty(path)){
			path = "http://www.poobo.com.cn";
		}
		//判断当前请求地址是否是登录或注册的请求地址
		if(!(uri.toLowerCase().contains("login") || uri.toLowerCase().contains("registe") || uri.contains("fileoperate") || uri.toLowerCase().contains("download"))){
			//非登录请求
			if(request.getSession().getAttribute("USER") != null){
				if(request.getHeader("referer")!= null || uri.contains("/mobile/")){
					chain.doFilter(request, response);
				}else{
					response.sendRedirect(path);
				}
			} else {
				//没有登录，跳转到登录页面
				if(uri.contains("/mobile/")){
					response.sendRedirect(path + "/mobile/user/mobile_loginUI.action");
				}else{
					response.sendRedirect(path + "/user/user_loginUI.action");
				}
			}
		} else {
			//登录请求；直接放行
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}

