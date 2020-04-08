package com.poobo.role.service;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.poobo.core.entity.TblRole;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface IRoleService extends IBaseService<TblRole>{
	
	/**
	 * 逻辑删除角色
	 * @param idList
	 */
	public void delRoleByIds(String[] idList);
	
	/**
	 * 根据角色条件查询角色列表
	 * @param role
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageController<TblRole> findRoleList(TblRole role, int pageNow,
			int pageSize);

	/**
	 * 获取角色权限树
	 * @author hao.wang 2016年3月23日13:18:11
	 * @param roleId
	 * @param permissionId
	 * @return
	 */
	public JSONArray getRolePrivilegeTree(String roleId,String privilegeId);


	/**
	 * 删除现有权限
	 * @author hao.wang 2016年3月24日10:49:51
	 * @return
	 */
	public void removeRolePrivileges(String roleId);

	/**
	 * 根据公司id查找公司所有角色
	 * @author hao.wang 2016年3月29日11:05:36
	 * @return
	 */
	public List<TblRole> findRolesByCompanyId(String companyId);

	public List<TblRole> findRoles();
}
