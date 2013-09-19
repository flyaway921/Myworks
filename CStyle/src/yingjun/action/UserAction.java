package yingjun.action;


import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import yingjun.dto.DataGrid;
import yingjun.dto.Json;
import yingjun.dto.SessionInfo;
import yingjun.dto.UserDTO;
import yingjun.service.UserServiceI;
import yingjun.service.WorksServiceI;
import yingjun.util.IpUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("base")
@Namespace("/")
@Action("userAction")
@ResultPath("/")
@Results({ @Result(name="loginok",type="redirect",location="admin/index.jsp"),
	       @Result(name="loginfail",type="redirect" ,location="admin/login.jsp"),
	       @Result(name="userloginok",type="redirect",location="front/index.jsp"),
	       @Result(name="userloginfail",type="redirect",params={"msg","loginfail"}, location="front/index.jsp"),
	       @Result(name="nologin",type="redirect" ,params={"msg","nologin"},location="front/index.jsp"),
	       @Result(name="register",type="redirect" ,params={"msg","registerok"},location="front/index.jsp"),
	       @Result(name="tomyinfo",type="redirect" ,location="front/myindex.jsp"),
	       @Result(name="tomyworks",type="redirect" ,params={"msg","tomyworks"}, location="front/myindex.jsp"),
	       @Result(name="toregister",type="redirect" ,params={"msg","toregister"}, location="front/myindex.jsp"),
	       @Result(name="upUserok",type="redirect" ,location="front/myindex.jsp"),
	       @Result(name="upwdok",type="redirect" ,params={"msg","cgpwdok"},location="front/myindex.jsp"),
	       @Result(name="upwdfail",type="redirect" ,params={"msg","cgpwdfail"},location="front/myindex.jsp"),
	       @Result(name="clearsession",type="redirect",location="front/index.jsp"),
	       @Result(name="clearsession2",type="redirect",location="admin/index.jsp")
	       })
public class UserAction  extends BaseAction implements ModelDriven<UserDTO> {
	private static final long serialVersionUID = 1L;
	private UserDTO userdto = new UserDTO();
	private UserServiceI userService;
	
	public UserDTO getModel() {
		return userdto;
	}

	public UserServiceI getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}

	
	
	
	
	/* 后台管理员登录 */
	public String noSession_login() {
		HttpServletRequest request= ServletActionContext.getRequest();
		String rand=(String) request.getSession().getAttribute("rand");
		if(!rand.equals(userdto.getRand())){
			return "loginfail";
		}
		UserDTO ud = userService.login(userdto);
		if (ud != null) {
			SessionInfo sessioninfo=new SessionInfo();
			sessioninfo.setUserId(ud.getId());
			sessioninfo.setLoginName(ud.getName());
			sessioninfo.setRoleNames(ud.getRoletexts());
			sessioninfo.setResourceUrls(ud.getResouseurls());
			sessioninfo.setIp(IpUtil.getIpAddr(request));
			request.getSession().setAttribute("sessioninfo", sessioninfo);
			return "loginok";
		} else {
			return "loginfail";
		}

	
	}

	/* 前台用户登录 */
	public String noSession_userlogin() {
		UserDTO ud = userService.userlogin(userdto);
		HttpServletRequest request= ServletActionContext.getRequest();
		if (ud != null) {
			SessionInfo sessioninfo=new SessionInfo();
			sessioninfo.setUserId(ud.getId());
			sessioninfo.setLoginName(ud.getName());
			sessioninfo.setIp(IpUtil.getIpAddr(request));
			sessioninfo.setMail(ud.getMail());
			sessioninfo.setQq(ud.getQq());
			sessioninfo.setRealname(ud.getRealname());
			sessioninfo.setSex(ud.getSex());
			sessioninfo.setCollege(ud.getCollege());
			if(userdto.getBirthday()!=null){
		    sessioninfo.setBirthday(ud.getBirthday()+"");
			}
		    sessioninfo.setCreatedatetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(ud.getCreatedatetime()));
		    sessioninfo.setLastlogintime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(ud.getModifydatetime()));
			request.getSession().setAttribute("usersessioninfo", sessioninfo);
			return  "userloginok";
	    }else{
	    	return  "userloginfail";
	    }
	}
	
	/*前往个人中心*/
	public String front_toMyinformation(){
		HttpServletRequest request= ServletActionContext.getRequest();
		if(request.getSession().getAttribute("usersessioninfo")==null){
			return "nologin";
		}
		long a[]=userService.getWorksAndRankingsNum(userdto.getId());
		request.getSession().setAttribute("worksnum", a[0]);
		request.getSession().setAttribute("videossnum", a[1]);
		return "tomyinfo";
	}
	

	
	/*前往注册页面*/
	public String front_toregister(){
		return "toregister";
	}
	
	/*前台更新用户信息*/
	public String front_updateUser() {
		userService.update(userdto);
		HttpServletRequest request= ServletActionContext.getRequest();
		SessionInfo sessioninfo=(SessionInfo) request.getSession().getAttribute("usersessioninfo");
		sessioninfo.setMail(userdto.getMail());
		sessioninfo.setQq(userdto.getQq());
		sessioninfo.setRealname(userdto.getRealname());
		sessioninfo.setSex(userdto.getSex());
		sessioninfo.setCollege(userdto.getCollege());
		if(userdto.getBirthday()!=null){
			sessioninfo.setBirthday(new SimpleDateFormat("yyyy-MM-dd").format(userdto.getBirthday()));
		}
		request.getSession().setAttribute("usersessioninfo", sessioninfo);
		return "upUserok";
	}
	
	/*前台注册用户*/
	public String front_register() {
		userService.add(userdto);
		return "register";
	}
	
	/* 前台退出系统*/
	public String noSession_loginout(){
		HttpSession session= ServletActionContext.getRequest().getSession();
		if (session != null) {
			session.invalidate();
		}
		return "clearsession";
	}
	/* 后台退出系统*/
	public String noSession_adminloginout(){
		HttpSession session= ServletActionContext.getRequest().getSession();
		if (session != null) {
			session.invalidate();
		}
		return "clearsession2";
	}
	
	/*前台用户更新密码*/
	public String front_updateUserPwd() {
		if(userService.frontupdateUserPwd(userdto)){
		  return "upwdok";	
		}
		 return "upwdfail";	
	}
	/*前台用户注册时验证帐号名是否存在*/
	public void front_checkNameIsHave(){
		boolean j=false;
		if(!userService.checkNameIsHave(userdto.getName())){
			j=true;
		}
		super.writeJson(j);
	}
	

	/* 获取管理员信息 */
	public void getAdmin() {
		DataGrid d = userService.userdatagrid(userdto,0);
		super.writeJson(d);
	}
	/* 获取用户信息 */
	public void getUser() {
		DataGrid d = userService.userdatagrid(userdto,1);
		super.writeJson(d);
	}
	

	/* 增加管理员 */
	public void addAdmin() {
		Json j = new Json();
		try {
			userService.add(userdto);
			j.setSuccess(true);
			j.setMsg("添加用户成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("添加失败，已经存在该用户！");
		}
		super.writeJson(j);
	}
	/* 增加用户 */
	public void addUser() {
		this.addAdmin();
	}
	
	/* 删除管理员 */
	public void deleteAdmin() {
		Json j = new Json();
		try {
			userService.delete(userdto.getIds());
			j.setSuccess(true);
			j.setMsg("删除用户成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("删除失败！");
		}
		super.writeJson(j);
	}
	/* 删除用户*/
	public void deleteUser() {
		this.deleteAdmin();
	}
	
	/* 更新管理员 */
	public void updateAdmin() {
		Json j = new Json();
		try {
			userService.update(userdto);
			j.setSuccess(true);
			j.setMsg("更新成功！");
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg("更新失败！");
		}
		super.writeJson(j);
	}
	/* 更新用户 */
	public void updateUser() {
		this.updateAdmin();
	}
	
	/* 修改管理员密码*/
	public void updateAdminPwd() {
		this.updateAdmin();
	}
	/* 修改用户密码 */
	public void updateUserPwd() {
		this.updateAdmin();
	}
	/* 修改自身管理员密码 */
	public void noAuth_updateAdminPwd() {
		this.updateAdmin();
	}
	


	
	
}
