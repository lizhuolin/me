package com.poobo.test.service;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.poobo.test.dao.TestDao;
import com.poobo.test.entity.Person;

@Service("testService")
public class TestService {
	
	public void say() {
		System.out.println("hello");
	}
	
	@Resource
	private TestDao testDao;
	
	public void save(Person person){
		testDao.save(person);
		//int tem = 1/0;
	}

	public Person findPerson(Serializable id) {
		//save(new Person("test"));
		return testDao.findPerson(id);
	}
}
