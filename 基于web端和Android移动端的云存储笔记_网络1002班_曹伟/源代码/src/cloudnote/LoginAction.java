package cloudnote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport {
	private String username;
	private String password;
	 private ArrayList<UserBean> all;
	HttpServletRequest request=ServletActionContext.getRequest();
    HttpSession session=request.getSession();
    NoteDao nd=new NoteDao(); 
    
   //登录时验证用户
	public String execute() throws SQLException{	 
   	
   	 Connection conn =DB.getConn();
 	 String sql="select count(*)from user where username='"+username+"' and password='"+password+"'";
 	 System.out.println(sql);
   	 PreparedStatement pstmt=DB.prepare(conn,sql);
     ResultSet rs=pstmt.executeQuery();
     int count=0;
     if(rs.next()){
    	 count=rs.getInt(1);
     }
     if(count==1){
    	 session.setAttribute("username", username);
    	 all=nd.listUserInfo(username);
    	 return SUCCESS;
     }else{
    	 this.addActionError("对不起！你输入的账号或密码错误！！");
    	 DB.close(rs, pstmt, conn);
    	 return INPUT;
     }
    }
	
	
	
	
	






	public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}




		public ArrayList<UserBean> getAll() {
			return all;
		}


		public void setAll(ArrayList<UserBean> all) {
			this.all = all;
		}


	
}
