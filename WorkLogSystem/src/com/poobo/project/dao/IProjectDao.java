package com.poobo.project.dao;

import java.util.Date;
import java.util.List;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblUserProject;

public interface IProjectDao extends IBaseDao<TblProject>{

	void delUserProject(String id, String projectId);

	List<TblProject> getAllProjectByCompanyId(String companyId);

	List<TblUserProject> findProjectByUser(String userId);


}
