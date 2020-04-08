package com.poobo.company.action;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.poobo.changelog.service.IChangelogService;
import com.poobo.company.service.CompanyService;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblDept;
import com.poobo.core.entity.TblRole;
import com.poobo.core.entity.TblTask;
import com.poobo.core.entity.TblUser;
import com.poobo.core.entity.TblUserRole;
import com.poobo.core.entity.TblUserRoleId;
import com.poobo.core.enums.EnumRole;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.ResultData;
import com.poobo.role.service.IRoleService;
import com.poobo.user.service.IUserService;




public class CompanyAction extends BaseAction<TblCompany> {
	@Resource
	private IChangelogService changelogService;
	@Resource
	private CompanyService companyService;
	@Resource
	private IUserService userService;
	@Resource
	private IRoleService roleService;
	private List<TblCompany> companyList;
	private List<TblUser> userList;
	private TblCompany tblcompany;
	private ResultData resultData;
	private File image;
	private String imageContentType;
	private String imageFileName;
	private String ids;
	private TblUser tblUser;
    private String message = "你已成功上传文件";
    private String imagePath;
    private List<TblCompany> companyDetailList;

	/**
	 * 
	 * 删除公司
	 */
	public String doCompanyDelete()
	{
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			for(String id:idList){
				TblCompany company=companyService.findObjectById(id);
				if(GetSessionData.getUser().getTblCompany().getCompanyName().equals(company.getCompanyName())){
					resultData.setResultMsg("不能删除自己");
					return SUCCESS;
				}
			}
			
			//保存操作日志
			StringBuffer changelogContent = new StringBuffer();
			for(String id : idList){
				changelogContent.append(companyService.findObjectById(id).getCompanyName());
				changelogContent.append(",");
			}
			if(changelogContent.length() > 1){
			changelogContent.substring(0, changelogContent.length()-2);
			}
			changelogService.logRemable(changelogContent.toString(), 2, "公司");
			
			companyService.delcompanyByIds(idList);
			resultData.setResultFlag(true);
		}
		
		return SUCCESS;
		
	}
	
    /**
     * 
     * 编辑公司信息
     */
	public String edit(){
		resultData = new ResultData();
		if(tblcompany != null && StringUtils.isEmpty(tblcompany.getCompanyId())){
			if(tblcompany.getGsAdmin().getUserId().equals("")){
				tblcompany.setGsAdmin(null);
			}
				tblcompany.setIsVerification(false);
				tblcompany.setDataStatus(1);
				tblcompany.setIsFreeze(false);
				tblcompany.setCreateTime(DateUtils.getCurrentDateTimeStamp());
				companyService.save(tblcompany);
				//保存操作日志
				changelogService.logRemable(tblcompany.getCompanyName(), 0, "公司");
		}else if(tblcompany != null && !StringUtils.isEmpty(tblcompany.getCompanyId())){
			if(tblcompany.getGsAdmin().getUserId().equals("")){
				tblcompany.setGsAdmin(null);
			}
			if(!GetSessionData.getUser().getIsUserPlatform() && tblcompany.getIsVerification()){
				tblcompany.setIsFreeze(true);
				tblcompany.setIsVerification(false);
				companyService.update(tblcompany);
				//保存操作日志
				changelogService.logRemable(tblcompany.getCompanyName(), 1, "公司");
			}else{
				if(tblcompany.getIsFreeze()){
					tblcompany.setIsFreeze(true);
					companyService.update(tblcompany);
					//保存操作日志
					changelogService.logRemable(tblcompany.getCompanyName(), 1, "公司");
				}else{
			 tblcompany.setIsFreeze(false);
			 companyService.update(tblcompany);
			//保存操作日志
			changelogService.logRemable(tblcompany.getCompanyName(), 1, "公司");
				}
			}
		}
		 resultData.setResultFlag(true);
		return SUCCESS;
	}

	/**
	 * 
	 * 公司信息审核
	 */
   public String audit(){
		resultData=new ResultData();
		TblRole companyAdminRole = roleService.findObjectById(EnumRole.CADMIN.getValue());
		List<TblCompany> companyList = new ArrayList<TblCompany>();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			
			//创建公司管理员
			for(String id : idList){
				TblCompany company=companyService.findObjectById(id);
				if(!company.getIsVerification() && !company.getIsFreeze()){
					companyService.auditCompanyByIds(id);
					companyList.add(company);
					userService.createCompanys(companyList,companyAdminRole);
					resultData.setResultFlag(true);
				}else if(company.getIsVerification()){
					resultData.setResultMsg("不能审核已通过审核的公司");
				}else if(company.getIsFreeze()){
					resultData.setResultMsg("不能审核已冻结的公司");
				}
				
		}
			
			
		}
		return SUCCESS;

   }	   
   /***
    * 公司冻结
    *
    */
  public String freeze(){
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			for(String id : idList){
			TblCompany company=companyService.findObjectById(id);
			if(!(GetSessionData.getUser().getTblCompany().getCompanyName().equals(company.getCompanyName())) && company.getIsVerification() && !(company.getIsFreeze())){
				companyService.freezeCompanyByIds(idList);
				resultData.setResultFlag(true);
				return SUCCESS;
			}else if(GetSessionData.getUser().getTblCompany().getCompanyName().equals(company.getCompanyName())){
				resultData.setResultMsg("不能冻结自己公司");
			}else if(!company.getIsVerification()){
				resultData.setResultMsg("不能冻结未审核通过公司");
			}else if(company.getIsFreeze()){
				resultData.setResultMsg("不能冻结已冻结公司");
			}
		}
			
		}
		return SUCCESS;
   }
   
  public String notFreeze(){
		resultData=new ResultData();
		if(StringUtils.isNotEmpty(ids))
		{//更新数据状态
			String[]  idList=ids.split("@");
			for(String id : idList){
		   TblCompany company=companyService.findObjectById(id);
		   if(!company.getIsVerification() && company.getIsFreeze()){
			   companyService.notfreezeCompanyByIds(idList);
				resultData.setResultFlag(true);
				return SUCCESS;
		   }else if(company.getIsVerification()){
			   resultData.setResultMsg("不能取消审核通过的公司");
		   }
		   else if(!company.getIsFreeze()){
			   resultData.setResultMsg("不能取消未冻结的公司");
		   }
			}
		}
		return SUCCESS;
  }
  
	// 跳转到列表页面
	public String companyList(){
//		companyList = companyService.findAll();
		 //pageList = companyService.getPageList(tblcompany, pageNow, pageSize);
		 pageList = companyService.findCompanyList(tblcompany, pageNow, pageSize);
		return "companyList";
	}

	/**
	 * 校验账号名称
	 */
	public void checkCompanyname(){
		if(companyService.checkCompanyname(tblcompany)){
			toJson("true");
		}else{
			toJson("false");
		}
	}
	
	/**
	 * 校验账号名称
	 */
	public void checkCompanymobile(){
		TblUser user=new TblUser();
		user.setMobile(tblcompany.getCompanyMobile());
		HashSet<TblUser> set = new HashSet<TblUser>();
		set.add(user);
		if(companyService.checkCompanymobile(tblcompany) && userService.checkUsermobile(user)){
			toJson("true");
		}else{
			toJson("false");
		}
	}
	/**
	 * 校验手机
	 */
	public void checkRegisteCompanymobile(){
		TblUser user=new TblUser();
		user.setMobile(tblcompany.getCompanyMobile());
		HashSet<TblUser> set = new HashSet<TblUser>();
		set.add(user);
		if(companyService.checkCompanymobile(tblcompany) && userService.checkUsermobile(user)){
			toJson("true");
		}else{
			toJson("false");
		}
	}
	/**
	 * 校验账号名称
	 */
	public void checkRegisteCompanyname(){
		if(companyService.checkCompanyname(tblcompany)){
			toJson("true");
		}else{
			toJson("false");
		}
	}
	
	
	
	
	// 跳转到保存页面
	public String companyEdit() {
		
		if(tblcompany != null && tblcompany.getCompanyId() != null){
		tblcompany = companyService.findObjectById(tblcompany.getCompanyId());
		}
		
		return "companyEdit";
	}
	
		public String companyRegiste() {
		
		if(tblcompany != null && tblcompany.getCompanyId() != null){
		tblcompany = companyService.findObjectById(tblcompany.getCompanyId());
		}
		return "companyRegiste";
		}
		
		/**
		 * 网页公司注册
		 * @return
		 */
		public String doRegister(){
			resultData = new ResultData();
			tblcompany.setIsVerification(false);
			tblcompany.setDataStatus(1);
			tblcompany.setIsFreeze(false);
			tblcompany.setCreateTime(DateUtils.getCurrentDateTimeStamp());
			companyService.save(tblcompany);
			resultData.setResultFlag(true);
			return SUCCESS;
		}
		
		public String companyFind(){
			
			 if(tblcompany!=null){
				 tblcompany=companyService.findObjectById(tblcompany.getCompanyId());
				 if(tblcompany.getIsVerification() && tblcompany.getGsAdmin()!=null){
				 tblUser=userService.findObjectById(tblcompany.getGsAdmin().getUserId());
				 }
			 }
			 
			 return "companyFind";
			
		}
       //app注册
		public String register() {
			
			if(tblcompany != null && tblcompany.getCompanyId() != null){
			tblcompany = companyService.findObjectById(tblcompany.getCompanyId());
			
			}
			return "register";
			}
		
		
		
	
		/***
		 * 手机端注册
		 * @return
		 */
		public String mobileRegiste(){
			resultData = new ResultData();
			if(tblcompany != null && StringUtils.isEmpty(tblcompany.getCompanyId())){
					tblcompany.setIsVerification(false);
					tblcompany.setDataStatus(1);
					tblcompany.setIsFreeze(false);
					tblcompany.setCreateTime(DateUtils.getCurrentDateTimeStamp());
					companyService.save(tblcompany);
				}
		
				resultData.setResultFlag(true);
			return SUCCESS;

		}
		
		
	// 跳转到审核页面
	public String companyAudit(){
		if(tblcompany != null && tblcompany.getCompanyId() != null){
			tblcompany = companyService.findObjectById(tblcompany.getCompanyId());
			}
		return "companyAudit";
	}
	
	//点击操作查看公司详情
	public String companyDetailList(){
		if(tblcompany!=null){
			tblcompany=companyService.findObjectById(tblcompany.getCompanyId());
		}
		return "companyDetailList";
	}

	/**
	 * 上传图片
	 * @author hao.wang 2016年3月31日15:31:58
	 * @return
	 * @throws Exception
	 */
	  /*public String imageUpload() throws Exception {
		  try {
			if(image != null){
				//获取保存路径的绝对地址/WorkLogSystem/WebRoot/upload/company
				String filePath = ServletActionContext.getServletContext().getRealPath("/upload/company");
				String fileName = UUID.randomUUID().toString().replaceAll("-", "") + imageFileName.substring(imageFileName.lastIndexOf("."));
				imagePath = "upload/company/" + fileName;
				//复制文件
				FileUtils.copyFile(image, new File(filePath, fileName));
			}else{
				  message="请选择文件!";
	                return ERROR;
			}
		  }catch (Exception e) {
	            e.printStackTrace();
	            message = "对不起,文件上传失败了!!!!";
		  }
	        return SUCCESS;
	    }*/
	  
	  public String registerImageUpload() throws Exception {
		  try {
			if(image != null){
				//获取保存路径的绝对地址/WorkLogSystem/WebRoot/upload/company
				String filePath = ServletActionContext.getServletContext().getRealPath("/upload/company");
				String fileName = UUID.randomUUID().toString().replaceAll("-", "") + imageFileName.substring(imageFileName.lastIndexOf("."));
				imagePath = "upload/company/" + fileName;
				//复制文件
				FileUtils.copyFile(image, new File(filePath, fileName));
			}else{
				  message="请选择文件!";
	                return ERROR;
			}
		  }catch (Exception e) {
	            e.printStackTrace();
	            message = "对不起,文件上传失败了!!!!";
		  }
	        return SUCCESS;
	    }
	
	public List<TblCompany> getCompanyList() {
		return companyList;
	}

	public void setCompanyList(List<TblCompany> companyList) {
		this.companyList = companyList;
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public TblCompany getTblcompany() {
		return tblcompany;
	}

	public void setTblcompany(TblCompany tblcompany) {
		this.tblcompany = tblcompany;
	}

	
	
	public TblUser getTblUser() {
		return tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
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

	public String getImagePath() {
		return imagePath;
	}

	public List<TblUser> getUserList() {
		return userList;
	}

	public void setUserList(List<TblUser> userList) {
		this.userList = userList;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public class UplaodFileBack {
		private String fileName;
		private String filePath;
		private String fileUrl;
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public String getFilePath() {
			return filePath;
		}
		public void setFilePath(String filePath) {
			this.filePath = filePath;
		}
		public String getFileUrl() {
			return fileUrl;
		}
		public void setFileUrl(String fileUrl) {
			this.fileUrl = fileUrl;
		}


		
		
	}

	public List<TblCompany> getCompanyDetailList() {
		return companyDetailList;
	}

	public void setCompanyDetailList(List<TblCompany> companyDetailList) {
		this.companyDetailList = companyDetailList;
	}
	
}
