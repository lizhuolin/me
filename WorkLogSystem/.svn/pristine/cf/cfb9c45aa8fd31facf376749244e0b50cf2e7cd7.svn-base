package com.poobo.plan.dao.impl;

import java.util.List;

import org.aspectj.apache.bcel.generic.Type;
import org.hibernate.Query;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblPlan;
import com.poobo.core.enums.EnumDataPrivilege;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.util.GetSessionData;
import com.poobo.plan.dao.IPlanDao;

public class PlanDaoImpl extends BaseDaoImpl<TblPlan>implements IPlanDao{
	/**
	 * 根据项目id查找出所有的计划列表
	 */
	@Override
	public List<TblPlan> findAllByProjectId(String projectId) {
		String str=" FROM TblPlan WHERE tblProject.projectId =? and dataStatus =?";
		if(GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
			str=str+" and planManager.userId =?";
		}
		Query query = getSession().createQuery(str);
		
		query.setParameter(0, projectId);
		query.setParameter(1, EnumDataStatus.NORMAL.getValue());
		if(GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
			query.setParameter(2, GetSessionData.getUser().getUserId());
		}
		List<TblPlan> list=query.list();
		return list;
	}

	@Override
	public List<TblPlan> findAllByProjectChildId(String projectChildRealId) {
		String str=" FROM TblPlan WHERE tblProjectChild.projectChildRealId =? and dataStatus =?";
		if(GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
			str=str+" and planManager.userId =?";
		}
		Query query = getSession().createQuery(str);
		query.setParameter(0, projectChildRealId);
		query.setParameter(1, EnumDataStatus.NORMAL.getValue());
		if(GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
			query.setParameter(2, GetSessionData.getUser().getUserId());
		}
		List<TblPlan> list=query.list();
		return list;
	}

}
