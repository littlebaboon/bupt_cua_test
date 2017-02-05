package cn.cua.domain;

public class UserInfo {
	private int userId;
	private String userName;
	private String userPasswd;
	private String userMail;
	private int isActive;
	private String verifyCode;
	
	public UserInfo(){
		super();
	}
	
	public UserInfo(int userId, String userName, String userPasswd, String userMail, int isActive, String verifyCode){
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPasswd = userPasswd;
		this.userMail = userMail;
		this.isActive = isActive;
		this.verifyCode = verifyCode;
	}
	
	public int getUserId(){
		return this.userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPasswd() {
		return userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", userName=" + userName
				+ ", userPasswd=" + userPasswd + ", userMail=" + userMail
				+ ", isActive=" + isActive + ", verifyCode=" + verifyCode + "]";
	}
	
}
