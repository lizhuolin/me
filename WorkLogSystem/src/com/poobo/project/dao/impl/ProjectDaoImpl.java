package com.poobo.project.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblPlan;
import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblUserProject;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.project.dao.IProjectDao;


public class ProjectDaoImpl extends BaseDaoImpl<TblProject>implements IProjectDao{

	@Override
	public void delUserProject(String id ,String projectId) {
		Query query = getSession().createQuery("DELETE TblUserProject rp WHERE rp.id.tblUser.userId =? and rp.id.tblProject.projectId =?");
		query.setParameter(0, id);
		query.setParameter(1,projectId);
		query.executeUpdate();
	}

	@Override
	public List<TblProject> getAllProjectByCompanyId(String companyId) {
		Query query = getSession().createQuery(" FROM TblProject WHERE tblCompany.companyId =? and dataStatus =?");
		 
		query.setParameter(0, companyId);
		query.setParameter(1, EnumDataStatus.NORMAL.getValue());
		List<TblProject> list=query.list();
		return list;
	}

	@Override
	public List<TblUserProject> findProjectByUser(String userId) {
		Query query = getSession().createQuery("FROM  TblUserProject rp WHERE rp.id.tblUser.userId = ?");
		query.setParameter(0, userId);
		return query.list();
	}
	
}
