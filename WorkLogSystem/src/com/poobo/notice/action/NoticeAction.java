package com.poobo.notice.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.poobo.changelog.service.IChangelogService;
import com.poobo.company.service.CompanyService;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblNotice;
import com.poobo.core.entity.TblReportwarn;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumReportWarnType;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.ResultData;
import com.poobo.notice.service.INoticeService;
import com.poobo.reportwarn.service.IReportWarnService;
import com.poobo.user.service.IUserService;


public class NoticeAction extends BaseAction<TblNotice> {
	@Resource
	private INoticeService noticeService;
	@Resource
	private CompanyService companyService;
	@Resource
	private IUserService userService;
	@Resource
	private IChangelogService changelogService;
	@Resource
	private IReportWarnService reportwarnService;
	
	private TblNotice notice;
	private TblReportwarn logReportwarn;
	private ResultData resultData;
	private String ids;
	private List<TblNotice> noticeList;
	private List<TblReportwarn> reportwarnList;
	private List<TblNotice> noticedetialList;
	
	public String listUI() {
		pageList = noticeService.findNoticeList(notice, pageNow, pageSize);	
		return "listUI";
	}

	
	public String noticeList() {
		    TblUser user =GetSessionData.getUser();
			pageList = noticeService.findNoticeList(notice, pageNow, pageSize);	
			
		   noticeList = noticeService.findNotices(GetSessionData.getUser().getTblCompany().getCompanyId());
			reportwarnList = reportwarnService.findReportWarns();
			logReportwarn = new TblReportwarn();
			List<TblLog> logList = reportwarnService.findLog4Yesterday(true);
			logReportwarn.setType(EnumReportWarnType.LOG.getValue());
			if(logList != null && logList.size() >0){
				logReportwarn.setTblLog(logList.get(0));
				
			}
			reportwarnList.add(0, logReportwarn);
		return "noticeList";
	}
	
	
	public String noticedetialList() {
		TblUser user =GetSessionData.getUser();
		
			pageList = noticeService.findNoticeList(notice, pageNow, pageSize);	
			notice = noticeService.findObjectById(notice.getNoticeId());
			noticedetialList = noticeService.findAll();
		
		
		return "noticedetialList";
	}
	
	/**
	 * 调到编辑界面
	 * @return
	 */
	public String editUI(){
		if(null!=notice && StringUtils.isNotEmpty(notice.getNoticeId())){
			//编辑
			notice = noticeService.findObjectById(notice.getNoticeId());
			/*TblCompany company = companyService.findObjectById(notice.getTblCompany().getCompanyId());
			notice.setTblCompany(company);*/
		}
		return "editUI";
	}
	/**
	 * 执行编辑公告
	 * @return
	 */
	public String edit(){
		resultData = new ResultData();
		TblUser tblUser = GetSessionData.getUser();
		if(StringUtils.isEmpty(notice.getNoticeId())){
			notice.setNoticeCreatetime(DateUtils.getCurrentDateTimeStamp());
			notice.setDataStatus(1);
			notice.setNoticeCreaterId(tblUser.getName());
			TblUser user =  (TblUser)ServletActionContext.getRequest().getSession().getAttribute("USER");
			TblCompany company = companyService.findObjectById(user.getTblCompany().getCompanyId());
			notice.setTblCompany(company);
			notice.setTblUser(user);
			noticeService.save(notice);
			//保存操作日志
			changelogService.logRemable(notice.getNoticeTitle(), 0, "公告");
		}else{
			noticeService.update(notice);
			//保存操作日志
			changelogService.logRemable(notice.getNoticeTitle(), 1, "公告");
		}
		resultData.setResultFlag(true);
		
		return SUCCESS;
	}
	
	
	public String noticeDelete()
	{
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			
			//保存操作日志
			StringBuffer changelogContent = new StringBuffer();
			for(String id : idList){
				changelogContent.append(noticeService.findObjectById(id).getNoticeTitle());
				changelogContent.append(",");
			}
			if(changelogContent.length() > 1){
			changelogContent.substring(0, changelogContent.length()-2);
			}
			changelogService.logRemable(changelogContent.toString(), 2, "公告");
			
			noticeService.delNoticeByIds(idList);
			resultData.setResultFlag(true);
		}
		
		return SUCCESS;
		
	}
	/**
	 * 到消息主页
	 * @return
	 */
	public String toHome(){
		resultData = new ResultData();
		if(!GetSessionData.getUser().getIsUserPlatform()){
	    noticeList = noticeService.findNotices(GetSessionData.getUser().getTblCompany().getCompanyId());
		}else{
		noticeList=noticeService.findNote();
		}
		reportwarnList = reportwarnService.findReportWarns();
		List<TblLog> logList = reportwarnService.findLog4Yesterday(true);
		logReportwarn = new TblReportwarn();
		logReportwarn.setType(EnumReportWarnType.LOG.getValue());
		if(logList != null && logList.size() >0){
			logReportwarn.setTblLog(logList.get(0));
			
		}
		reportwarnList.add(0, logReportwarn);
		return "toHome";
	}

	

	public ResultData getResultData() {
		return resultData;
	}


	public TblNotice getNotice() {
		return notice;
	}

	public void setNotice(TblNotice notice) {
		this.notice = notice;
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


	public List<TblNotice> getNoticeList() {
		return noticeList;
	}


	public void setNoticeList(List<TblNotice> noticeList) {
		this.noticeList = noticeList;
	}


	public List<TblNotice> getNoticedetialList() {
		return noticedetialList;
	}


	public void setNoticedetialList(List<TblNotice> noticedetialList) {
		this.noticedetialList = noticedetialList;
	}




	public TblReportwarn getLogReportwarn() {
		return logReportwarn;
	}


	public void setLogReportwarn(TblReportwarn logReportwarn) {
		this.logReportwarn = logReportwarn;
	}


	public List<TblReportwarn> getReportwarnList() {
		return reportwarnList;
	}


	public void setReportwarnList(List<TblReportwarn> reportwarnList) {
		this.reportwarnList = reportwarnList;
	}



	



	
}
