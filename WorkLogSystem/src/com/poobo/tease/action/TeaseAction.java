package com.poobo.tease.action;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblTask;
import com.poobo.core.entity.TblTease;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.ResultData;
import com.poobo.tease.service.ITeaseService;

public class TeaseAction extends BaseAction<TblTease>{
	@Resource
	private ITeaseService teaseService;
	private TblTease tease;
	private ResultData resultData;
	private String ids;
	private TblUser user;
	
	public String listUI(){
		pageList = teaseService.findTeaseList(tease, pageNow, pageSize);
		return "listUI";
	}
	
	
	
	/**
	 * 调到编辑界面
	 * @return
	 */
	public String editUI(){
		ActionContext.getContext().getContextMap().put("partList", TblTask.PROGRESS_LIST);
		if(null!=tease && StringUtils.isNotEmpty(tease.getTeaseId())){
			tease = teaseService.findObjectById(tease.getTeaseId());
		}
		return "editUI";
	}
	/**
	 * 执行编辑吐槽
	 * @return
	 */
	
	public String edit(){
		resultData = new ResultData();
		if(StringUtils.isEmpty(tease.getTeaseId())){
			tease.setCreateTime(DateUtils.getCurrentDateTimeStamp());
			tease.setDataStatus(EnumDataStatus.NORMAL.getValue());
			TblUser user =  GetSessionData.getUser();
			tease.setTblUser(user);
			tease.setTblCompany(user.getTblCompany());
			teaseService.save(tease);
		}else{
			teaseService.update(tease);
		}
		resultData.setResultFlag(true);
		
		return SUCCESS;
	}
	
	
	
	public String delete()
	{
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			teaseService.delTeaseByIds(idList);
			resultData.setResultFlag(true);
		}
		
		return SUCCESS;
		
	}
	/**
	 * 跳转到手机吐槽页面
	 * @return
	 */
	
	public String toMobileTease(){
		return "mobileTease";
	}
	/**
	 *保存手机吐槽
	 * @return
	 */
	
	public String mobileTeaseAdd(){
		tease.setCreateTime(DateUtils.getCurrentDateTimeStamp());
		tease.setDataStatus(EnumDataStatus.NORMAL.getValue());
		user =  GetSessionData.getUser();
		tease.setTblUser(user);
		tease.setTblCompany(user.getTblCompany());
		teaseService.save(tease);
		return "userList";
	}
	
	
	public TblTease getTease() {
		return tease;
	}
	public void setTease(TblTease tease) {
		this.tease = tease;
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



	public TblUser getUser() {
		return user;
	}



	public void setUser(TblUser user) {
		this.user = user;
	}
	
}
