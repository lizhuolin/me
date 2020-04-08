package com.poobo.core.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 获取属性配置
 * 
 * @author lei.ma 2016年1月10日 下午3:44:21
 *
 */
@Component("PropertyConfigurer")
public class PropertyConfigurer {

	@Value("${file.rootPath}")
	private String fileRootPath;//文件保存根路径
	
	@Value("${file.savePath}")
	private String fileSavePath;//文件保存路径
	
	@Value("${file.fileAccessUrl}")
	private String fileAccessUrl;//文件访问根路径

	@Value("${file.tempPath}")
	private String fileTempPath;//文件缓存路径

	@Value("${app.apkFilePath}")
	private String apkFilePath;	//app安装文件路径
	@Value("${ServerAddress}")
	private String ServerAddress;
	
	public String getServerAddress() {
		return ServerAddress;
	}

	public String getFileSavePath() {
		return fileSavePath;
	}

	public String getFileTempPath() {
		return fileTempPath;
	}

	public String getFileRootPath() {
		return fileRootPath;
	}

	public String getFileAccessUrl() {
		return fileAccessUrl;
	}

	public String getApkFilePath() {
		return apkFilePath;
	}

}
