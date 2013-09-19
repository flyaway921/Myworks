package cloudnote;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginOutAction extends ActionSupport {


    public String execute() throws SQLException {
    	HttpServletRequest request=ServletActionContext.getRequest();
    	HttpSession session=request.getSession();
    	session.removeAttribute("username");
    	return SUCCESS;
    }
}
