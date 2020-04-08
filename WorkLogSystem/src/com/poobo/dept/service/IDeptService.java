package com.poobo.dept.service;


import java.util.List;

import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblDept;
import com.poobo.core.entity.TblPlan;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;


public interface IDeptService extends IBaseService<TblDept>{

	PageController<TblDept> getPageList(TblDept tblorganization, int pageNow, int pageSize);

	void delDeptByIds(String[] idList);
	
	/**
	 * 根据角色条件查询角色列表
	 * @param role
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageController<TblDept> findDeptList(TblDept dept, int pageNow,
			int pageSize);

	List<TblDept> findDeptsByCompanyId(String companyId);
	

}
