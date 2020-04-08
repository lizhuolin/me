package com.poobo.role.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.poobo.core.dao.IBaseDao;
import com.poobo.core.entity.TblPrivilege;
import com.poobo.core.entity.TblRole;

public interface IRoleDao extends IBaseDao<TblRole>{

 public List<?> findByNamedParam(String hql , Map<String,?> namedParam) ;

public List<TblPrivilege> findAllPrivilege();

public com.poobo.core.entity.TblPrivilege findPrivilegeById(String id);

public void removeRolePrivileges(String roleId);

public List<TblRole> findRolesByCompanyId(String companyId);

public List<TblRole> findRoles();

	
}
