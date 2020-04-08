package com.poobo.role.action;

import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSONArray;
import com.poobo.changelog.service.IChangelogService;
import com.poobo.company.service.CompanyService;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblPrivilege;
import com.poobo.core.entity.TblRole;
import com.poobo.core.entity.TblRolePrivilege;
import com.poobo.core.entity.TblRolePrivilegeId;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.util.DateTimeUtil;
import com.poobo.core.util.ResultData;
import com.poobo.privilege.service.IPrivilegeService;
import com.poobo.role.service.IRoleService;

public class RoleAction extends BaseAction<TblRole>{
	
    @Resource 
    private IPrivilegeService privilegeService;
    @Resource 
    private CompanyService companyService;
	@Resource 
	private IRoleService roleService;
	@Resource
	private IChangelogService changelogService;
	private TblRole role;
	private TblCompany company;
	private  ResultData resultData;
	private List<TblPrivilege> privileges;
	private String privilegeIds;
	private String ids;
	private String privilegeId;
	private JSONArray jsonArray;
	
	//跳转到展示页面
	public String listUI(){
		pageList = roleService.findRoleList(role, pageNow, pageSize);
		return "listUI";
	}
	
	/***
	 * 
	 * @return
	 */
	
	//跳转到新增编辑页面
	public String editUI(){
		if(role != null){
			role = roleService.findObjectById(role.getRoleId());
			}
		return "editUI";
	}
	
   //改变角色状态
	public String delete(){
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList =ids.split("@");
			//保存操作日志
			StringBuffer changelogContent = new StringBuffer();
			for(String id : idList){
				changelogContent.append(roleService.findObjectById(id).getRoleName());
				changelogContent.append(",");
			}
			if(changelogContent.length() > 1){
			changelogContent.substring(0, changelogContent.length()-2);
			}
			changelogService.logRemable(changelogContent.toString(), 2, "角色");
			
			roleService.delRoleByIds(idList);
			resultData.setResultFlag(true); 
		}
		return SUCCESS;
	}

	
	/**
	 * 获取角色权限树
	 * @author hao.wang 2016年3月23日13:14:29
	 * @return
	 */
	public String rolePrivilegeTree() {
		if(StringUtils.isEmpty(privilegeId)){
			privilegeId="0";
		}
		jsonArray= roleService.getRolePrivilegeTree(role.getRoleId(), privilegeId);
		return SUCCESS;

	}
	
	

	/**
	 * 编辑角色权限
	 * @author hao.wang 2016年3月23日20:18:02
	 * @return
	 */
	public String doRolePermissionEdit(){
		/*if(null != role && StringUtils.isNotEmpty(role.getRoleId())){
			int i = roleService.eidtRolePermission(role,privilegeIds.split(","));
			//移除用户权限、角色缓存
			//Set<User> userSet=role.getUserSet();
			//userRealm.removeUserAuthorizationCache(userSet);
			if (i > 0) {
				resultData.setResultData("操作成功");
				resultData.setResultFlag(true);
			}
			
		}*/
			String[] privilegeIdss  = privilegeIds.split(",");
		
		resultData = new ResultData();
		
		if(role != null){
			//删除已存在的权限
			roleService.removeRolePrivileges(role.getRoleId());
			//保存现有的权限
			if(privilegeIdss.length > 1){
				HashSet<TblRolePrivilege> set = new HashSet<TblRolePrivilege>();
				for(int i = 0; i < privilegeIdss.length; i++){
					TblPrivilege pri = privilegeService.findObjectById(privilegeIdss[i]);
					set.add(new TblRolePrivilege(new TblRolePrivilegeId(pri,role)));
				}
				role.setTblRolePrivileges(set);
			}
		
		}
		
		if(StringUtils.isEmpty(role.getRoleId())){
			role.setDataStatus(EnumDataStatus.NORMAL.getValue());
			//设置角色所属公司
			TblUser user =  (TblUser) ServletActionContext.getRequest().getSession().getAttribute("USER");
			company = companyService.findObjectById(user.getTblCompany().getCompanyId());
			role.setTblCompany(company);
			//获取当前时间并保存
			role.setCreateTime(DateTimeUtil.getNowTimestamp());
			roleService.save(role);
			//保存操作日志
			changelogService.logRemable(role.getRoleName(), 0, "角色");
		}else{
			roleService.update(role);
			//保存操作日志
			changelogService.logRemable(role.getRoleName(), 1, "角色");
		}
		resultData.setResultFlag(true);
		return SUCCESS;
}		
	
	public TblRole getRole() {
		return role;
	}


	public void setRole(TblRole role) {
		this.role = role;
	}


	public ResultData getResultData() {
		return resultData;
	}


	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}


	public List<TblPrivilege> getPrivileges() {
		return privileges;
	}


	public void setPrivileges(List<TblPrivilege> privileges) {
		this.privileges = privileges;
	}


	public TblCompany getCompany() {
		return company;
	}


	public void setCompany(TblCompany company) {
		this.company = company;
	}




	public String getPrivilegeIds() {
		return privilegeIds;
	}

	public void setPrivilegeIds(String privilegeIds) {
		this.privilegeIds = privilegeIds;
	}

	public String getIds() {
		return ids;
	}


	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getPrivilegeId() {
		return privilegeId;
	}

	public void setPrivilegeId(String privilegeId) {
		this.privilegeId = privilegeId;
	}

	public JSONArray getJsonArray() {
		return jsonArray;
	}

	public void setJsonArray(JSONArray jsonArray) {
		this.jsonArray = jsonArray;
	}
	
}
