package com.poobo.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.TblProjectChild;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.PageController;
import com.poobo.project.dao.IProjectChildDao;
import com.poobo.project.service.IProjectChildService;

@Service("projectChildService")
public class ProjectChildServiceImpl extends BaseServiceImpl<TblProjectChild> implements IProjectChildService{
	
	private IProjectChildDao projectChildDao;
	@Resource 
	public void setProjectChildDao(IProjectChildDao projectChildDao) {
		super.setBaseDao(projectChildDao);
		this.projectChildDao =projectChildDao;
	}
	@Override
	public  PageController<TblProjectChild> getPageList(TblProjectChild tblProjectChild, int pageNow,
			int pageSize,String projectId) {
		PageController list=new PageController<TblProjectChild>(30, 10, 2);
		list.setPageNow(pageNow);
		Criteria criteria=projectChildDao.createCriteria(TblProjectChild.class);
		if(tblProjectChild!=null){
			if(tblProjectChild.getProjectName().equals("%")){
				criteria.add(Restrictions.ilike("projectName", "\\%"));
			}else if(StringUtils.isNotEmpty(tblProjectChild.getProjectName())){
				criteria.add(Restrictions.ilike("projectName", tblProjectChild.getProjectName()));
			}
		}
		if( StringUtils.isNotEmpty(projectId))
		criteria.add(Restrictions.eq("tblProject.projectId",projectId ));
		criteria.add(Restrictions.eq("dataStatus",EnumDataStatus.NORMAL.getValue() ));
		return projectChildDao.findPageByCriteria(criteria, pageNow, pageSize);
		
	}
	@Override
	public void delProjectByIds(String[] idList) {
		for(String id:idList){
			TblProjectChild tblProjectChild=super.findObjectById(id);
			tblProjectChild.setDataStatus(EnumDataStatus.DEL.getValue());
			//初始化任务未开始
			super.merge(tblProjectChild);
		}
		
	}
	@Override
	public List<TblProjectChild> findAllByProjectId(String projectId) {
		Criteria criteria=projectChildDao.createCriteria(TblProjectChild.class);
		criteria.add(Restrictions.eq("tblProject.projectId",projectId ));
		criteria.add(Restrictions.eq("dataStatus",EnumDataStatus.NORMAL.getValue() ));
		return criteria.list();
	}
}
