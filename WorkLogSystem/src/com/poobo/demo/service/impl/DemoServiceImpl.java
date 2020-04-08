package com.poobo.demo.service.impl;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.Demo;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.PageController;
import com.poobo.demo.dao.IDemoDao;
import com.poobo.demo.service.IDemoService;

@Service("demoService")
public class DemoServiceImpl extends BaseServiceImpl<Demo> implements IDemoService{
	
	private IDemoDao demoDao;
	@Resource 
	public void setDemoDao(IDemoDao demoDao) {
		super.setBaseDao(demoDao);
		this.demoDao =demoDao;
	}
	@Override
	public PageController<Demo> getPageList(Demo demo, int pageNow, int pageSize) {
		Criteria criteria=demoDao.createCriteria(Demo.class);
		//criteria.add(Restrictions.eq());
		return demoDao.findPageByCriteria(criteria, pageNow, pageSize);
	}
	
	
}
