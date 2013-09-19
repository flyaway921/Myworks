package cloudnote;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
     private String username;
     private String password;
     private String mail;
     
     public String execute() throws Exception{	 
    	 System.out.println(username+password+mail);
    	 Connection conn =DB.getConn();
    	 String sql="select count(*) from user where username= '" +username+ "'";
       	 PreparedStatement pstmt=DB.prepare(conn,sql);
         ResultSet rs=pstmt.executeQuery();
         int count=0;
         if(rs.next()){
        	 count=rs.getInt(1);
         }
         if(count==0){
             sql = "insert into user(`username`,`password`,`mail`) values('"+username+"','"+password+"','"+mail+"')";
             System.out.println(sql);
        	 pstmt=DB.prepare(conn,sql);
    	     pstmt.executeUpdate();
    	     DB.close(null, pstmt, conn);
    	     NoteDao nd=new NoteDao();
    	     nd.addnote(username);
        	 return SUCCESS;
         }else{
        	 DB.close(rs);
     	     DB.close(pstmt);
     		 DB.close(conn);
     		 this.addActionError("对不起！该用户已被注册！！");
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
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
     
}
