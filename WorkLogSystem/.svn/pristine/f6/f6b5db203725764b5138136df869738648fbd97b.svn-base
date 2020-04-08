package com.poobo.core.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.poobo.core.entity.TblPrivilege;
import com.poobo.core.entity.TblRole;
import com.poobo.core.entity.TblRolePrivilege;
import com.poobo.core.entity.TblUser;
import com.poobo.core.entity.TblUserRole;
import com.poobo.core.enums.EnumRolEffect;

public class SetUserInfo {
	public static void SetUserInfoToSession(TblUser user){
		List<TblPrivilege> privilegeList = new ArrayList<TblPrivilege>();
		List<TblRole> roleList = new ArrayList<TblRole>();
		Set<TblUserRole> userRoles = user.getTblUserRoles();
		// 获取用户的权限集合
		if (userRoles != null && userRoles.size() > 0) {
			for (TblUserRole userRole : userRoles) {
				TblRole role = userRole.getId().getTblRole();
				//设置登录用户的角色集合				
				roleList.add(role);
				//如果角色有效
				if(role.getIsEffect().equals(EnumRolEffect.ISEFFECT.getValue())){
				Set<TblRolePrivilege> rolePrivileges = role.getTblRolePrivileges();
				
				if (rolePrivileges != null && rolePrivileges.size() > 0) {
					for (TblRolePrivilege rolePrivilege : rolePrivileges) {
						TblPrivilege privilege = rolePrivilege.getId().getTblPrivilege();
						privilegeList.add(privilege);
					}
				}
			 }
			}
		}
		
		ServletActionContext.getRequest().getSession()
				.setAttribute("USER", user);
		ServletActionContext.getRequest().getSession()
				.setAttribute("ROLES", roleList);
		ServletActionContext.getRequest().getSession()
				.setAttribute("PRIS", privilegeList);
	}
}
