package com.poobo.test.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TestAction extends ActionSupport {

    private File file;
    private String fileFileName;
    private String fileFileContentType;

    private String message = "你已成功上传文件";
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileFileContentType() {
        return fileFileContentType;
    }

    public void setFileFileContentType(String fileFileContentType) {
        this.fileFileContentType = fileFileContentType;
    }
    
    public String test(){
    	return "test";
    }
        

    @SuppressWarnings("deprecation")
    public String imageUpload() throws Exception {
        
        String path = ServletActionContext.getRequest().getRealPath("/upload");

        try {
            File f = this.getFile();
            if(this.getFileFileName().endsWith(".exe")){
                message="对不起,你上传的文件格式不允许!!!";
                return ERROR;
            }
            FileInputStream inputStream = new FileInputStream(f);
            FileOutputStream outputStream = new FileOutputStream(path + "/"+ this.getFileFileName());
            byte[] buf = new byte[1024];
            int length = 0;
            while ((length = inputStream.read(buf)) != -1) {
                outputStream.write(buf, 0, length);
            }
            inputStream.close();
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
            message = "对不起,文件上传失败了!!!!";
        }
        return SUCCESS;
    }

}