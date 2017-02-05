package cn.cua.interceptor;

import cn.cua.domain.AdminInfo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor{
	
	public String doIntercept(ActionInvocation invocation) throws Exception {
		AdminInfo admin = (AdminInfo) ActionContext.getContext().getSession().get("admin");
		
		if (admin == null) {
			ActionSupport action =  (ActionSupport)invocation.getAction();
			action.addActionError("您还没有登录！");
			return "login";
		}
		
		return invocation.invoke();
	}
	
	public String loginIntercept(ActionInvocation invocation) throws Exception {
		
		return "success";
	}
}
