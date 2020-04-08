package com.poobo.core.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblUser;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.util.PageController;
import com.poobo.core.util.QueryHelper;

public  abstract class BaseDaoImpl<T> extends HibernateDaoSupport implements IBaseDao<T>{

	private Class<T> clazz;
	//通过反射的得到T的类型
	public BaseDaoImpl(){
		 ParameterizedType pt = (ParameterizedType) getClass().getGenericSuperclass();
		 clazz = (Class<T>) pt.getActualTypeArguments()[0];
	}
	//保存
	@Override
	public void save(T entity) {
		getHibernateTemplate().save(entity);
	}
	//删除
	@Override
	public void delete(Serializable id) {
		getHibernateTemplate().delete(findObjectById(id));
	}
	//更新
	@Override
	public void update(T entity) {
		getHibernateTemplate().update(entity);
	}
	@Override
	public void saveOrUpdate(T entity) {
		getHibernateTemplate().saveOrUpdate(entity);;
	}
	//通过id查找
	@Override
	public T findObjectById(Serializable id) {
		return getHibernateTemplate().get(clazz, id);
	}
	//查找所有
	@Override
	public List findAll() {
		Query query = getSession().createQuery("FROM " + clazz.getSimpleName() + " WHERE dataStatus = ?");
		query.setParameter(0,EnumDataStatus.NORMAL.getValue());
		return query.list();
	}
	
	 public Criteria createCriteria(Class<?> clazz) {
	        return getSession().createCriteria(clazz);
	    }
	 
	 public List<T> findObjects(QueryHelper queryHelper) {
			Query query = getSession().createQuery(queryHelper.getQueryListHql());
			List<Object> parameters = queryHelper.getParameters();
			if(parameters != null){
				for(int i = 0; i < parameters.size(); i++){
					query.setParameter(i, parameters.get(i));
				}
			}
			return query.list();
		}

	
	/**
     * criteria分页查询
     * @param criteria
     * @param pageInt
     * @param pageSize
     * @param <T>
     * @return
     */
    public <T> PageController<T> findPageByCriteria(Criteria criteria, int pageInt, int pageSize) {
        int rowCount = totalCount(criteria);
        criteria.setProjection(null);
        criteria.setFirstResult((pageInt - 1) * pageSize);
        criteria.setMaxResults(pageSize);
        PageController<T> pager = new PageController(rowCount, pageSize, pageInt);
        pager.setDataList(criteria.list());
        return pager;
    }
    
    /**
    *
    * @param hql
    * @param paramMap
    * @param pageInt
    * @param pageSize
    * @param <T>
    * @return
    */
   public <T> PageController<T>  findPageByHql(String hql, Map<String, Object> paramMap, int pageInt, int pageSize) {
       return findPageByHql(hql, paramMap, pageInt, pageSize, false);
   }

   /**
    *
    * @param hql
    * @param paramMap
    * @param pageInt
    * @param pageSize
    * @param cache 是否开启缓存
    * @param <T>
    * @return
    */
   public <T> PageController<T>  findPageByHql(String hql, Map<String, Object> paramMap, int pageInt, int pageSize, Boolean cache) {
       Session session = getSession();
       Query query = session.createQuery(hql);
       prepareQueryParameters(paramMap, query);
       query.setCacheable(cache);
       query.setFirstResult((pageInt - 1) * pageSize);
       query.setMaxResults(pageSize);
       Integer rowCount = 0;
       rowCount = Integer.parseInt(getTotalCount(hql, paramMap).toString());
       PageController<T> pager = new PageController(rowCount, pageSize, pageInt);
       pager.setDataList(query.list());
       return pager;
   }
   
   public int totalCount(Criteria criteria) {
       try {
           return ((Number) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
       } catch (Exception e) {
          // log.error(e.getMessage(), e);
       }
       return 0;
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
   
   /**
    * hql统计行数
    * @param hql
    * @param map
    * @return
    */
   public Long getTotalCount(String hql, Map<String, Object> map) {
       Session session = getSession();
       String countHql = getCountHql(hql);
       Query query = session.createQuery(countHql);
       prepareQueryParameters(map, query);
       Long l = (Long) query.list().get(0);
       return l;
   }
   
   /**
    * 组装统计行数的hql
    * @param hql
    * @return
    */
   private String getCountHql(String hql) {
       if (hql != null) {
           String tmpStr=hql.toLowerCase();
           int index = tmpStr.indexOf("from");
           if (index != -1) {
               return "select count(*) " + hql.substring(index);
           }
       }
       return null;
   }
	
   
   public T merge(T entity){
	   return  getHibernateTemplate().merge(entity);
   }
   
   
   public PageController getListByDetachedCriteria(DetachedCriteria dc, int pageInt, int pageSize){
	   Criteria c = dc.getExecutableCriteria(getSession());  
	   int rowCount = totalCount(c);
	   c.setProjection(null);
	   c.setFirstResult((pageInt - 1) * pageSize);
       c.setMaxResults(pageSize);
	   PageController<T> pager = new PageController(rowCount, pageSize, pageInt);
       pager.setDataList(c.list());
	  return pager;
	   
   }
   
}
