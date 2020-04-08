package com.poobo.fileoperate.action;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.poobo.core.util.FileOperation;
import com.poobo.core.util.PropertyConfigurer;
import com.poobo.core.util.ResultData;

/**
 * 文件操作类
 * 
 * @author lei.ma 2016年1月10日 下午3:18:40
 *
 */
public class FileOperateAction extends ActionSupport{
	@Autowired
	PropertyConfigurer propertyConfigurer;
	private File image;
	private String imageContentType;
	private String imageFileName;

    private String message = "你已成功上传文件";
    private String error ="";
    private String imagePath;
    //日志上传文件模块
    private File logUpload;
    private String logUploadContentType;
    private String logUploadFileName;
    private String logUploadPath;
    // 子路径，如用户模块代表user
    String childPath;
    /**
	 * 上传图片
	 * @author hao.wang 2016年3月31日15:31:58
	 * @param 
	 * @throws Exception
	 */
	  public String imageUpload() throws Exception {
		  try {
			if(image != null){
			  if(!(imageFileName.toLowerCase().endsWith(".jpg")||
				 imageFileName.toLowerCase().endsWith(".png")||
				 imageFileName.toLowerCase().endsWith(".bmp")||
				 imageFileName.toLowerCase().endsWith(".jpge") )){
	                error="图片格式必须为jpg,png,bmp,jpge!";
	                return ERROR;
	            }
				//获取保存路径的绝对地址/WorkLogSystem/WebRoot/upload/user
				String filePath = propertyConfigurer.getFileRootPath() + "/" + propertyConfigurer.getFileSavePath() +childPath;
				String fileName = UUID.randomUUID().toString().replaceAll("-", "") + imageFileName.substring(imageFileName.lastIndexOf("."));
				imagePath = propertyConfigurer.getFileSavePath() + childPath + "/" +fileName;
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
	  /**
	   * 日志模块上传文件方法
	   * @author Jolin.lee 
	   * @date 2016年4月28日 上午10:14:48
	   * @return
	   */
	  public String fileUpload() throws Exception{
		  try{
			  if(logUpload!=null){
				  	//获取保存路径的绝对地址/WorkLogSystem/WebRoot/upload/user
					String filePath = propertyConfigurer.getFileRootPath() + "/" + propertyConfigurer.getFileSavePath() +childPath;
					String fileName = UUID.randomUUID().toString().replaceAll("-", "") + logUploadFileName.substring(logUploadFileName.lastIndexOf("."));
					logUploadPath = propertyConfigurer.getFileSavePath() + childPath + "/" +fileName;
					//复制文件
					FileUtils.copyFile(logUpload, new File(filePath, fileName));
					
			  }else{
				  message="请选择文件!";
	              return ERROR;
			  }
		  }catch(Exception e){
			  e.printStackTrace();
			  message="对不起文件上传失败了！！！！";
		  }
		  return SUCCESS;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}



	public String getChildPath() {
		return childPath;
	}



	public void setChildPath(String childPath) {
		this.childPath = childPath;
	}



	public String getError() {
		return error;
	}



	public void setError(String error) {
		this.error = error;
	}
	public File getLogUpload() {
		return logUpload;
	}
	public void setLogUpload(File logUpload) {
		this.logUpload = logUpload;
	}
	public String getLogUploadContentType() {
		return logUploadContentType;
	}
	public void setLogUploadContentType(String logUploadContentType) {
		this.logUploadContentType = logUploadContentType;
	}
	public String getLogUploadFileName() {
		return logUploadFileName;
	}
	public void setLogUploadFileName(String logUploadFileName) {
		this.logUploadFileName = logUploadFileName;
	}
	public String getLogUploadPath() {
		return logUploadPath;
	}
	public void setLogUploadPath(String logUploadPath) {
		this.logUploadPath = logUploadPath;
	}
    
	
}
