package cn.cua.domain;
/**
 * 商家信息表
 * @author GILC
 *
 */
public class BuserInfo {

	private int businessId;//商家编号
	private String buserName;//商家名称
	private String buserPasswd;//商家密码
	private String buserMail;//管商家邮箱
	private String isActive;//商家是否激活
	private String verifyCode;//验证码
	private int buserId;
	private int buserType;
	
	public BuserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuserInfo(int businessId,String businessName, String businessPasswd, String businessMail, String isActive, String verifyCode,int buserId,int buserType ) {
		super();
		this.businessId=businessId;
		this.buserName=businessName;
		this.buserPasswd=businessPasswd;
		this.isActive=isActive;
		this.verifyCode=verifyCode;
		this.buserType=buserId;
		this.buserId=buserType;
	}


	@Override
	public String toString() {
		return "BuserInfo [businessId=" + businessId + ", buserName="
				+ buserName + ", buserPasswd=" + buserPasswd + ", buserMail="
				+ buserMail + ", isActive=" + isActive + ", verifyCode="
				+ verifyCode + ", buserId=" + buserId + ", buserType="
				+ buserType + "]";
	}
	
	public int getBusinessId() {
		return businessId;
	}
	public void setBusinessId(int businessId) {
		this.businessId = businessId;
	}
	public String getBuserName() {
		return buserName;
	}
	public void setBuserName(String buserName) {
		this.buserName = buserName;
	}
	public String getBuserPasswd() {
		return buserPasswd;
	}
	public void setBuserPasswd(String buserPasswd) {
		this.buserPasswd = buserPasswd;
	}
	public String getBuserMail() {
		return buserMail;
	}
	public void setBuserMail(String buserMail) {
		this.buserMail = buserMail;
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
	public int getBuserId() {
		return buserId;
	}
	public void setBuserId(int buserId) {
		this.buserId = buserId;
	}
	public int getBuserType() {
		return buserType;
	}
	public void setBuserType(int buserType) {
		this.buserType = buserType;
	}
	
	
	

	
}
