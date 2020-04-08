package com.poobo.tease.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.poobo.core.entity.TblTease;
import com.poobo.core.enums.EnumDataPrivilege;
import com.poobo.core.enums.EnumDataStatus;
import com.poobo.core.service.impl.BaseServiceImpl;
import com.poobo.core.util.GetSessionData;
import com.poobo.core.util.PageController;
import com.poobo.tease.dao.ITeaseDao;
import com.poobo.tease.service.ITeaseService;

@Service("teaseService")
public class TeaseServiceImpl extends BaseServiceImpl<TblTease> implements ITeaseService{
	
	
	private ITeaseDao teaseDao;
	@Resource 
	public void setTeaseDao(ITeaseDao teaseDao) {
		super.setBaseDao(teaseDao);
		this.teaseDao =teaseDao;
	}
	/**
	 * 根据角色条件查询吐槽列表
	 * @param tease
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageController<TblTease> findTeaseList(TblTease tease, int pageNow,int pageSize) {
	
			Criteria criteria = teaseDao.createCriteria(TblTease.class);
			criteria.add(Restrictions.eq("dataStatus", EnumDataStatus.NORMAL.getValue()));
			if(!GetSessionData.getUser().getIsUserPlatform()){
				criteria.add(Restrictions.eq("tblUser.userId", GetSessionData.getUser().getUserId()));
			}
			//设置用户的数据权限
			if( GetSessionData.getDataPrivilege().equals(EnumDataPrivilege.SEESELF.getValue())){
				criteria.add(Restrictions.eq("tblUser.userId", GetSessionData.getUser().getUserId()));
			}
			criteria.addOrder(Order.desc("createTime"));
			if(null != tease){
				/*if(!StringUtils.isEmpty(tease.getteaseName())){//解决输入%查询出所有
					 if(!tease.getteaseName().equals("%")){
			      criteria.add(Restrictions.ilike("teaseName", "%"  + tease.getteaseName() +"%"));
					 }else{
					criteria.add(Restrictions.ilike("teaseName", "\\%"));
					 }
				}*/
			}
			return teaseDao.findPageByCriteria(criteria, pageNow, pageSize);
	}
	
	
	public void delTeaseByIds(String[] idList) {
		for(String id:idList){
			TblTease tease=teaseDao.findObjectById(id);
			tease.setDataStatus(EnumDataStatus.DEL.getValue());
			//初始化任务未开始
			teaseDao.merge(tease);
		}
		
	}


}
