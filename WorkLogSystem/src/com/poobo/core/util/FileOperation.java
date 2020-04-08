/* -----------------------------------------------------------------------
 * Project:     
 * FileName:    FileOperation.java
 * PackageName: com.ternary.common
 * Company:     NEC
 * History:     2007-02-28 (Zheng Guang Le) Create.
 * History:     2007-03-09 (Zheng Guang Le) Modify.
 * History:     2009-05-06 (Zheng Guang Le) refact to jdk1.6.
 * -----------------------------------------------------------------------*/
package com.poobo.core.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.log4j.Logger;

public abstract class FileOperation {
	private static final Logger logger=Logger.getLogger(FileOperation.class);
	

	/**
	 * 保存文件到本地
	 * @param dir		目录
	 * @param file		要保存的文件
	 * @param originalName	原始文件名（全名）
	 * @param newName		新的文件名
	 * @return
	 */
	public static String saveFile(File dir, File file, String originalName, String newName) {
		
		OutputStream out = null;
		try(InputStream in = new FileInputStream(file)) {
			String prefix = "";
			int index = originalName.lastIndexOf(".");
			if (-1 != index) {
				prefix = "." + originalName.substring(index + 1);
			}
			File uploadFile = new File(dir, newName + prefix);
			if(!uploadFile.exists()){
				uploadFile.mkdirs();
			}
			
			if (uploadFile.exists()){
				uploadFile.delete();
			}
			out = new FileOutputStream(uploadFile);
			byte[] buffer = new byte[1024 * 1024];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			return newName + prefix;
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		} finally {
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					logger.error(e.getMessage(), e);
				}
			}
		}
		return null;
	}
}
