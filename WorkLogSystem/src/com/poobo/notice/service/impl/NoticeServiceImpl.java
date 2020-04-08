package com.poobo.notice.service.impl;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.TblNotice;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataPrivilege;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.DateTimeUtil;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;
import com.poobo.notice.dao.INoticeDao;
import com.poobo.notice.service.INoticeService;


@Service("noticeService")
public class NoticeServiceImpl extends BaseServiceImpl<TblNotice> implements INoticeService{
	
	private INoticeDao noticeDao;
	@Resource 
	public void setNoticeDao(INoticeDao noticeDao) {
		super.setBaseDao(noticeDao);
		this.noticeDao = noticeDao;
	}



	@Override
	public void delNoticeByIds(String[] idList) {
		// TODO Auto-generated method stub
		for(String id:idList){
			TblNotice notice=noticeDao.findObjectById(id);
			notice.setDataStatus(EnumDataStatus.DEL.getValue());
			//初始化任务未开始
			noticeDao.merge(notice);
		}
	}



	@Override
	public PageController<TblNotice> findNoticeList(TblNotice notice,
			int pageNow, int pageSize) {
		Criteria criteria = noticeDao.createCriteria(TblNotice.class);
		if(!GetSessionData.getUser().getIsUserPlatform()){
			criteria.add(Restrictions.eq("tblCompany.companyId", GetSessionData.getUser().getTblCompany().getCompanyId()));
		}
		if(GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
			criteria.add(Restrictions.eq("tblUser.userId",GetSessionData.getUser().getUserId()));
		}

		criteria.add(Restrictions.eq("dataStatus", EnumDataStatus.NORMAL.getValue()));
		criteria.addOrder(Order.desc("noticeCreatetime"));
		if(null != notice && !StringUtils.isEmpty(notice.getNoticeTitle())){
		/*criteria.add(Restrictions.ilike("noticeTitle", "%" + notice.getNoticeTitle() +"%"));*/
  	    if(!notice.getNoticeTitle().equals("%") ){//解决输入%查询出所有
		      criteria.add(Restrictions.ilike("noticeTitle", "%" + notice.getNoticeTitle() +"%"));
			}else{
				criteria.add(Restrictions.ilike("noticeTitle", "%"  + "\\%"  +"%"));
			}
		  
		}
		TblUser user =GetSessionData.getUser();
		return noticeDao.findPageByCriteria(criteria, pageNow, pageSize);
	}



	@Override
	public List<TblNotice> findNotices(String companyId) {
		return noticeDao.findNotices(companyId);
	}



	@Override
	public List<TblNotice> findNote() {
		return noticeDao.findNote();
	}




	






	
}

	