package com.poobo.log.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.TblLogDetail;
import com.poobo.core.entity.TblProjectChild;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.PageController;
import com.poobo.log.dao.ILogDetailsDao;
import com.poobo.log.service.ILogDetailsService;

@Service("logDetailsService")
public class LogDetailsServiceImpl extends BaseServiceImpl<TblLogDetail> implements ILogDetailsService{

	private ILogDetailsDao logDetailsDao;
	@Resource
	public void setLogDetailsDao(ILogDetailsDao logDetailsDao){
		super.setBaseDao(logDetailsDao);
		this.logDetailsDao=logDetailsDao;
	}
	@Override
	public List<TblLogDetail> findAllByLogId(String logId) {
		
		return logDetailsDao.findAllByLogId(logId);
	}
	@Override
	public PageController getPageList(TblLogDetail tblLogDetails, int pageNow,
			int pageSize, String logId) {
		PageController list=new PageController<TblLogDetail>(30, 10, 2);
		list.setPageNow(pageNow);
		Criteria criteria=logDetailsDao.createCriteria(TblLogDetail.class);
		criteria.add(Restrictions.eq("tblLog.logId",logId));
		return logDetailsDao.findPageByCriteria(criteria, pageNow, pageSize);
	}
	
}
