package cn.cua.service;

import cn.cua.dao.BuserDAO;
import cn.cua.dao.BusinessInfoDAO;
import cn.cua.dao.UserInfoDAO;
import cn.cua.domain.BuserInfo;
import cn.cua.domain.BusinessInfo;
import cn.cua.domain.UserInfo;

public class RegisterService {
	UserInfoDAO userInfoDAO = new UserInfoDAO();
	BusinessInfoDAO businessInfoDAO = new BusinessInfoDAO();
	BuserDAO buserInfoDAO = new BuserDAO();
	
	public boolean hasUserName(String username){
		return (!userInfoDAO.findByUserName(username).isEmpty());

	}
	public boolean hasBusinessName(String businessName){
		return (!businessInfoDAO.findByBusinessName(businessName).isEmpty());

	}
	public boolean hasBuserName(String buserName){
		return (!buserInfoDAO.findByBuserName(buserName).isEmpty());
	}
	public boolean hasEmail(String email){
		return (userInfoDAO.userInfoFindByHQL("from userInfo where userMail="+email)!=null);

	}
	
	public boolean register(UserInfo userInfo){
		
		if(hasUserName(userInfo.getUserName()))
				return false;
//		if(hasEmail(userInfo.getUserMail()))
//			return false;
		else{
			userInfoDAO.add(userInfo);
			return true;
		}
	}
	public Integer register(BusinessInfo businessInfo){
		
		if(hasUserName(businessInfo.getBusinessName()))
				return 0;
//		if(hasEmail(userInfo.getUserMail()))
//			return false;
		else{
			Integer businessId = businessInfoDAO.add(businessInfo);
			return businessId;
		}
	}
	
	public boolean register(BuserInfo buserInfo){
		
		if(hasUserName(buserInfo.getBuserName()))
				return false;
//		if(hasEmail(userInfo.getUserMail()))
//			return false;
		else{
			buserInfoDAO.add(buserInfo);
			return true;
		}
	}
	

	
	
	
	public UserInfoDAO getUserInfoDAO() {
		return userInfoDAO;
	}


	public void setUserInfoDAO(UserInfoDAO userInfoDAO) {
		this.userInfoDAO = userInfoDAO;
	}
	
}
