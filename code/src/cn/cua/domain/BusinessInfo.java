package cn.cua.domain;
/**
 * 商家信息表
 * @author GILC
 *
 */
public class BusinessInfo {

	private int businessId;//商家编号
	private String businessName;//商家名称
	private String businessPasswd;//商家密码
	private String businessMail;//管商家邮箱
	private String isActive;//商家是否激活
	private String verifyCode;//验证码
	
	
	
	public BusinessInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BusinessInfo(int businessId,String businessName, String businessPasswd, String businessMail, String isActive, String verifyCode ) {
		super();
		this.businessId=businessId;
		this.businessName=businessName;
		this.businessPasswd=businessPasswd;
		this.isActive=isActive;
		this.verifyCode=verifyCode;
	}
	public int getBusinessId() {
		return businessId;
	}
	public void setBusinessId(int businessId) {
		this.businessId = businessId;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBusinessPasswd() {
		return businessPasswd;
	}
	public void setBusinessPasswd(String businessPasswd) {
		this.businessPasswd = businessPasswd;
	}
	public String getBusinessMail() {
		return businessMail;
	}
	public void setBusinessMail(String businessMail) {
		this.businessMail = businessMail;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	
	@Override
	public String toString() {
		return "AdminInfo [businessId=" + businessId + ", businessName=" + businessName
				+ ", businessPasswd=" + businessPasswd + ", businessMail=" + businessMail
				+ ", isActive=" + isActive + ", verifyCode="
				+ verifyCode + "]";
	}
	
	
	

	
}
