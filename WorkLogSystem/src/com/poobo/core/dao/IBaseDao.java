package com.poobo.core.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;

import com.poobo.core.util.PageController;
import com.poobo.core.util.QueryHelper;

public interface IBaseDao<T> {
	//保存
	public void save(T entity);
	//删除
	public void delete(Serializable id);
	//更新
	public void update(T entity);
	//通过id查找
	public T findObjectById(Serializable id);
	//查找所有
	public List findAll();
	
	
	 public Criteria createCriteria(Class<?> clazz);
	 public PageController getListByDetachedCriteria(DetachedCriteria d, int pageInt, int pageSize);
	 //分页查询
	 public <T> PageController<T> findPageByCriteria(Criteria criteria, int pageInt, int pageSize);
	 
	 public T merge(T entity);
	 
		
	    /**
	    *
	    * @param hql
	    * @param paramMap
	    * @param pageInt
	    * @param pageSize
	    * @param <T>
	    * @return
	    */
	   public <T> PageController<T>  findPageByHql(String hql, Map<String, Object> paramMap, int pageInt, int pageSize);


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
	   public <T> PageController<T>  findPageByHql(String hql, Map<String, Object> paramMap, int pageInt, int pageSize, Boolean cache);
	   
	   public int totalCount(Criteria criteria);
	   
	   public List<T> findObjects(QueryHelper queryHelper);
	
	   public void saveOrUpdate(T entity);
		
}
