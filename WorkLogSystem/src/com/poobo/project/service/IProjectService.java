package com.poobo.project.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblUserProject;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface IProjectService extends IBaseService<TblProject>{

	public void delProjectByIds(String[] idList);

	public PageController <TblProject> getAllProjectByCompanyId(String companyId, int pageNow,
			int pageSize);
	

	public PageController findProjectList(TblProject tblProject, int pageNow, int pageSize);

	public void delUserProject(String id, String projectId);

	public List<TblProject> getAllProjectByCompanyId(String companyId);

	public List<TblProject> findProjectList4Mobile(TblProject tblProject,
			int rowIndex, int pageSize,String CompanyId);

	public List<TblUserProject> findUserProjectByUser(String userId);

	public boolean checkCompanyname(TblProject tblProject);

	public TblLog findObjectById(Set tblProjects);


}
