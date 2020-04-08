package com.poobo.test;



import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.poobo.test.entity.Person;
import com.poobo.test.service.TestService;


public class TestMerge {
	private ClassPathXmlApplicationContext content;
	@Before
	public void loadCtx(){
		content = new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	
	//测试spring的功能是否正常
	@Test
	public void testSpring(){
		TestService testService = (TestService) content.getBean("testService");
		testService.say();
	}
	//测试hibernate的功能是否正常
	@Test
	public void testHibernate(){
		/*SessionFactory sf =  (SessionFactory) content.getBean("sessionFactory");
		Session session = sf.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(new Person("人员1"));
		transaction.commit();
		session.close();*/
		
	}
	//测试service层和dao层功能是否正常
	@Test
	public void testServiceAndDao(){
		TestService testService = (TestService) content.getBean("testService");
		testService.save(new Person("人员2"));
	}
	//测试事物的可读性是否正常
	@Test
	public void testTansactionReadOnly() throws Exception{
		TestService testService = (TestService) content.getBean("testService");
		Person person = testService.findPerson("402881f1533b0fc301533b0fc5620000");
		System.out.println(person.getName());
	}
	//测试事物的回滚是否正常
	@Test
	public void testTansactionRollback() throws  Exception{
		TestService testService = (TestService) content.getBean("testService");
		testService.save(new Person("人员3"));
	}
}
