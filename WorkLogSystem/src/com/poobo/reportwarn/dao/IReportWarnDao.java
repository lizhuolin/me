package com.poobo.reportwarn.dao;

import java.util.List;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblPlan;
import com.poobo.core.entity.TblReportwarn;
import com.poobo.core.entity.TblTask;

public interface IReportWarnDao extends IBaseDao<TblReportwarn>{
	/**
	 * 查找需要添加到提醒报告的任务
	 * @return
	 */
	public List<TblTask> findTasks();
	/**
	 * 查找需要添加到提醒报告的计划
	 * @return
	 */
	public List<TblPlan> findPlans();
	/**
	 * 查找当前员工昨天日志
	 * @param isHome 
	 * @return
	 */
	public List<TblLog> findLog4Yesterday(boolean isHome);
	
	
	public List<TblReportwarn> findReportWarns();
	
	/**
	 * 每日定时删除提醒报告
	 */
	public void deleteAllReportWarns();
}
