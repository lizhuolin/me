package com.poobo.role.dao.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.poobo.core.dao.impl.BaseDaoImpl;
import com.poobo.core.entity.TblPrivilege;
import com.poobo.core.entity.TblRole;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.enums.EnumRolEffect;
import com.poobo.core.enums.EnumRole;
import com.poobo.core.util.GetSessionData;
import com.poobo.role.dao.IRoleDao;

public class RoleDaoImpl extends BaseDaoImpl<TblRole> implements IRoleDao{

	@Autowired
	SessionFactory sessionFactory;
	
	/**
	 * @param hql: dto class hql(not native sql)
	 * @param namedParam: dto names and values
	 * @return
	 */
	public List<?> findByNamedParam(String hql , Map<String,?> namedParam) {
		Session session = sessionFactory.getCurrentSession();
//		try {
			Query query = session.createQuery(hql);
			prepareQueryParameters(namedParam, query);
			
			return query.list();
//		} finally {
//			if(session!=null) {
//				session.close();
//			}
//		}
	}
	private void prepareQueryParameters(Map<String, ?> map, Query query) {
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
	
	public List<TblPrivilege> findAllPrivilege(){
		Query query = getSession().createQuery("FROM TblPrivilege");
		return query.list();
	}
	@Override
	public TblPrivilege findPrivilegeById(String id) {
		return getHibernateTemplate().get(TblPrivilege.class, id);
	}
	
	@Override
	public void removeRolePrivileges(String roleId) {
		Query query = getSession().createQuery("DELETE TblRolePrivilege rp WHERE rp.id.tblRole.roleId = ?");
		query.setParameter(0, roleId);
		query.executeUpdate();
	}
	@Override
	public List<TblRole> findRolesByCompanyId(String companyId) {
		String hql = "FROM TblRole  WHERE   dataStatus =? AND isEffect=? AND tblCompany.companyId = ? ";
		Query query = getSession().createQuery(hql);
		query.setParameter(0,EnumDataStatus.NORMAL.getValue());
		query.setParameter(1,EnumRolEffect.ISEFFECT.getValue());
			query.setParameter(2, companyId);
		return query.list();
	}
	@Override
	public List<TblRole> findRoles() {
		String hql = "FROM TblRole  WHERE   dataStatus =? AND isEffect=? ";
		Query query = getSession().createQuery(hql);
		query.setParameter(0,EnumDataStatus.NORMAL.getValue());
		query.setParameter(1,EnumRolEffect.ISEFFECT.getValue());
		return query.list();
	}
}
