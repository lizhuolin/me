package com.poobo.timereport.dao;

import java.util.List;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblProject;
import com.poobo.core.entity.TblTimereport;

public interface ITimeReportDao extends IBaseDao<TblTimereport>{

	public List<TblProject> findOneMonthProject();

	public List<TblTimereport> findByYearAndMonth(int year, int month);

}
