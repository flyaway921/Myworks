package cloudnote;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AndroidAction extends ActionSupport {
	 
	 HttpServletRequest request=ServletActionContext.getRequest();
	 HttpServletResponse response=ServletActionContext.getResponse();
	 int key=Integer.parseInt(request.getParameter("key"));
	 String noteid=request.getParameter("noteid");
	 String username=request.getParameter("username");
	 String password=request.getParameter("password");
	 String title=request.getParameter("title");
	 String content=request.getParameter("content");
	 String mail=request.getParameter("mail");
	 
	 public void first(){
		 response.setCharacterEncoding("utf-8");
			try {
				if(key==1){
					System.out.println("执行手机端注册操作");
					this.register();
					
				}
				if(key==2){
					System.out.println("执行手机端登录操作");
					this.login();
					
				}
				if(key==3){
					System.out.println("执行获取用户笔记");
					this.getnote();		
				}
				if(key==4){
					System.out.println("增加笔记");
					this.addnote();	
					this.getnote();
				}
				if(key==5){
					System.out.println("删除笔记");
					this.deletenote();		
					this.getnote();
				}
				if(key==6){
					System.out.println("更新笔记");
					this.updatenote();	
					this.getnote();
				}
				
			} catch (Exception e) {
				e.printStackTrace();	
		}	 
			
	     }
		
		
		
	
	
	 //注册（key=1）
	 public void register() throws IOException, SQLException{
		    
		     PrintWriter out=response.getWriter();
		     StringBuffer sb = new StringBuffer();//数据缓存    
		     Connection conn =DB.getConn();
	    	 String sql="select count(*) from user where username= '" +username+ "'";
	       	 PreparedStatement pstmt=DB.prepare(conn,sql);
	         ResultSet rs=pstmt.executeQuery();
	         int count=0;
	         if(rs.next()){
	        	 count=rs.getInt(1);
	         }
	         if(count==0){
	        	 System.out.println("success");
	             sql = "insert into user(`username`,`password`,`mail`) values('"+username+"','"+password+"','"+mail+"')";
	             System.out.println(sql);
	        	 pstmt=DB.prepare(conn,sql);
	    	     pstmt.executeUpdate();
	    	     DB.close(rs,pstmt,conn);
	    	     sb.append('[');  
	    	     sb.append('{').append("\"key\":").append("\""+key+"\"").append(",");
	             sb.append("\"info\":").append("\"success\"");
	    	     sb.append('}');
	             sb.append(']');  
	             out.write(new String(sb)); 
	             out.flush();  
	             out.close();//关闭  
	         }else{
	        	 DB.close(rs,pstmt,conn);
	        	 System.out.println("fail");
	        	 sb.append('[');  
	        	 sb.append('{').append("\"key\":").append("\""+key+"\"").append(",");
	             sb.append("\"info\":").append("\"fail\"");
	    	     sb.append('}');
	             sb.append(']');  
	             out.write(new String(sb)); 
	             out.flush();  
	             out.close();//关闭  
	   
	         }   	
	     }

	//登录（key=2）
	 public void login() throws IOException, SQLException{
		 PrintWriter out=response.getWriter();
	     StringBuffer sb = new StringBuffer();//数据缓存    
		 Connection conn =DB.getConn();
	 	 String sql="select mail from User where username='"+username+"' and password='"+password+"'";
	   	 PreparedStatement pstmt=DB.prepare(conn,sql);
	     ResultSet rs=pstmt.executeQuery();
	     String mail=null;
	     if(rs.next()){
	    	 mail=rs.getString(1);
	     }
		 DB.close(rs,pstmt,conn);
	     if(mail!=null){	 
	    	 System.out.println("success");
	    	 sb.append('[');  
    	     sb.append('{').append("\"key\":").append("\""+key+"\"").append(",");
             sb.append("\"info\":").append("\"success\"").append(",");
             sb.append("\"mail\":").append("\""+mail+"\"");
    	     sb.append('}');
             sb.append(']');  
             out.write(new String(sb)); 
             out.flush();  
             out.close();//关闭  
	    	
	     }else{
	    	 System.out.println("fail");
	    	 sb.append('[');  
    	     sb.append('{').append("\"key\":").append("\""+key+"\"").append(",");
             sb.append("\"info\":").append("\"fail\"");
    	     sb.append('}');
             sb.append(']');  
             out.write(new String(sb)); 
             out.flush();  
             out.close();//关闭  
            
            
	     }
	 }
	 
	
	  //获取笔记列表（key=3）
     public void getnote() throws Exception{
    	 PrintWriter out=response.getWriter();
    	 ArrayList<NoteBean>  al =new ArrayList<NoteBean> ();
    	 Connection conn =DB.getConn();
     	 String sql="select * from note where username='"+username+"' order by time";
     	 System.out.println(sql);
       	 PreparedStatement pstmt=DB.prepare(conn,sql);
       	 ResultSet rs=pstmt.executeQuery();
    	 while(rs.next()){
    		 NoteBean note=new NoteBean();
    		 note.setNoteid(rs.getInt(1));
    		 note.setTitle(rs.getString(2));
    		 note.setContent(rs.getString(3));
    		 note.setTime(rs.getString(4));
    		 note.setUsername(rs.getString(5));
    		 al.add(note);
    	 }
    	 DB.close(rs,pstmt,conn);
    	// 带泛型的list转化为json  
         Gson gson = new Gson();  
         String json = gson.toJson(al);  
         System.out.println(json);
         out.write(json); 
         out.flush();  
         out.close();//关闭  
    	 
     }
     //增加笔记（key=4）
     public void addnote() throws Exception{
    	 String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    	 Connection conn =DB.getConn();
       	 String sql = "insert into note(`title`,`content`,`time`,`username`) values('"+title+"','"+content+"','"+time+"','"+username+"')";
       	 System.out.println(sql);
       	 PreparedStatement pstmt=DB.prepare(conn,sql);
    	 pstmt.executeUpdate();
    	 DB.close(null,pstmt,conn);
     }
     //删除笔记（key=5）
     public void deletenote() throws Exception{
    	 Connection conn =DB.getConn();
     	 String sql="delete from note where noteid='"+noteid+"'";
     	 System.out.println(sql);
       	 PreparedStatement pstmt=DB.prepare(conn,sql);
       	 pstmt.executeUpdate();
       	 DB.close(null,pstmt,conn);
     }
     //更新笔记（key=6）
     public void updatenote() throws Exception{
    	  String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    	  Connection conn =DB.getConn();
     	  String sql="update note set title='"+title+"' ,content='"+content+"' ,time='"+time+"'  where noteid='"+noteid+"'";
     	  System.out.println(sql);
       	  PreparedStatement pstmt=DB.prepare(conn,sql);
       	  pstmt.executeUpdate();
          DB.close(null,pstmt,conn);
     }
  
	 

}
