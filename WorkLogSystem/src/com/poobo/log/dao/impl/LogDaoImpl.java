package com.poobo.log.dao.impl;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblLog;
import com.poobo.core.entity.TblLogFile;
import com.poobo.core.entity.TblPlan;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.util.GetSessionData;
import com.poobo.log.dao.ILogDao;

public class LogDaoImpl extends BaseDaoImpl<TblLog>implements ILogDao{

	@Override
	public TblLog findTblLogByUserDate(String userId, Date newDate) {
		Query query = getSession().createQuery(" FROM TblLog WHERE tblUser.userId =? and dataStatus =? and logTime =?");
		query.setParameter(0, userId);
		query.setParameter(1, EnumDataStatus.NORMAL.getValue());
		query.setParameter(2,newDate);
		List<TblLog> list=query.list();
		if(list!=null &&list.size()>0)
		return list.get(0);
		else return null;
	}

	@Override
	public List<TblLog> findAllByHQL(Date dStart,Date dEnd) {
			Query query =getSession().createQuery("FROM TblLog WHERE tblUser.userId =? and dataStatus =? and logTime between  ? and ?");
			query.setParameter(0, GetSessionData.getUser().getUserId());
			query.setParameter(1, EnumDataStatus.NORMAL.getValue());
			query.setParameter(2, dStart);
			query.setParameter(3, dEnd);
	       List<TblLog> list=query.list();
		return query.list();
	}
	
	 /**
	    * hql中传入参数
	    * @param map
	    * @param query
	    */
	   private void prepareQueryParameters(Map<String, Object> map, Query query) {
	       Iterator<String> it = map.keySet().iterator();
	       while (it.hasNext()) {
	           String key = it.next();
	           if(map.get(key) instanceof List) {
	               query.setParameterList(key, (List<?>)map.get(key));
	           } else if(map.get(key) instanceof Object[]) {
	               query.setParameterList(key, (Object[])map.get(key));
	           } else {
	               query.setParameter(key, map.get(key));
	           }
	       }
	   }

	@Override
	public List<TblLogFile> findAllFileByLogId(String logId) {
		Query query = getSession().createQuery(" FROM TblLogFile WHERE tblLog.logId =? ");
		query.setParameter(0,logId);
		return query.list();
	}
}
