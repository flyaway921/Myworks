package yingjun.interceptor;


import org.apache.struts2.ServletActionContext;

import yingjun.util.RequestUtil;

import yingjun.dto.SessionInfo;



import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 权限拦截器
 * 
 */
public class AuthInterceptor extends MethodFilterInterceptor {


	private static final long serialVersionUID = 1L;

	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		System.out.println("开始权限拦截");
		SessionInfo sessionInfo = (SessionInfo) ServletActionContext.getRequest().getSession().getAttribute("sessioninfo");
		if (sessionInfo.getLoginName().equals("admin")) {
			return actionInvocation.invoke();
		}
		String requestPath = RequestUtil.getRequestPath(ServletActionContext.getRequest());
		String authUrls = sessionInfo.getResourceUrls();
		boolean b = false;
		for (String url : authUrls.split(",")) {
			if (requestPath.equals(url)) {
				b = true;
				break;
			}
		}
		if (b) {
			return actionInvocation.invoke();
		}
		ServletActionContext.getRequest().setAttribute("msg", "您没有访问资源路径为[" + requestPath + "]的权限,请联系管理员!");
		return "noAuth";
	}

}
