package com.poobo.test.dao;

import java.io.Serializable;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.poobo.test.entity.Person;

public class TestDao extends HibernateDaoSupport {
	public void save(Person person){
		getHibernateTemplate().save(person);
	}
	
	public Person findPerson(Serializable id){
		return getHibernateTemplate().get(Person.class,id);
	}

}
