package com.poobo.company.service;

import java.io.Serializable;

import com.poobo.core.entity.TblCompany;
import com.poobo.core.entity.TblRole;
import com.poobo.core.entity.TblUser;
import com.poobo.core.service.IBaseService;
import com.poobo.core.util.PageController;

public interface CompanyService extends IBaseService<TblCompany> {
	/**
	 * 分页查询任务列表
	 * @param company
	 * @param pageNow
	 * @param pageSize
	 */
	PageController<TblCompany> getPageList(TblCompany tblcompany, int pageNow, int pageSize);

	void newCompany(TblCompany tblcompany);

	void delcompanyByIds(String[] idList);

	void auditCompanyByIds(String id);
	
	/**
	 * 根据ID查询  公司信息
	 * @param companyId
	 * @return
	 */
	public TblCompany getCompanyById(Serializable companyId);
	
	public boolean checkCompanyname(TblCompany tblcompany);
	
	public boolean checkRegisteCompanyname(TblCompany tblcompany);
	/**
	 * 根据角色条件查询角色列表
	 * @param role
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageController<TblCompany> findCompanyList(TblCompany tblcompany, int pageNow,
			int pageSize);

	public boolean checkCompanymobile(TblCompany tblcompany);

	void freezeCompanyByIds(String[] idList);

	void notfreezeCompanyByIds(String[] idList);


}
