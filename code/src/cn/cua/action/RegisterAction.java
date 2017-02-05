package cn.cua.action;

import cn.cua.domain.BuserInfo;
import cn.cua.domain.BusinessInfo;
import cn.cua.domain.UserInfo;
import cn.cua.service.RegisterService;

public class RegisterAction {
	RegisterService registerService = new RegisterService();
	public Integer userId;
	public String username;
	public String password;
	public String userMail;
	public Integer isActive = 0;//0为未激活 1为已激活 暂时未用
	public String verifyCode;
	public Integer userType;
	public String result;
	public String businessName;
	
	
	public String execute(){
		
		if(userType == 1){
			UserInfo userInfo = new UserInfo();
			userInfo.setUserName(username);
			userInfo.setUserPasswd(password);
			userInfo.setUserMail(userMail);
			if(registerService.hasUserName(username)){
				result = "name_exists";
				return "success";
				}
			//userInfo.setUserMail(userMail);
			//userInfo.setUserId(userId);  //不需要给ID赋值
			registerService.register(userInfo);
			result = "user_success";
			return "success";
		}
		
		else if(userType == 2){
			BuserInfo buserInfo = new BuserInfo(); 
			buserInfo.setBuserName(username);
			buserInfo.setBuserPasswd(password);
			buserInfo.setBuserType(2);
			buserInfo.setBuserMail(userMail);
			BusinessInfo businessInfo = new BusinessInfo();
			businessInfo.setBusinessName(businessName); 
			if(registerService.hasBuserName(username)){
				result = "username_exists";
				return "success";
			}else if(registerService.hasBusinessName(businessName)){
				result = "Businessname_exists";
				return "success";
			}
			Integer businessId = registerService.register(businessInfo);
			buserInfo.setBusinessId(businessId);
			registerService.register(buserInfo);
			result = "business_success";
			return "success";
		}
		else{
			result = "success";
			return "success";
		}
		
		
	}

	
	
	
	public RegisterService getRegisterService() {
		return registerService;
	}

	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}




	public String getResult() {
		return result;
	}




	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	

	
	
	
	
}
