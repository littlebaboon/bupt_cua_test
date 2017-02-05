package cn.cua.action;

import java.io.IOException;
import java.util.Map;

import cn.cua.domain.BuserInfo;
import cn.cua.domain.BusinessInfo;
import cn.cua.domain.UserInfo;
import cn.cua.service.BuserService;
import cn.cua.service.BusinessService;
import cn.cua.service.UserException;
import cn.cua.service.UserService;
import cn.cua.utils.LogMessageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class UserAction extends ActionSupport implements ModelDriven<UserInfo> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	private BusinessService businessService = new BusinessService();
	private BuserService buserService = new BuserService();
	private UserInfo model = new UserInfo();//手动实例化
	
	
	private int pageNum;
	private int totalpage;
	private int pageSize;	
	private int quserId;
	private String quserName;
	private String quserPasswd;
	private String userName="NONE";
	private Integer userType=-1;
	
	public int getQuserId() {
		return quserId;
	}
	public void setuserId(int quserId) {
		this.quserId = quserId;
	}
	
	public String getQuserName() {
		return quserName;
	}
	public void setQuserName(String quserName) {
		this.quserName = quserName;
	}
	
	public String getQuserPasswd() {
		return quserPasswd;
	}
	public void setuserPasswd(String quserPasswd) {
		this.quserPasswd = quserPasswd;
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 登录功能
	 * @return
	 * @throws Exception
	 */
	@InputConfig(resultName="login")
	public String login() throws Exception{

		try{
			if (model.getUserName()!=null){
			UserInfo user = userService.login(model.getUserName(), model.getUserPasswd());
			ActionContext.getContext().getSession().put("userId", user.getUserId());
			ActionContext.getContext().getSession().put("name", user.getUserName());
			//LogMessageUtil.log("普通用户"+model.getUserName()+"登录");
			return "success";
			}
			return "user_login";
		}catch(UserException e){
			this.addActionError(e.getMessage());
			return "user_login";
		}
	}
	public UserInfo getModel() {
		// TODO Auto-generated method stub
		return model;
	}


	public String logout() throws IOException{
		Map session = ActionContext.getContext().getSession();
		Integer userID = (Integer) session.get("userId");
		if(userID != null){
			session.remove("userId");
			UserInfo user = userService.findUserById(userID);
			//LogMessageUtil.log("普通用户"+user.getUserName()+"登出");
			return "homepage";
		}
		Integer buserId = (Integer) session.get("buserId");
		if(buserId != null){
			session.remove("buserId");
			BuserInfo buser = buserService.findBuserById(buserId);
			BusinessInfo business = businessService.findBusinessById(buser.getBusinessId());
			if (buser.getBuserType() == 2){
				//LogMessageUtil.log("商家"+business.getBusinessName()+"店长"+buser.getBuserName()+"登出");
			}else{
				//LogMessageUtil.log("商家"+business.getBusinessName()+"店员"+buser.getBuserName()+"登出");
			}
			return "business_login";
		}
		return "homepage";
	}

	
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setModel(UserInfo model) {
		this.model = model;
	}
	public void setQuserId(int quserId) {
		this.quserId = quserId;
	}
	public void setQuserPasswd(String quserPasswd) {
		this.quserPasswd = quserPasswd;
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
	public BusinessService getBusinessService() {
		return businessService;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	
	
}
