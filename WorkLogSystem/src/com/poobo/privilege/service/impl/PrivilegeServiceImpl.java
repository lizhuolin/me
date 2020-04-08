package com.poobo.privilege.service.impl;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.Demo;
import com.poobo.core.entity.TblPrivilege;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.PageController;
import com.poobo.privilege.dao.IPrivilegeDao;
import com.poobo.privilege.service.IPrivilegeService;

@Service("privilegeService")
public class PrivilegeServiceImpl extends BaseServiceImpl<TblPrivilege> implements IPrivilegeService{
	
	private IPrivilegeDao privilegeDao;
	@Resource 
	public void setPrivilegeDao(IPrivilegeDao privilegeDao) {
		super.setBaseDao(privilegeDao);
		this.privilegeDao =privilegeDao;
	}
	
	
}
