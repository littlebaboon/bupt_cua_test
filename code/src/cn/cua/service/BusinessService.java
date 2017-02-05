package cn.cua.service;


import java.util.List;

import cn.cua.dao.BusinessInfoDAO;
import cn.cua.domain.BusinessInfo;
import cn.cua.domain.UserInfo;

public class BusinessService {
	private BusinessInfoDAO businessDao = new BusinessInfoDAO();
	
	public BusinessInfo findBusinessById(Integer businessId){
		return businessDao.findById(businessId);
	}
	
	public BusinessInfo login(String loginName,String businessPassword) throws BusinessException{
		/**
		 * 1.通过用户名查找用户
		 */
		List<BusinessInfo> businessList = businessDao.findByBusinessName(loginName);
		
		/**
		 * 2.判断business是否存在，如果不存在，抛出异常
		 */
		if(businessList.size() == 0){
			throw new BusinessException("用户名不存在");
		}
/*		if(business == null){
			throw new BusinessException("用户名不存在");
		}*/
		
		/**
		 * 3.如果business存在，再使用参数businessPassword，与查询到的business的我businessPassword比较
		 * 4.如果相同，说明登陆成功，返回business对象
		 * 5.如果不同，说明密码错误，抛出异常
		 */
		BusinessInfo business = businessList.get(0);
		if(businessPassword.equals(business.getBusinessPasswd())){
			return business;
		}else{
			throw new BusinessException("密码错误");
		}
	}
}
