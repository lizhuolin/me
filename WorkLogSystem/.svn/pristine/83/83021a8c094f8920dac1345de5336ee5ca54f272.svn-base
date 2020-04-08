package com.poobo.changelog.service;

import java.sql.Timestamp;

import com.poobo.core.entity.TblChangelog;
import com.poobo.core.entity.TblRole;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface IChangelogService extends IBaseService<TblChangelog>{
	
	public PageController<TblChangelog> getPageList(TblChangelog logs, int pageNow, int pageSize);
	
	
	public PageController<TblChangelog> findChangelogList(Timestamp startTime, Timestamp endTime, TblChangelog logs, int pageNow,int pageSize);
	
	/**
	 * 操作日志
	 * @param changelogContent 修改内容
	 * @param changelogType 日志类型：0添加，1编辑，2删除，3导出，4登陆
	 * @param changelogmodel  操作模块
	 */
	public  void logRemable(String changelogContent,Integer changelogType,String changelogmodel);

}
