package com.poobo.timereport.dao.impl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblTimereport;
import com.poobo.core.util.GetSessionData;
import com.poobo.plan.enums.EnumPlanStatus;
import com.poobo.timereport.dao.ITimeReportDao;


public class TimeReportDaoImpl extends BaseDaoImpl<TblTimereport> implements ITimeReportDao{

	@Override
	public List<TblProject> findOneMonthProject() {
		//Criteria  criteria =createCriteria(TblProject.class);
		//定时报告开始时间
		Calendar calStart = Calendar.getInstance();
		Calendar calEnd = Calendar.getInstance();
		
		calStart.add(Calendar.MONTH, -1);//上月
		calStart.set(Calendar.DAY_OF_MONTH, 1);//一号
		calStart.set(Calendar.HOUR_OF_DAY,0);//0时
		calStart.set(Calendar.MINUTE,0);//0分
		calStart.set(Calendar.SECOND,0);//0秒
		

		calEnd.set(Calendar.DAY_OF_MONTH, 1);//本月一号
		calEnd.set(Calendar.HOUR_OF_DAY,0);//0时
		calEnd.set(Calendar.MINUTE,0);//0分
		calEnd.set(Calendar.SECOND,0);//0秒
		
		Query query = getSession().createQuery("FROM  TblProject WHERE projectStartTime between ? and ? OR projectStatus != ?");
		query.setDate(0, calStart.getTime());
		query.setDate(1, calEnd.getTime());
		query.setInteger(2, EnumPlanStatus.OVER.getValue());

		return query.list();
	}

	@Override
	public List<TblTimereport> findAll() {
		Query query = getSession().createQuery("FROM TblTimereport WHERE tblCompany.companyId = ?");
		query.setParameter(0, GetSessionData.getUser().getTblCompany().getCompanyId());
		return query.list();
	}

	@Override
	public List<TblTimereport> findByYearAndMonth(int year, int month) {
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.set(Calendar.YEAR,year);
		cal1.set(Calendar.MONTH,month-1);
		cal1.set(Calendar.DAY_OF_MONTH,1);
		
		cal2.set(Calendar.YEAR,year);
		cal2.set(Calendar.MONTH,month);
		cal2.set(Calendar.DAY_OF_MONTH,1);
		Query query = getSession().createQuery("FROM TblTimereport WHERE tblCompany.companyId = ? AND createTime BETWEEN ? AND ?");
		query.setParameter(0, GetSessionData.getUser().getTblCompany().getCompanyId());
		query.setParameter(1,cal1.getTime());
		query.setParameter(2,cal2.getTime());
		return query.list();
		
	}
	
}
