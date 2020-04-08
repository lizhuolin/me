package com.poobo.role.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.poobo.core.entity.TblPrivilege;
import com.poobo.core.entity.TblRole;
import com.poobo.core.entity.TblRolePrivilege;
import com.poobo.core.enums.EnumDataPrivilege;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;
import com.poobo.role.dao.IRoleDao;
import com.poobo.role.service.IRoleService;

@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<TblRole> implements IRoleService{
	
	
	private IRoleDao roleDao;
	@Resource 
	public void setRoleDao(IRoleDao roleDao) {
		super.setBaseDao(roleDao);
		this.roleDao =roleDao;
	}
	
	/**
	 * 逻辑删除角色
	 * @param idList
	 */
	public void delRoleByIds(String[] idList) {
		for(String id : idList){
			TblRole role = roleDao.findObjectById(id);
			role.setDataStatus(EnumDataStatus.DEL.getValue());
		}
	}


	/**
	 * 根据角色条件查询角色列表
	 * @param role
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageController<TblRole> findRoleList(TblRole role, int pageNow,
			int pageSize) {
		Criteria criteria = roleDao.createCriteria(TblRole.class);
		criteria.add(Restrictions.eq("dataStatus", EnumDataStatus.NORMAL.getValue()));
		if(!GetSessionData.getUser().getIsUserPlatform()){
			criteria.add(Restrictions.eq("tblCompany.companyId", GetSessionData.getUser().getTblCompany().getCompanyId()));
		}
		criteria.addOrder(Order.desc("createTime"));
		if(null != role){
			if(!StringUtils.isEmpty(role.getRoleName())){//解决输入%查询出所有
				 if(!role.getRoleName().equals("%")){
		      criteria.add(Restrictions.ilike("roleName", "%"  + role.getRoleName() +"%"));
				 }else{
				criteria.add(Restrictions.ilike("roleName", "%"  + "\\%"  +"%"));
				 }
			}
		  if(!StringUtils.isEmpty(role.getIsEffect()))
		    criteria.add(Restrictions.eq("isEffect",role.getIsEffect()));
		}
		return roleDao.findPageByCriteria(criteria, pageNow, pageSize);
	}

	/**
	 * 获取角色权限树
	 * @author hao.wang 2016年3月23日13:18:11
	 * @param roleId
	 * @param privilegeId
	 * @return
	 */
	public JSONArray getRolePrivilegeTree(String roleId, String privilegeId) {
		TblRole roleTemp = roleDao.findObjectById(roleId);
		JSONArray jsonArray = new JSONArray();
		return getPrivilegeArray(jsonArray, roleTemp, privilegeId);
	}
	
	
	public JSONArray getPrivilegeArray(JSONArray jsonArray, TblRole roleTemp,
			String privilegeId) {
		
		 StringBuffer hql=new StringBuffer();
		 hql.append(" from TblPrivilege where 1=1 ");
		 TblPrivilege p = new TblPrivilege();
		 p.setPrivilegeId(privilegeId);
		 Map<String, Object> namedParam= new HashMap<String, Object>();
		 namedParam.put("parentPrivilege", p);
		 namedParam.put("dataStatus", EnumDataStatus.NORMAL.getValue());
		 hql.append(" and parentPrivilege=:parentPrivilege");
		 hql.append(" and dataStatus=:dataStatus");
		 
		// hql.append(" order by sortIndex desc ");
		 
		 List<TblPrivilege> privilegeList= (List<TblPrivilege>) roleDao.findByNamedParam(hql.toString(), namedParam);
		 //获取当前用户所有的权限字符串
		 List<TblPrivilege> temp = GetSessionData.getPrivilegeList();
		 StringBuffer sb = new StringBuffer();
		 for (TblPrivilege tp : temp) {
			sb.append(tp.getCode());
			sb.append(",");
		}

		for (TblPrivilege privilege : privilegeList) {
		/*	Subject sub = SecurityUtils.getSubject(); 
			if ((sub.isPermitted(privilege.getCode())
					|| sub.hasRole(EnumRoleType.SUPER_ADMIN.getValue()))
					&&privilege.getDataStatus()==EnumDataStatus.NORMAL.getValue()) {
				// 有权限或者是超级管理员*/
			if(sb.toString().contains(privilege.getCode())){
				JSONObject json = new JSONObject();
				json.put("id", privilege.getPrivilegeId());
				json.put("name", privilege.getPrivilegeName());
				json.put("pId", privilege.getParentPrivilege().getPrivilegeId());
				// 判断是否为父节点
				if (!privilege.getChildPrivilege().isEmpty()) {
					json.put("isParent", true);
					// json.put("open", true);
					jsonArray = getPrivilegeArray(jsonArray, roleTemp,privilege.getPrivilegeId());
				} else {
					json.put("isParent", false);
				}
				if (null != roleTemp) {
					Iterator<TblRolePrivilege> ite = roleTemp.getTblRolePrivileges().iterator();
					while (ite.hasNext()) {
						TblRolePrivilege rolePrivilege = ite.next();
						if (privilege.getPrivilegeId().equals(rolePrivilege.getId().getTblPrivilege().getPrivilegeId())) {
							json.put("checked", true);
						}
					}
				}
			

				jsonArray.add(json);
			}

		}
		return jsonArray;
	}

	@Override
	public void removeRolePrivileges(String roleId) {
		roleDao.removeRolePrivileges(roleId);
	}

	@Override
	public List<TblRole> findRolesByCompanyId(String companyId) {
		return roleDao.findRolesByCompanyId(companyId);
	}

	@Override
	public List<TblRole> findRoles() {
		return roleDao.findRoles();
	}


}
