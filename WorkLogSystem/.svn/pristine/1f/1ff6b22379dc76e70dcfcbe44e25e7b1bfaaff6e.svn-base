package com.poobo.privilege.action;

import javax.annotation.Resource;

import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.Demo;
import com.poobo.core.entity.TblPrivilege;
import com.poobo.core.util.ResultData;
import com.poobo.demo.service.IDemoService;
import com.poobo.privilege.service.IPrivilegeService;

public class PrivilegeAction extends BaseAction {
	@Resource
	private IPrivilegeService privilegeService;
	private ResultData resultData;
	private TblPrivilege privilege;

	/**
	 * 跳转到权限展示页面
	 * @return
	 */
	public String listUI(){
		pageList = privilegeService.getPageList(privilege, pageNow, pageSize);
		return "listUI";
	}
	/**
	 * 跳转到编辑页面
	 * @return
	 */
	public String editUI(){
		if(privilege != null){
			privilege = privilegeService.findObjectById(privilege.getPrivilegeId());
			}
		return "editUI";
	}
	/**
	 * 保存编辑结果
	 * @return
	 */
	public String edit() {
		resultData = new ResultData();
		if(privilege != null){
			TblPrivilege temp = privilegeService.findObjectById(privilege.getPrivilegeId());
			temp.setPrivilegeName(privilege.getPrivilegeName());
			temp.setPrivilegeDescription(privilege.getPrivilegeDescription());
			privilegeService.update(temp);
		}
		resultData.setResultFlag(true);

		return SUCCESS;
	}








	public ResultData getResultData() {
		return resultData;
	}

	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}

	public TblPrivilege getPrivilege() {
		return privilege;
	}

	public void setPrivilege(TblPrivilege privilege) {
		this.privilege = privilege;
	}

}
