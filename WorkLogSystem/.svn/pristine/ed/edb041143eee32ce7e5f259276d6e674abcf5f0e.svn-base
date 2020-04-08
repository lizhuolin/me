package com.poobo.notice.dao;

import java.util.List;

import org.hibernate.Criteria;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblDept;
import com.poobo.core.entity.TblNotice;
import com.poobo.core.util.PageController;


public interface INoticeDao extends IBaseDao<TblNotice>{

	List<TblNotice> findAllByUserId(String userId);

	List<TblNotice> findNotices(String companyId);

	List<TblNotice> findNote();


	/*PageController<TblNotice> findNoticeListByUserId(Criteria criteria,
			int pageNow, int pageSize);*/

	//PageController<TblNotice> findAllByUserId(String userId);
}
