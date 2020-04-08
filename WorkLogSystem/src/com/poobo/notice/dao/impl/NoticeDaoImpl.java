package com.poobo.notice.dao.impl;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblDept;
import com.poobo.core.entity.TblNotice;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.util.DateTimeUtil;
import com.poobo.core.util.DateUtils;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;
import com.poobo.dept.dao.IDeptDao;
import com.poobo.notice.dao.INoticeDao;

public class NoticeDaoImpl extends BaseDaoImpl<TblNotice> implements INoticeDao{

	@Override
	public List findAllByUserId(String userId) {
		// TODO Auto-generated method stub
		Query query = getSession().createQuery("FROM TblNotice WHERE tblUser.userId = ?");
		query.setParameter(0, userId);
		return query.list();
	}

	@Override
	public List<TblNotice> findNotices(String companyId) {
		Query query = getSession().createQuery("FROM TblNotice WHERE tblCompany.companyId=? AND noticeStartTime <= ? AND noticeEndTime >= ? AND dataStatus =? order by noticeCreatetime desc");
		   	query.setParameter(0, companyId);
			query.setParameter(1,new Date());
			query.setParameter(2,new Date());
			query.setParameter(3,EnumDataStatus.NORMAL.getValue());
			List<TblNotice> notices = query.list();
		return notices;
	}

	@Override
	public List<TblNotice> findNote() {
		Query query = getSession().createQuery("FROM TblNotice WHERE noticeStartTime <= ? AND noticeEndTime >= ? AND dataStatus =? order by noticeCreatetime desc");
		query.setParameter(0,new Date());
		query.setParameter(1,new Date());
		query.setParameter(2,EnumDataStatus.NORMAL.getValue());
		List<TblNotice> notices = query.list();
	return notices;
	}

	

	

	/*@Override
	public PageController<TblNotice> findNoticeListByUserId(Criteria criteria,
			int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}*/
	
}
