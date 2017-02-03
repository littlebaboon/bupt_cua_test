package cn.cua.action;

import java.util.Map;

import cn.cua.domain.BuserInfo;
import cn.cua.service.BuserService;

import com.opensymphony.xwork2.ActionContext;

public class ChatLoginAction {
	String usrName;
	String businessId;
	BuserService buserService = new BuserService();
	public String customerLogin(){
		Map session = ActionContext.getContext().getSession();
		session.put("businessId", businessId);
		session.put("usrType", "1");
		return "success";
	}
	public String cusserviceLogin(){
		Map session = ActionContext.getContext().getSession();
		Integer buserId = (Integer)session.get("buserId");
		BuserInfo buser = buserService.findBuserById(buserId);
		session.put("usrType", "2");
		session.put("businessId", "" + buser.getBusinessId());
		session.put("usrName", buser.getBuserName());
		return "success";
	}
	public String getUsrName() {
		return usrName;
	}
	public void setUsrName(String usrName) {
		this.usrName = usrName;
	}
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	public BuserService getBuserService() {
		return buserService;
	}
	public void setBuserService(BuserService buserService) {
		this.buserService = buserService;
	}
	
	
}
