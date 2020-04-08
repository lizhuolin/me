package com.poobo.task.service;

import java.util.Date;
import java.util.List;

import com.poobo.core.entity.TblRole;
import com.poobo.core.entity.TblTask;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;



public interface ITaskService extends IBaseService<TblTask>{

	/**
	 * 分页查询任务列表
	 * @param task
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	PageController<TblTask> getPageList(TblTask task, int pageNow, int pageSize);
	
	/**
	 * 条件查询所有任务
	 * @param task
	 * @return
	 */
	List<TblTask> findTaskList(TblTask task);

	void newTask(TblTask tblTask);

	void updateTask(TblTask tblTask);

	void delTaskByIds(String[] idList);
	
//操作日志
public void logRemable(String changelogContent,Integer changelogType,String changelogmodel);	
	
	/**
	 * 根据角色条件查询角色列表
	 * @param role
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageController<TblTask> findTaskList(TblTask tblTask, int pageNow,
			int pageSize);
/**
 * 根据公司id查找所有任务
 * @return
 */
	List<TblTask> findTaskByCompanyId(String companyId);

    List<TblTask> findTaskByUserId(String userId);

    
    
    /**
     * 手机查询任务列表
     * @param tblTask
     * @param rowIndex
     * @param pageSize
     * @return
     */
	List<TblTask> findTaskList4Mobile(TblTask tblTask, int rowIndex, int pageSize);

	List<TblTask> findTaskList4Mobile(TblTask tblTask, int rowIndex, int pageSize, String companyId);

	List<TblTask> findTaskByUserIdAndTime(String userId, Date taskInDate);

	
	
	
}
