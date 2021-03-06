package com.poobo.project.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblPlan;
import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblUserProject;
import com.poobo.core.enums.EnumDataPrivilege;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;
import com.poobo.core.util.QueryHelper;
import com.poobo.project.dao.IProjectDao;
import com.poobo.project.enums.EnumProjectStatus;
import com.poobo.project.service.IProjectService;

@Service("projectService")
public class ProjectServiceImpl  extends BaseServiceImpl<TblProject> implements IProjectService{
	
	private IProjectDao projectDao;
	@Resource 
	public void setProjectDao(IProjectDao projectDao) {
		super.setBaseDao(projectDao);
		this.projectDao =projectDao;
	}
	
	@Override
	public void delProjectByIds(String[] idList) {
		for(String id:idList){
			TblProject tblProject=super.findObjectById(id);
			tblProject.setDataStatus(EnumDataStatus.DEL.getValue());
			//初始化任务未开始
			super.merge(tblProject);
		}
		
	}
	/**
	 * 根据公司id查询项目列表
	 */
	@Override
	public PageController<TblProject> getAllProjectByCompanyId(String companyId,
			int pageNow, int pageSize) {
		Criteria criteria=projectDao.createCriteria(TblProject.class);
		criteria.add(Restrictions.eq("tblCompany.companyId", companyId));
		criteria.add(Restrictions.eq("dataStatus", EnumDataStatus.NORMAL.getValue()));
		return projectDao.findPageByCriteria(criteria, pageNow, pageSize);
	}
	
	/**
	 * 根据角色条件查询项目列表
	 * @param role
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageController<TblProject> findProjectList(TblProject tblProject, int pageNow,
			int pageSize) {
		
		StringBuffer sb=new StringBuffer();
		sb.append(" from TblProject where 1=1 ");
		Map<String, Object> namedParam = new HashMap<String, Object>();
		if (null != tblProject) {
			if (StringUtils.isNotEmpty(tblProject.getProjectName())) {
				if(!tblProject.getProjectName().equals("%")){
					namedParam.put("projectName", "%"+tblProject.getProjectName()+"%");
					sb.append(" and projectName like :projectName");
				}else{
					namedParam.put("projectName", "%"+"\\%"+"%");
					sb.append(" and projectName like :projectName");
				}
			}
			if (tblProject.getProjectManager()!=null&&StringUtils.isNotEmpty(tblProject.getProjectManager().getName())){
				if(tblProject.getProjectManager().getName().equals("%")){
				sb.append(" and projectManager.name =:ManagerName");
				namedParam.put("ManagerName","%" + "\\%" +"%");
				}else{
					sb.append(" and projectManager.name like :ManagerName");
					namedParam.put("ManagerName","%"+ tblProject.getProjectManager().getName()+"%");
				}
			}
			if (tblProject.getTblCompany()!=null&&StringUtils.isNotEmpty(tblProject.getTblCompany().getCompanyName())){
				if(!tblProject.getProjectName().equals("%")){
					sb.append(" and tblCompany.companyName like :companyName");
					namedParam.put("companyName","%"+ tblProject.getTblCompany().getCompanyName()+"%");
				}else{
					namedParam.put("projectName", "%"+"\\%"+"%");
					sb.append(" and projectName like :projectName");
				}
			
			}
			  if(tblProject.getProjectStatus() != null){
				 sb.append(" and projectStatus=:projectStatus");
				namedParam.put("projectStatus", tblProject.getProjectStatus());
			}
			  if(tblProject.getProjectStartTime() != null && tblProject.getProjectEndTime() !=null){
				  sb.append(" and projectStartTime  between:projectStartTime and:projectEndTime");
					namedParam.put("projectStartTime", tblProject.getProjectStartTime());
					namedParam.put("projectEndTime", tblProject.getProjectEndTime());
			  }else if(tblProject.getProjectStartTime() != null && tblProject.getProjectEndTime() ==null){
				  sb.append(" and projectStartTime  >=:projectStartTime");
					namedParam.put("projectStartTime", tblProject.getProjectStartTime());
			  }else if(tblProject.getProjectStartTime() == null && tblProject.getProjectEndTime() !=null){
				  sb.append(" and projectStartTime  <=:projectEndTime");
					namedParam.put("projectEndTime", tblProject.getProjectEndTime());
			  }
			  
		}
			if(!GetSessionData.getUser().getIsUserPlatform()){
				sb.append(" and tblCompany.companyId=:tblCompany");
				namedParam.put("tblCompany",GetSessionData.getUser().getTblCompany().getCompanyId());
				}
			//数据权限
/*			if(GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
				List<TblUserProject> userProjectList = findUserProjectByUser(GetSessionData.getUser().getUserId());
				List<TblProject> projectList = new ArrayList<TblProject>();
				for(TblUserProject userProject:userProjectList){
					TblProject project = userProject.getId().getTblProject();
					project = findObjectById(project.getProjectId());
					projectList.add(project);
				}
				
				if(userProjectList != null && userProjectList.size() > 0){
					sb.append(" and tblCompany.companyId=:tblCompany");
					namedParam.put("tblCompany",GetSessionData.getUser().getTblCompany().getCompanyId());
					}
				}*/
			sb.append(" and dataStatus=:dataStatus");
			namedParam.put("dataStatus", EnumDataStatus.NORMAL.getValue());
			sb.append(" order by createTime desc");
	
		return projectDao.findPageByHql(sb.toString(), namedParam, pageNow, pageSize);
	}
	@Override
	public void delUserProject(String id,String projectId) {
		projectDao.delUserProject(id,projectId);
	}
	@Override
	public List<TblProject> getAllProjectByCompanyId(String companyId) {
		
		return projectDao.getAllProjectByCompanyId(companyId);
	}
	@Override
	public List<TblProject> findProjectList4Mobile(TblProject tblProject,
			int rowIndex, int pageSize,String companyId) {
		Criteria criteria =projectDao.createCriteria(TblProject.class);
		if(null!=tblProject){
			if(null!=tblProject.getProjectManager() && !StringUtils.isEmpty(tblProject.getProjectManager().getUserId())){
				criteria.add(Restrictions.eq("projectManager.userId", tblProject.getProjectManager().getUserId()));
				}
			if(!StringUtils.isEmpty(tblProject.getProjectId())){
				criteria.add(Restrictions.eq("projectId", tblProject.getProjectId()));
			}
		}	
		criteria.add(Restrictions.eq("dataStatus", EnumDataStatus.NORMAL.getValue()));
		if(GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
			List<TblUserProject> userProjectList=findUserProjectByUser(GetSessionData.getUser().getUserId());
			List<TblProject> projectList=new ArrayList<TblProject>();
			for(TblUserProject userProject:userProjectList){
				TblProject project= userProject.getId().getTblProject();
				project=findObjectById(project.getProjectId());
				if(project.getDataStatus()==1 && project.getProjectStatus()==1){
						projectList.add(project);
				}
			}
			return projectList;
		}
		criteria.add(Restrictions.eq("tblCompany.companyId", companyId));
		criteria.addOrder(Order.desc("createTime"));
		criteria.setFirstResult(rowIndex);
		criteria.setMaxResults(pageSize);
		return criteria.list();
	}
	@Override
	public List<TblUserProject> findUserProjectByUser(String userId) {
		
		return projectDao.findProjectByUser(userId);
	}

	@Override
	public boolean checkCompanyname(TblProject tblProject) {
		QueryHelper queryHelper = new QueryHelper(TblProject.class,"u");
		queryHelper.addCondition("u.projectName=?",tblProject.getProjectName());
		if(GetSessionData.getUser().getIsUserPlatform()){
			
		}else{
			 queryHelper.addCondition("u.tblCompany.companyId=?", GetSessionData.getUser().getTblCompany().getCompanyId());
		}
		queryHelper.addCondition("u.dataStatus=?",EnumDataStatus.NORMAL.getValue());
		List<TblProject> list =findObjects(queryHelper);
		if(list == null || list.size() == 0){
			return true;
		}else{
			// 排除编辑情况下，检测当前编辑的对象
			if(list.size() == 1 && tblProject.getProjectId()!=null){
				if(tblProject.getProjectId().equals(list.get(0).getProjectId())){
					return true;
				}
			}
			return false;
		}
	}

	@Override
	public TblLog findObjectById(Set tblProjects) {
		// TODO Auto-generated method stub
		return null;
	}


}
