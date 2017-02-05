package cn.cua.action;


import java.io.UnsupportedEncodingException;

import cn.cua.domain.BuserInfo;
import cn.cua.domain.BusinessInfo;
import cn.cua.service.BuserException;
import cn.cua.service.BuserService;
import cn.cua.service.BusinessService;
import cn.cua.utils.LogMessageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class BuserAction extends ActionSupport implements ModelDriven<BuserInfo> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BuserService buserService = new BuserService();
	private BusinessService businessService = new BusinessService();
	private BuserInfo model = new BuserInfo();//手动实例化

	
	private int pageNum;
	private int totalpage;
	private int pageSize;
	
	private int qBuserId;
	private String qBuserName;
	private String qBuserPasswd;
	private String qEmail;
	private String qBuserRole;
	
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
			//AdminInfo admin = BuserService.login(model.getAdminName(), model.getAdminPassword());
			//ActionContext.getContext().getSession().put("admin", admin);
		try{
			if (model.getBuserName()!=null){
			BuserInfo Buser = buserService.login(model.getBuserName(), model.getBuserPasswd());
			BusinessInfo business = businessService.findBusinessById(Buser.getBusinessId());
			ActionContext.getContext().getSession().put("buserId", Buser.getBuserId());
			ActionContext.getContext().getSession().put("name", "商家:"+Buser.getBuserName());
			if(Buser.getBuserType()==2){
				//LogMessageUtil.log("商家"+business.getBusinessName()+"店长"+model.getBuserName()+"登录");
				return "success_boss";

			}else{
				//LogMessageUtil.log("商家"+business.getBusinessName()+"店员"+model.getBuserName()+"登录");
				return "success_assistant";
			}
			}
			return "Buser_login";
		}catch(BuserException e){
			this.addActionError(e.getMessage());
			return "Buser_login";
		}
	}

	
	/**
	 * 查询所有管理员的分页操作
	 * @return
	 */
	public String page(){
		pageSize = 30;
		int userAmount = buserService.getBuserAmount();
		if(userAmount==0){
			return "pageFailed";
		}
		

		this.totalpage = userAmount%pageSize==0?(userAmount/pageSize):(userAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "page";
	}
//	
//	/**
//	 * 查询所有管理员
//	 * @return
//	 */
	public String findAll(){
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buser = buserService.findBuserById(buserId);
		Integer businessId = buser.getBusinessId();
		ActionContext.getContext().getValueStack().push(buserService.findAll(pageNum, pageSize, businessId));
		return "list";
	}
//	
	/**
	 * 增加管理员信息
	 * @return
	 * @throws AdminException 
	 ######################*/
	public String add() throws BuserException{
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buser = buserService.findBuserById(buserId);
		model.setBusinessId(buser.getBusinessId());
		
		
		try {		
			buserService.add(model);
			
			
			return "pageSucc";
		} catch (BuserException e) {
			String message = e.getMessage();
			if("1".equals(message)){
				this.addFieldError("buserNumberError", "店员名称已存在，请更换编号！");
			}
			return "add";
		}
		
	}
//	
	/**
	 * 修改信息之前的加载操作
	 * 将封装的model的信息添加到新页面的valueStack中去
	 * @return
	 */
	public String loadForEdit(){
		ActionContext.getContext().getValueStack().push(buserService.load(model.getBuserId()));
		return "edit";
	}
//	
	/**
	 * 修改操作，需要设置默认的adminId在页面隐藏域
	 * @return
	 */
	public String edit(){
		BuserInfo buser = buserService.findBuserById(model.getBuserId());
		buser.setBuserMail(model.getBuserMail());
		buser.setBuserName(model.getBuserName());
		buser.setBuserPasswd(model.getBuserPasswd());
		
		try {		
			buserService.edit(buser);
			return "pageSucc";
		} catch (BuserException e) {
			String message = e.getMessage();
			if("1".equals(message)){
				this.addFieldError("buserNumberError", "店员编号已存在，请更换编号！");
			}
			return "edit";
		}		
	}
	
	/**
	 * 查看管理员信息
	 * @return
	 */
	public String load(){
		ActionContext.getContext().getValueStack().push(buserService.load(model.getBuserId()));
		return "view";
	}
	
	public String delete(){
		buserService.delete(model.getBuserId());
		return "pageSucc";
	}
	
	/**
	 * 条件查询分页操作
	 * @return
	 */
	public String pageQuery(){
		pageSize = 30;		
		int userAmount = buserService.getQueryAmount(model);
		model.setBuserName(qBuserName);

		this.totalpage = userAmount%pageSize==0?(userAmount/pageSize):(userAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pageQuery";
	}
	
	/**
	 * 条件查询分页操作
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String pageQuery1() throws UnsupportedEncodingException{
		pageSize = 30;
		model.setBuserName(qBuserName);
		int userAmount = buserService.getQueryAmount(model);
		this.totalpage = userAmount%pageSize==0?(userAmount/pageSize):(userAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pageQuery";
	}
	
	public String query() throws UnsupportedEncodingException{
		model.setBuserName(qBuserName);
		ActionContext.getContext().getValueStack().push(buserService.query(model, pageNum, pageSize));
		return "listQuery";
	}
	
	public BuserInfo getModel() {
		return model;
	}


	public BuserService getBuserService() {
		return buserService;
	}


	public void setBuserService(BuserService buserService) {
		this.buserService = buserService;
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


	public int getQBuserId() {
		return qBuserId;
	}


	public void setQBuserId(int qBuserId) {
		this.qBuserId = qBuserId;
	}


	public String getQBuserName() {
		return qBuserName;
	}


	public void setQBuserName(String qBuserName) {
		this.qBuserName = qBuserName;
	}


	public String getQBuserPasswd() {
		return qBuserPasswd;
	}


	public void setQBuserPasswd(String qBuserPasswd) {
		this.qBuserPasswd = qBuserPasswd;
	}


	public String getQEmail() {
		return qEmail;
	}


	public void setQEmail(String qEmail) {
		this.qEmail = qEmail;
	}


	public String getQBuserRole() {
		return qBuserRole;
	}


	public void setQBuserRole(String qBuserRole) {
		this.qBuserRole = qBuserRole;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public void setModel(BuserInfo model) {
		this.model = model;
	}
	
	

}
