package com.poobo.core.service;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import com.poobo.core.entity.TblDept;
import com.poobo.core.util.PageController;
import com.poobo.core.util.QueryHelper;

public interface IBaseService<T> {
	
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
	
	 public List<T> findObjects(QueryHelper queryHelper);
	//更新或保存
	public T merge(T entity);
	
	/**
	 * 得到分页对象
	 * @param t
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageController<T> getPageList(T t, int pageNow, int pageSize);
	
	public void saveOrUpdate(T entity);
   
}
