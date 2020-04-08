package com.poobo.task.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.poobo.changelog.service.IChangelogService;
import com.poobo.company.service.CompanyService;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblLogDetail;
import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblTask;
import com.poobo.core.entity.TblUser;
import com.poobo.core.entity.TblUserProject;
import com.poobo.core.entity.TblUserTask;
import com.poobo.core.enums.EnumDataPrivilege;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.ResultData;
import com.poobo.reportwarn.service.IReportWarnService;
import com.poobo.role.service.IRoleService;
import com.poobo.task.service.ITaskService;
import com.poobo.user.service.IUserService;

/**
 * 任务控制类
 * @author zhiliang.lan 2016年3月9日上午10:51:29
 *
 */
public class TaskAction  extends BaseAction {
	@Resource
	private IRoleService roleService;
	@Resource
	private IChangelogService changelogService;
	@Resource
	private ITaskService taskService;
	@Resource
	private CompanyService companyService;
	@Resource
	private IUserService userService;
	@Resource
	private IReportWarnService reportwarnService;
	
	private ResultData resultData;
	private TblTask tblTask;
	private List<TblUser> userList;
	private String ids;
	private TblUser user;
	private String taskCreater;
	private String responsible;
	private List<TblTask> taskList;
	private List<TblTask> mobileList;
	private List<TblTask> task_detailList;
	private List<TblTask> taskDetailList;
	private List<TblTask> userTaskList;
	
	
	
	public String taskList(){
		//pageList = taskService.getPageList(tblTask, pageNow, pageSize);
		ActionContext.getContext().getContextMap().put("progressList", TblTask.PROGRESS_LIST);
		pageList = taskService.findTaskList(tblTask, pageNow, pageSize);
		
		String companyId = GetSessionData.getUser().getTblCompany().getCompanyId();
		taskList = taskService.findTaskByCompanyId(companyId);
		userList = new ArrayList<TblUser>();
		for(TblTask task : taskList){
			userList.add(task.getTaskResponsible());
		}
		return "taskList";
	}


	public String task_detailList(){
		
		ActionContext.getContext().getContextMap().put("progressList", TblTask.PROGRESS_LIST);
		tblTask = taskService.findObjectById(tblTask.getTaskId());
	
		return "task_detailList";
	}

	/**
	 * 去任务编辑页面
	 * @return
	 */
	public String taskEdit(){
		ActionContext.getContext().getContextMap().put("progressList", TblTask.PROGRESS_LIST);
		if(null!=tblTask&&StringUtils.isNotEmpty(tblTask.getTaskId())){
			//编辑
			tblTask=taskService.findObjectById(tblTask.getTaskId());
			
		}
		//TODO 获取公司人员列表
		userList = userService.getUserListByCompanyId(GetSessionData.getUser().getTblCompany().getCompanyId());
		return "taskEdit";
	}
	
	
	//后台页面点击详情按钮
	public String taskDetailList(){
		if(tblTask!=null){
			String id=tblTask.getTaskId();
			
			tblTask=taskService.findObjectById(id);
			taskDetailList = taskService.findTaskList(tblTask);
			//根据公司id查到任务和负责人
			String companyId = GetSessionData.getUser().getTblCompany().getCompanyId();
			taskList = taskService.findTaskByCompanyId(companyId);
			userList = new ArrayList<TblUser>();
			for(TblTask task : taskList){
				userList.add(task.getTaskResponsible());
			}
			
		}
		
		return "taskDetailList";
	}
	
	
	
	/**
	 * 执行任务编辑
	 * @return
	 */
	public String doTaskEdit(){
		resultData=new ResultData();
		
		
		if(StringUtils.isEmpty(tblTask.getTaskId())){
			//新增
			//TODO 公司id
			TblUser user =  (TblUser) GetSessionData.getUser();
			TblCompany company = new TblCompany();
			company.setCompanyId(user.getTblCompany().getCompanyId());
			tblTask.setTblCompany(company);
			
			user.setUserId(user.getUserId());
			
			tblTask.setCreaterUser(user);
			tblTask.setDataStatus(1);
			//tblTask.setDataStatus(EnumDataStatus.NORMAL.getValue());
			//获取当前时间并保存
			Date date = new Date();       
			Timestamp time = new Timestamp(date.getTime());
			tblTask.setCreateTime(time);
			taskService.newTask(tblTask);
			//保存操作日志
			changelogService.logRemable(tblTask.getTaskMsg(), 0, "任务");
		}else{
			//编辑
			taskService.updateTask(tblTask);
			changelogService.logRemable(tblTask.getTaskMsg(), 1, "任务");
		}
		
		resultData.setResultFlag(true);
		return SUCCESS;
	}
	
	/**
	 * 删除任务
	 * @return
	 */
	public String doTaskDelete()
	{
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			
			//保存操作日志
			StringBuffer changelogContent = new StringBuffer();
			for(String id : idList){
				changelogContent.append(taskService.findObjectById(id).getTaskMsg());
				changelogContent.append(",");
			}
			if(changelogContent.length() > 1){
			changelogContent.substring(0, changelogContent.length()-2);
			}
			changelogService.logRemable(changelogContent.toString(), 2, "任务");
			
			taskService.delTaskByIds(idList);
			resultData.setResultFlag(true);
		}
		
		return SUCCESS;
		
	}
	
	
	/**
	 * 手机端异步查询返回任务列表
	 * @return
	 */
	public String ajaxTaskList4Mobile(){
		if(tblTask == null){
			tblTask=new TblTask();
		}
		tblTask.setTblCompany(GetSessionData.getUser().getTblCompany());
		
		taskList = taskService.findTaskList4Mobile(tblTask, rowIndex, pageSize);
		List<TblTask>  tempList = taskService.findTaskList4Mobile(tblTask, rowIndex, pageSize);
		userList = new ArrayList<TblUser>();
		for(TblTask task : tempList){
			userList.add(task.getTaskResponsible());
		}
		return "ajaxTaskList4Mobile";
	}
	
	//手机端任务列表第一次显示
	public String taskList4Mobile(){
		if(tblTask == null){
			tblTask=new TblTask();
		}
		tblTask.setTblCompany(GetSessionData.getUser().getTblCompany());
		taskList = taskService.findTaskList4Mobile(tblTask, rowIndex, pageSize);
		List<TblTask>  tempList = taskService.findTaskList4Mobile(tblTask, rowIndex, pageSize);
		userList = new ArrayList<TblUser>();
		for(TblTask task : tempList){
			if(!userList.contains(task.getTaskResponsible()))
				userList.add(task.getTaskResponsible());
		}
		return "taskList4Mobile";
		
	}
	
	/**
	 * 手机端编辑
	 */
	public String mobileEdit(){
		ActionContext.getContext().getContextMap().put("progressList", TblTask.PROGRESS_LIST);
		resultData = new  ResultData();
		if(tblTask != null){
			if(StringUtils.isEmpty(tblTask.getTaskId())){
			
		  taskService.save(tblTask);
		}else {
			taskService.update(tblTask);
		}
			resultData.setResultFlag(true);
		}
		return SUCCESS;
	}
/*	*//**
	 * 手机端页面
	 *//*
	public String  mobileList() {
		pageList = taskService.findTaskList(tblTask, rowIndex, pageSize);
		tblTask = taskService.findObjectById(GetSessionData.getUser().getUserId());
		mobileList = taskService.findAll();
		return task_detailList;
	}*/

	
	
	
	
	public ResultData getResultData() {
		return resultData;
	}

	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}

	public TblTask getTblTask() {
		
		return tblTask;
	}

	public void setTblTask(TblTask tblTask) {
		this.tblTask = tblTask;
	}

	public List<TblUser> getUserList() {
		return userList;
	}

	public void setUserList(List<TblUser> userList) {
		this.userList = userList;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}



	public List<TblTask> getTaskList() {
		return taskList;
	}



	public void setTaskList(List<TblTask> taskList) {
		this.taskList = taskList;
	}



	public List<TblTask> getTask_detailList() {
		return task_detailList;
	}



	public void setTask_detailList(List<TblTask> task_detailList) {
		this.task_detailList = task_detailList;
	}


	public List<TblTask> getMobileList() {
		return mobileList;
	}


	public void setMobileList(List<TblTask> mobileList) {
		this.mobileList = mobileList;
	}


	public String getResponsible() {
		return responsible;
	}


	public void setResponsible(String responsible) {
		this.responsible = responsible;
	}
	
	
	

	
	
	
}
