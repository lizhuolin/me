package com.poobo.user.service;

import java.io.Serializable;
import java.util.List;

import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblRole;
import com.poobo.core.entity.TblUser;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface IUserService extends IBaseService<TblUser>{
	//通过用户名密码查找用户列表
		public List<TblUser> findUserByUsernameAndPassword(String username,String password);
		
		PageController<TblUser> getPageList(TblUser user, int pageNow, int pageSize);

		public PageController<TblUser> getProjectPersonList(String companyId,
				int pageNow, int pageSize);

		public void delUserByIds(String[] idList);
		
		public TblUser getUserById(Serializable userId);
		/**
		 * 根据公司ID查询用户列表
		 * @param companyId
		 * @return
		 */
		public List<TblUser> getUserListByCompanyId(String companyId);

		/**
		 * 根据角色条件查询角色列表
		 * @param role
		 * @param pageNow
		 * @param pageSize
		 * @return
		 */
		public PageController<TblUser> findUserList(TblUser user, int pageNow,
				int pageSize);

		public void removeUserRoles(String userId);

		public boolean checkUsername(TblUser user);


		public void createCompanys(List<TblCompany> companyList,
				TblRole companyAdminRole);

		public boolean checkUsermobile(TblUser user);

		public void setPasswordByIds(String[] idList);

		public TblUser findUserByToken(String token);

		public TblUser findUserByOpenId(String openId);

		

}
