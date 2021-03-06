package com.poobo.log.action;

import java.io.File;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.poobo.changelog.service.IChangelogService;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblLogDetail;
import com.poobo.core.entity.TblLogFile;
import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblTask;
import com.poobo.core.entity.TblUser;
import com.poobo.core.entity.TblUserProject;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.util.DateTimeUtil;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.ResultData;
import com.poobo.log.service.ILogDetailsService;
import com.poobo.log.service.ILogService;
import com.poobo.project.service.IProjectService;
import com.poobo.task.service.ITaskService;


public class LogAction extends BaseAction{
	
	@Resource
	private ILogService logService;
	@Resource
	private IProjectService projectService;
	@Resource
	private ITaskService taskService;
	@Resource
	private ILogDetailsService logDetailsService;
	@Resource
	private IChangelogService changelogService;
	private List<TblLog> logList;
	private List<TblTask>taskList;
	private List<TblProject> projectList;
	private List<TblLogDetail> logDetailList,tasklogDetailList;
	private List<TblUserProject> userProjectList;
	private List<TblLogFile> logFileList;
	private TblLogDetail logDetail;
	private TblLog tblLog;
	private TblLog tblProject;
	private String ids;
	private TblUser user;
	private ResultData resultData;
	private File image;
	private String imageContentType;
	private String imageFileName;
	private String date;
    private String message = "你已成功上传文件";
    private String imagePath;
    List<List<LogTemp>> dlogList;
    private Date nextMonth;
    private Date perMonth;
    /**
     * @author Jolin.Lee 
     * 添加日期唯一性校验
     */
    public void checklogTime(){
    	if(logService.checklogTime(tblLog)){
			toJson("true");
		}else{
			toJson("false");
		}
    }
    /**
     * 根据date查询当月提交日志情况
     * @return
     * @throws Exception 
     */
  public String findDateList() throws Exception{
	  resultData = new ResultData();
	  Date d=new Date();
	  if(date==null){
		  
		  
	  }else{
		  d=DateTimeUtil.parseDateToDay(date);
		 // logList=logService.findMonthlogListByDate(d);
	  }
	  date=DateTimeUtil.DateToString(d);
		//这个月开始时间
		Date dStart=getMinMonthDate(date);
		//这个月结束时间
		Date dEnd=getMaxMonthDate(date);
		logList=logService.findMonthlogListByDate(dStart,dEnd);
		String str="";
		if(logList!=null){
			for(TblLog tblLog:logList){
				str+=","+tblLog.getLogTime().getDate();
			}
		}
		
	  List<List<LogTemp>> dLogList = getMonthList(logList,new Date());
		
	  resultData.setResultData(str);
	  resultData.setResultFlag(true);
	  return SUCCESS;
  }
/**
 * 后台生成日历并遍历日志表，有日志的打标志。  
 * @author Jolin.lee 
 * @date 2016年4月29日 上午10:17:08
 * @param logList
 * @param date
 * @return
 */
private static List<List<LogTemp>> getMonthList(
		List<TblLog> logList,Date date) {
	Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int weekNum=calendar.getActualMaximum(Calendar.WEEK_OF_MONTH);
		  calendar.set(Calendar.MONTH,calendar.get(Calendar.MONTH)+1);
		  calendar.set(Calendar.DAY_OF_MONTH,1);
		  calendar.set(Calendar.DATE,calendar.get(Calendar.DATE)-1);
		int totalDay = calendar.get(Calendar.DAY_OF_MONTH);
		List<List<LogTemp>>  dLogList=new ArrayList<List<LogTemp>>();
		calendar.set(Calendar.DAY_OF_MONTH,1);
		int day=0;
		for(int i=0;i<weekNum;i++){
			List<LogTemp> week=new ArrayList<>();
			
			for(int j=1;j<8;j++){
				
				 LogTemp m=new LogTemp();
				 if(calendar.get(Calendar.DAY_OF_WEEK)==j&&day<totalDay){
					 day=day+1;
					 m.setDay(day);
					 m.setYear(calendar.get(Calendar.YEAR));
					 m.setMonth(date.getMonth()+1);
					 Calendar c = Calendar.getInstance();
					 c.set(m.getYear(), m.getMonth(), m.getDay());
					 Date d=calendar.getTime();
					 Date todate=new Date();
					 if(d.after(todate)){
						 m.setFlag(1);
					 }else{
						 m.setFlag(0);
					 }
					 for(TblLog log:logList){
						 if(log.getLogTime().getDate()==day){
							 m.setTblLog(log);
							 break;
						 }
					 }
					 calendar.add(Calendar.DAY_OF_MONTH,1);
				 }
				 
				 week.add(m);
			}
			
			dLogList.add(week);
		}
		
	return dLogList;
}
    
    
   /**
    * 返回日志列表
    * @author Jolin.lee 
    * @date 2016年4月26日 下午2:28:17
    * @return
    */
	public String logList(){
		pageList=logService.findLogList(tblLog, pageNow, pageSize);
		return "logList";
	}
	

	/**
	 * 获得当前月--开始日期
	 * @author Jolin.lee 
	 * @date 2016年4月26日 下午2:29:43
	 * @param date
	 * @return
	 */
    public  Date getMinMonthDate(String date) {   
             Calendar calendar = Calendar.getInstance();   
              try {
                 calendar.setTime(DateTimeUtil.DateSdf.parse(date));
                 calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH)); 
                 return calendar.getTime();
               } catch (java.text.ParseException e) {
               e.printStackTrace();
              }
            return null;
    }


    /**
     * 获得当前月--结束日期
     * @author Jolin.lee 
     * @date 2016年4月26日 下午2:29:14
     * @param date
     * @return
     */
    public  Date getMaxMonthDate(String date){   
         Calendar calendar = Calendar.getInstance();   
         try {
                calendar.setTime(DateTimeUtil.DateSdf.parse(date));
                calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
                return calendar.getTime();
         }  catch (java.text.ParseException e) {
                e.printStackTrace();
          }
        return null;
}
	/**
	 * 个人日志编辑
	 * @return
	 */
	public String logEdit(){
		projectList=new ArrayList<TblProject>();
		logDetailList=new ArrayList<TblLogDetail>();
		logDetail=new TblLogDetail();
		//获得已被添加的项目名称
		//tblProject=projectService.findObjectById(project.getProjectId());
		if(tblLog!=null && !StringUtils.isEmpty(tblLog.getLogId())){
			tblLog=logService.findObjectById(tblLog.getLogId());
			logFileList=logService.findAllFilebylogId(tblLog.getLogId());
		}else{
			date = DateUtils.getCurrentDate();
		}
		user=GetSessionData.getUser();
		userProjectList=projectService.findUserProjectByUser(user.getUserId());
		Date d=new Date();
		taskList=taskService.findTaskByUserIdAndTime(user.getUserId(), d);		
		for(TblUserProject userProject:userProjectList){
			TblProject project= userProject.getId().getTblProject();
			project=projectService.findObjectById(project.getProjectId());
			if(project.getDataStatus()==1 && project.getProjectStatus()==1)
			projectList.add(project);
		}
		return"logEdit";
	}
	/**
	 * 编辑
	 * @return
	 */
	public String edit(){
		resultData = new ResultData();
		if(tblLog !=null && StringUtils.isEmpty(tblLog.getLogId()))
		{
			tblLog.setDataStatus(EnumDataStatus.NORMAL.getValue());
			user=GetSessionData.getUser();
			TblCompany company=user.getTblCompany();
			tblLog.setTblUser(user);
			tblLog.setTblCompany(company);
			Timestamp d = new Timestamp(System.currentTimeMillis()); 
			tblLog.setCreateTime(d);
			int comTime=0;
			if(logDetailList!=null){
				for(int i=0;i<logDetailList.size();i++){
					TblLogDetail logDetail=logDetailList.get(i);
					if(logDetail.getLogTime()!=0){
					comTime+=logDetail.getLogTime();
					}
				}
			}
			if(logDetail!=null){
				if(logDetail.getLogTime()!=0){
					comTime+=logDetail.getLogTime();
				}
			}
			if(tasklogDetailList!=null){
				for(int i=0;i<tasklogDetailList.size();i++){
					TblLogDetail logDetail=tasklogDetailList.get(i);
					if(logDetail.getLogTime()!=0){
						comTime+=logDetail.getLogTime();
					}
				}
			}
			tblLog.setComTime(comTime);
			logService.save(tblLog);
			if(logDetailList!=null){
				for(int i=0;i<logDetailList.size();i++){
					TblLogDetail logDetail=logDetailList.get(i);
					logDetail.setTblLog(tblLog);
					if(logDetail.getLogTime()!=0){
					logDetailsService.save(logDetail);
					}
				}
			}
			
			if(tasklogDetailList!=null){
				for(int i=0;i<tasklogDetailList.size();i++){
					TblLogDetail logDetail=tasklogDetailList.get(i);
					logDetail.setTblLog(tblLog);
					if(logDetail.getLogTime()!=0){
						logDetailsService.save(logDetail);
					}
				}
			}
			if(logDetail!=null){
				if(logDetail.getLogTime()!=0){
					logDetail.setTblLog(tblLog);
					logDetailsService.save(logDetail);
				}
			}
			changelogService.logRemable(tblLog.getLogTime().toString(), 0, "个人日志");
		}else if(tblLog !=null && !StringUtils.isEmpty(tblLog.getLogId())){
			int comtime= 0;
			if(logDetailList!=null){
				comtime=0;
				for(int i=0;i<logDetailList.size();i++){
					TblLogDetail logDetail=logDetailList.get(i);
					comtime+=logDetail.getLogTime();
					logDetailsService.update(logDetail);
				}
			}
			tblLog.setComTime(comtime);
			logService.update(tblLog);
		}
		
		resultData.setResultFlag(true);
		return SUCCESS;
	}
	/**
	 * 删除日志
	 */
	public String delete(){
		resultData=new ResultData();
		if(ids!=null)
		{
			//获取用户id
			String[]  idList=ids.split("@");
			for(int i=0;i<idList.length;i++)
			{
				String id=idList[i];
				TblLog log=logService.findObjectById(id);
				log.setDataStatus(EnumDataStatus.DEL.getValue());
				List <TblLogDetail> logDetailList=logDetailsService.findAllByLogId(log.getLogId());
				for(TblLogDetail ld:logDetailList){
					logDetailsService.delete(ld.getLogDetailId());
				}
				logService.update(log);
				changelogService.logRemable(log.getLogTime().toString(), 2, "个人日志");
			}
		}
		resultData.setResultFlag(true);
		return SUCCESS;
	}
	/**
	 * 手机端日志页面
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("deprecation")
	public String log() throws Exception{
		Date d=new Date();
		if(date==null||StringUtils.isEmpty(date)){
			date=DateTimeUtil.DateToString(d);
		}else if(date!=null){
			String[]  idList=date.split("-");
			String str=null;
			for(int i=0;i<idList.length;i++){
				if(i==0){
					if(!idList[i].contains("20")){
						str="20"+idList[i];
					}else{
						str=idList[i];
					}
				}else{
					str=str+"-"+idList[i];
				}
			}
			date=str;
		}
			//这个月开始时间
		Date dStart=getMinMonthDate(date);
			//这个月结束时间
		Date dEnd=getMaxMonthDate(date);
		logList=logService.findMonthlogListByDate(dStart,dEnd);
		Date d2=DateTimeUtil.parseDateToDay(date);
	    dlogList = getMonthList(logList,d2);
	    Calendar c = Calendar.getInstance(); 
	    c.setTime(d2);
	    c.add(Calendar.MONTH, 1);
	    Calendar c2=Calendar.getInstance();
	    
	    nextMonth=c.getTime();
	    if(nextMonth.after(c2.getTime())){
	    	nextMonth=d2;
	    }
	    c.add(Calendar.MONTH,-2);
	    perMonth=c.getTime();
		return "log";
	}
	/**
	 * 返回日志详情页
	 * @return
	 * @throws ParseException
	 */
	public String logDetail() throws ParseException{
		projectList=new ArrayList<TblProject>();
		logDetailList=new ArrayList<TblLogDetail>();
		Date d=new Date();
		logDetail=new TblLogDetail();
		if(date!=null&&!StringUtils.isEmpty(date)){
			d=DateTimeUtil.DateSdf.parse(date);
		}
		tblLog=logService.findlogByUserDate(GetSessionData.getUser().getUserId(), d);
		if(tblLog!=null && !StringUtils.isEmpty(tblLog.getLogId())){
			tblLog=logService.findObjectById(tblLog.getLogId());
			logDetailList=logDetailsService.findAllByLogId(tblLog.getLogId());
		}else{
			user=GetSessionData.getUser();
			userProjectList=projectService.findUserProjectByUser(user.getUserId());
			taskList=taskService.findTaskByUserIdAndTime(user.getUserId(),d);
			for(TblUserProject userProject:userProjectList){
				TblProject project= userProject.getId().getTblProject();
				project=projectService.findObjectById(project.getProjectId());
				if(project.getDataStatus()==1 && project.getProjectStatus()==1){
						projectList.add(project);
				}
			}
		}
		return "logDetail";
	}
	/**
	 * 手机端编辑日志
	 * 
	 * @throws ParseException 
	 */
	public String mobileEdit() throws ParseException{
		resultData = new  ResultData();
		if(tblLog != null){
			if(StringUtils.isEmpty(tblLog.getLogId())&&date!=null){
				tblLog.setDataStatus(EnumDataStatus.NORMAL.getValue());
				user=GetSessionData.getUser();
				TblCompany company=user.getTblCompany();
				tblLog.setTblUser(user);
				tblLog.setTblCompany(company);
				Timestamp d = new Timestamp(System.currentTimeMillis());
				tblLog.setCreateTime(d);
				java.sql.Date sqlDate=java.sql.Date.valueOf(date);
				tblLog.setLogTime(sqlDate);
				int comTime=0;
				if(logDetailList!=null){
					for(int i=0;i<logDetailList.size();i++){
						TblLogDetail logDetail=logDetailList.get(i);
						if(logDetail.getLogTime()!=0){
						comTime+=logDetail.getLogTime();
						}
					}
				}
				if(tasklogDetailList!=null){
					for(int i=0;i<tasklogDetailList.size();i++){
						TblLogDetail logDetail=tasklogDetailList.get(i);
						if(logDetail.getLogTime()!=0){
							comTime+=logDetail.getLogTime();
						}
					}
				}
				if(logDetail!=null){
					if(logDetail.getLogTime()!=0){
						comTime+=logDetail.getLogTime();
					}
				}
				tblLog.setComTime(comTime);
				logService.save(tblLog);
				if(logDetailList!=null){
					for(int i=0;i<logDetailList.size();i++){
						TblLogDetail logDetail=logDetailList.get(i);
						logDetail.setTblLog(tblLog);
						if(logDetail.getLogTime()!=0){
						logDetailsService.save(logDetail);
						}
					}
				}
				
				if(tasklogDetailList!=null){
					for(int i=0;i<tasklogDetailList.size();i++){
						TblLogDetail logDetail=tasklogDetailList.get(i);
						logDetail.setTblLog(tblLog);
						if(logDetail.getLogTime()!=0){
							logDetailsService.save(logDetail);
						}
					}
				}
				if(logDetail!=null){
					logDetail.setTblLog(tblLog);
					if(logDetail.getLogTime()!=0){
						logDetailsService.save(logDetail);
					}
				}
				changelogService.logRemable(tblLog.getLogTime().toString(), 0, "个人日志");
		}else {
			int comtime= 0;
			if(logDetailList!=null){
				comtime=0;
				for(int i=0;i<logDetailList.size();i++){
					TblLogDetail logDetail=logDetailList.get(i);
					comtime+=logDetail.getLogTime();
					logDetailsService.update(logDetail);
				}
			}
			tblLog.setComTime(comtime);
			logService.update(tblLog);
		}
			resultData.setResultFlag(true);
		}
		return SUCCESS;
	}
	/**
	 * 修改日志方法返回日志修改页面
	 * @return
	 */
	public String logChange(){
		if(tblLog!=null&&!StringUtils.isEmpty(tblLog.getLogId())){
			//只选中一条修改
			tblLog=logService.findObjectById(tblLog.getLogId());
			//勾选最上面的打勾按钮修改会出错	2016年6月16日10:40:21
			//logDetailList=logDetailsService.findAllByLogId(tblLog.getLogId());
			if(logDetailList==null){
				logDetailList=new ArrayList<TblLogDetail>();
			}
		}
		return "logChange";
	}
	
	public List<TblLog> getLogList() {
		return logList;
	}
	public void setLogList(List<TblLog> logList) {
		this.logList = logList;
	}
	public TblLog getTblLog() {
		return tblLog;
	}
	public void setTblLog(TblLog tblLog) {
		this.tblLog = tblLog;
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


	public List<TblTask> getTaskList() {
		return taskList;
	}


	public void setTaskList(List<TblTask> taskList) {
		this.taskList = taskList;
	}


	public List<TblProject> getProjectList() {
		return projectList;
	}


	public void setProjectList(List<TblProject> projectList) {
		this.projectList = projectList;
	}


	public TblLogDetail getLogDetail() {
		return logDetail;
	}


	public void setLogDetail(TblLogDetail logDetail) {
		this.logDetail = logDetail;
	}

	public List<TblLogDetail> getLogDetailList() {
		return logDetailList;
	}

	public void setLogDetailList(List<TblLogDetail> logDetailList) {
		this.logDetailList = logDetailList;
	}

	public ResultData getResultData() {
		return resultData;
	}

	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}

	public List<TblLogDetail> getTasklogDetailList() {
		return tasklogDetailList;
	}

	public void setTasklogDetailList(List<TblLogDetail> tasklogDetailList) {
		this.tasklogDetailList = tasklogDetailList;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public List<List<LogTemp>> getDlogList() {
		return dlogList;
	}
	public void setDlogList(List<List<LogTemp>> dlogList) {
		this.dlogList = dlogList;
	}
	public Date getNextMonth() {
		return nextMonth;
	}
	public void setNextMonth(Date nextMonth) {
		this.nextMonth = nextMonth;
	}
	public Date getPerMonth() {
		return perMonth;
	}
	public void setPerMonth(Date perMonth) {
		this.perMonth = perMonth;
	}
	public List<TblLogFile> getLogFileList() {
		return logFileList;
	}
	public void setLogFileList(List<TblLogFile> logFileList) {
		this.logFileList = logFileList;
	}
	
	
}
