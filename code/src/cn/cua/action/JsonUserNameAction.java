package cn.cua.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.cua.domain.BuserInfo;
import cn.cua.domain.BusinessInfo;
import cn.cua.domain.UserInfo;
import cn.cua.service.BuserService;
import cn.cua.service.BusinessService;
import cn.cua.service.UserService;

public class JsonUserNameAction {
	private UserService userService = new UserService();
	private BuserService buserService = new BuserService();
	private String userName;
	private Integer userType;
	
	public String execute(){
		Map session = ActionContext.getContext().getSession();
		Integer userID = (Integer) session.get("userId");
		Integer buserId = (Integer) session.get("buserId");
		if(userID != null){
			UserInfo user = userService.findUserById(userID);
			userName = user.getUserName();
			userType = 1;
		}
		else if(buserId != null){
			BuserInfo buser = buserService.findBuserById(buserId);
			userName = buser.getBuserName();
			userType = buser.getBuserType();
		}
		else{
			userName="";
		}

		return "success";
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	
	
}
