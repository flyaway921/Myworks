package yingjun.interceptor;




import org.apache.struts2.ServletActionContext;

import yingjun.dto.SessionInfo;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;


/**
 * session拦截器
 * 
 */
public class SessionInterceptor extends MethodFilterInterceptor {

	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		System.out.println("进行检查session拦截器");
		SessionInfo s=(SessionInfo) ServletActionContext.getRequest().getSession().getAttribute("sessioninfo");
		if (s == null) {
			ServletActionContext.getRequest().setAttribute("msg", "您还没有登录或登录已超时，请重新登录，然后再刷新本功能！");
			return "noSession";
		}
		return actionInvocation.invoke();
	}

}
