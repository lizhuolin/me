package com.poobo.timereport.service;

import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.poobo.core.entity.TblTimereport;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface ITimeReportService extends IBaseService<TblTimereport>{
	/**
	 *生成定时报告
	 */
	public void doTimeReport();
	/**
	 * 获取分页对象
	 * @param timeReport
	 * @param pageNow
	 * @param pageSize
	 */
	public PageController<TblTimereport> getPageList(TblTimereport timeReport, int pageNow, int pageSize);
	
	/**
	 * 导出定时报告excel
	 * @param findAll
	 * @param outputStream
	 */
	public void exportExcel(List timeReports, ServletOutputStream outputStream);
	public PageController<TblTimereport> findTimeReportList(Calendar cal1,
			Calendar cal2, int pageNow, int pageSize);
	
	public List<Integer> getMonthByYear(Integer year);
	
	public List<TblTimereport> findByYearAndMonth(int year,int month);
	

		
}
