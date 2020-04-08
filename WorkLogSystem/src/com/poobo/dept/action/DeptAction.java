package com.poobo.dept.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.poobo.changelog.service.IChangelogService;
import com.poobo.company.service.CompanyService;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblDept;
import com.poobo.core.entity.TblUser;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.ResultData;
import com.poobo.dept.service.IDeptService;
import com.poobo.user.service.IUserService;


public class DeptAction extends BaseAction {
	@Resource
	private IChangelogService changelogService;
	@Resource
	private IDeptService deptService;
	@Resource
	private CompanyService companyService;
	@Resource
	private IUserService userService;
	private TblDept dept;
	private ResultData resultData;
	private List<TblUser> userList;
	private String ids;
	
	public String listUI() {
		//pageList = deptService.getPageList(dept, pageNow, pageSize);
		pageList = deptService.findDeptList(dept, pageNow, pageSize);
		
		return "listUI";
	}

	/**
	 * 调到编辑界面
	 * @return
	 */
	public String editUI(){
		if(null!=dept && StringUtils.isNotEmpty(dept.getDeptId())){
			//编辑
			dept = deptService.findObjectById(dept.getDeptId());
			TblCompany company = companyService.findObjectById(dept.getTblCompany().getCompanyId());
			dept.setTblCompany(company);
		}
		TblUser user=GetSessionData.getUser();
		userList=userService.getUserListByCompanyId(user.getTblCompany().getCompanyId());
		return "editUI";
	}
	/**
	 * 执行编辑部门
	 * @return
	 */
	
	public String edit(){
		resultData = new ResultData();
		
		TblUser tblUser = GetSessionData.getUser();
		if(StringUtils.isEmpty(dept.getDeptId())){
			dept.setCreateTime(DateUtils.getCurrentDateTimeStamp());
			dept.setDataStatus(1);
			TblUser user =  (TblUser)ServletActionContext.getRequest().getSession().getAttribute("USER");
			TblCompany company = companyService.findObjectById(user.getTblCompany().getCompanyId());
			dept.setTblCompany(company);
			deptService.save(dept);
			//保存操作日志
			changelogService.logRemable(dept.getDeptName(), 0, "部门");
		}else{
			deptService.update(dept);
			changelogService.logRemable(dept.getDeptName(), 1, "部门");
		}
		resultData.setResultFlag(true);
		
		return SUCCESS;
	}

	
	public String deptDelete()
	{
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			//保存操作日志
			StringBuffer changelogContent = new StringBuffer();
			for(String id : idList){
				changelogContent.append(deptService.findObjectById(id).getDeptName());
				changelogContent.append(",");
			}
			if(changelogContent.length() > 1){
			changelogContent.substring(0, changelogContent.length()-2);
			}
			changelogService.logRemable(changelogContent.toString(), 2, "部门");
			
			deptService.delDeptByIds(idList);
			resultData.setResultFlag(true);
		}
		
		return SUCCESS;
		
	}

	public TblDept getDept() {
		return dept;
	}

	public void setDept(TblDept dept) {
		this.dept = dept;
	}

	public ResultData getResultData() {
		return resultData;
	}


	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public List<TblUser> getUserList() {
		return userList;
	}

	public void setUserList(List<TblUser> userList) {
		this.userList = userList;
	}

	

	
}
