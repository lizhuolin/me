package com.poobo.timereport.action;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.TblTimereport;
import com.poobo.timereport.service.ITimeReportService;

public class TimeReportAction extends BaseAction<TblTimereport> {
	@Resource
	private ITimeReportService timeReportService;
	private TblTimereport timeReport;
	private Integer year;
	private Integer month;
	private List<Integer> monthList;
	/**
	 * 跳转到定时报告
	 * @return 
	 */
	public String timeReportList(){
		ActionContext.getContext().getContextMap().put("yearList", TblTimereport.yearList);
		if(year ==null || year == Calendar.getInstance().get(Calendar.YEAR)){
		 ActionContext.getContext().getContextMap().put("monthList", timeReportService.getMonthByYear(Calendar.getInstance().get(Calendar.YEAR)));
		}else{
			ActionContext.getContext().getContextMap().put("monthList", timeReportService.getMonthByYear(Calendar.getInstance().get(Calendar.YEAR)-1));
		}
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		if(year != null && month != null){
			cal1.set(Calendar.YEAR,year);
			cal1.set(Calendar.MONTH,month-1);
			cal1.set(Calendar.DAY_OF_MONTH,1);
			
			cal2.set(Calendar.YEAR,year);
			cal2.set(Calendar.MONTH,month);
			cal2.set(Calendar.DAY_OF_MONTH,1);
		}else{
			
			cal1.add(Calendar.MONTH, -1);//上月
			cal1.set(Calendar.DAY_OF_MONTH, 1);//一号
			
			cal2.set(Calendar.DAY_OF_MONTH, 1);//本月一号
		}
		pageList = timeReportService.findTimeReportList(cal1,cal2, pageNow, pageSize);
		return "timeReportList";
	}
	/**
	 * 导出定时报告excel
	 * 
	 * 
	 * @author hao.wang 2016年3月21日14:16:27
	 */
	public void exportExcel(){
		try {
			 Calendar cal = Calendar.getInstance();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("application/x-execl");
			response.setHeader("Content-Disposition", "attachment;filename=" + new String((year + "年" + month + "月定时报告.xls").getBytes(), "ISO-8859-1"));
			ServletOutputStream outputStream = response.getOutputStream();
			timeReportService.exportExcel(timeReportService.findByYearAndMonth(year,month), outputStream);
			if(outputStream != null){
				outputStream.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 通过年获取月份
	 * @return 
	 */
	public String getMonthByYear(){
		monthList = timeReportService.getMonthByYear(year);
		return SUCCESS;
	}
	
	
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public List<Integer> getMonthList() {
		return monthList;
	}
	public void setMonthList(List<Integer> monthList) {
		this.monthList = monthList;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	
}
