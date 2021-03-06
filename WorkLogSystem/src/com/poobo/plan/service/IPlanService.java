package com.poobo.plan.service;

import java.util.List;

import javax.servlet.ServletOutputStream;

import com.poobo.core.entity.TblPlan;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface IPlanService extends IBaseService<TblPlan>{
	
	PageController<TblPlan> getPageList(TblPlan tblPlan, int pageNow,
			int pageSize);

	PageController <TblPlan>getPlanListByProjectId(TblPlan tblPlan,String projectId, int pageNow,
			int pageSize);

	void delPlanByIds(String[] idList);

	List<TblPlan> findAllbyProjectid(String projectId);

	void exportExcel(List<TblPlan> findAllbyProjectid,
			ServletOutputStream outputStream);

	List<TblPlan> findAllbyProjectChildId(String projectChildRealId);

	PageController <TblPlan> getPlanListByProjectChildId(TblPlan tblPlan,String projectChildRealId,int pageNow,int pageSize);
}
