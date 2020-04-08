package com.poobo.core.util;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.poobo.core.entity.TblPrivilege;
import com.poobo.core.entity.TblRole;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataPrivilege;

public class GetSessionData {
	public static TblUser  getUser(){
		return (TblUser)ServletActionContext.getRequest().getSession().getAttribute("USER");
	}
	
	
	public static List<TblPrivilege>  getPrivilegeList(){
		return (List<TblPrivilege>)ServletActionContext.getRequest().getSession().getAttribute("PRIS");
	}
	
	public static List<TblRole>  getRoleList(){
		return (List<TblRole>)ServletActionContext.getRequest().getSession().getAttribute("ROLES");
	}
	public static String getDataPrivilege(){
		List<TblRole> roleList = getRoleList();
		for(TblRole role : roleList){
			if(role.getDataPrivilege().equals(EnumDataPrivilege.SEEALL.getValue())){
				return EnumDataPrivilege.SEEALL.getValue();
			}
		}
		return EnumDataPrivilege.SEESELF.getValue();
	}
}
