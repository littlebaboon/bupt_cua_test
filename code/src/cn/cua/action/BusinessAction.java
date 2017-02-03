package cn.cua.action;

import cn.cua.domain.BusinessInfo;
import cn.cua.service.BusinessException;
import cn.cua.service.BusinessService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class BusinessAction extends ActionSupport implements ModelDriven<BusinessInfo> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BusinessService businessService = new BusinessService();
	private BusinessInfo model = new BusinessInfo();//手动实例化

	
	private int pageNum;
	private int totalpage;
	private int pageSize;
	
	private int qbusinessId;
	private String qbusinessName;
	private String qbusinessPasswd;

	
	public int getQbusinessId() {
		return qbusinessId;
	}
	public void setbusinessId(int qbusinessId) {
		this.qbusinessId = qbusinessId;
	}
	public String getQbusinessName() {
		return qbusinessName;
	}
	public void setQbusinessName(String qbusinessName) {
		this.qbusinessName = qbusinessName;
	}
	
	public String getQbusinessPasswd() {
		return qbusinessPasswd;
	}
	public void setbusinessPasswd(String qbusinessPasswd) {
		this.qbusinessPasswd = qbusinessPasswd;
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

		/**
		 * model已经封装了表单数据：Name，Password
		 * 1.使用Name和Password来调用service的login（）方法
		 * 2.如果返回admin对象，说明登陆成功，把user保存到session中，返回success
		 * 3.如果抛出了异常，获取异常信息，添加到actionerrors中，返回error
		 */
			//AdminInfo admin = adminService.login(model.getAdminName(), model.getAdminPassword());
			//ActionContext.getContext().getSession().put("admin", admin);
		try{
			BusinessInfo business = businessService.login(model.getBusinessName(), model.getBusinessPasswd());
			ActionContext.getContext().getSession().put("businessId", business.getBusinessId());
			ActionContext.getContext().getSession().put("name", business.getBusinessName());
			return "success";
		}catch(BusinessException e){
			this.addActionError(e.getMessage());
			return "business_login";
		}
	}
	public BusinessInfo getModel() {
		// TODO Auto-generated method stub
		return model;
	}

}
