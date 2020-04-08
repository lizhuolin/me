package com.poobo.demo.service;

import com.poobo.core.entity.Demo;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface IDemoService extends IBaseService<Demo>{

	PageController<Demo> getPageList(Demo demo, int pageNow, int pageSize);
	
}
