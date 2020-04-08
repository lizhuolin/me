package com.poobo.user.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.user.dao.IUserDao;

public class UserDaoImpl extends BaseDaoImpl<TblUser>implements IUserDao{
	
//	通过用户名和密码查询用户列表
	@Override
	public List<TblUser> findUserByUsernameAndPassword(String username,
			String password) {
		Query query = getSession().createQuery("FROM TblUser WHERE username = ? AND password = ? AND dataStatus = ? ");
		query.setParameter(0, username);
		query.setParameter(1, password);
		query.setParameter(2, EnumDataStatus.NORMAL.getValue());
		return query.list();
	}

	@Override
	public List<TblUser> findAllByCompanyId(String CompanyId) {
		Query query = getSession().createQuery("FROM TblUser WHERE tblCompany.companyId = ? AND dataStatus= ?");
		query.setParameter(0, CompanyId);
		query.setParameter(1, EnumDataStatus.NORMAL.getValue());
		List<TblUser> list = query.list();
		return list;
	}

	@Override
	public void removeUserRoles(String userId) {
			Query query = getSession().createQuery("DELETE TblUserRole ur WHERE ur.id.tblUser.userId = ?");
			query.setParameter(0, userId);
			query.executeUpdate();

	}

	@Override
	public TblUser findUserByToken(String token) {
		Query query = getSession().createQuery("FROM TblUser WHERE token = ?");
		query.setParameter(0, token);
		if(query.list() != null && query.list().size() >0){
			return (TblUser) query.list().get(0);
		}
		return null;
	}

	@Override
	public TblUser findUserByOpenId(String openId) {
		Query query = getSession().createQuery("FROM TblUser WHERE openId = ?");
		query.setParameter(0, openId);
		if(query.list() != null && query.list().size() >0){
			return  (TblUser) query.list().get(0);
		}
		return null;
	}



}
