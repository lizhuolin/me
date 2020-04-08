package com.poobo.tease.service;

import com.poobo.core.entity.TblTease;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface ITeaseService extends IBaseService<TblTease>{

	PageController<TblTease> findTeaseList(TblTease tease, int pageNow,
			int pageSize);

	void delTeaseByIds(String[] idList);
	
}
