package cloudnote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class NoteDao {
	 //获取笔记列表
    public  ArrayList<NoteBean> getnote(String username,int page) throws Exception{
   	    ArrayList<NoteBean>  al =new ArrayList<NoteBean> ();
     	 Connection conn =DB.getConn();
     	 page=(page-1)*8;
    	 String sql="select * from note where username='"+username+"'order by time desc LIMIT "+page+",8 ";
      	 System.out.println("web开始获取笔记列表");
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
   	 DB.close(rs, pstmt, conn);
   	 return al;
    }
    
    
    //欢迎笔记
    public void addnote(String username) throws Exception{
   	 Connection conn =DB.getConn();
  	     String sql = "insert into note(`title`,`content`,`time`,`username`) values('欢迎使用阿飞的蝶云笔记','本作品由阿飞的蝶团队倾情创作。团队成员分别为：应君、曹伟、孙杭献，作品初衷用做于随时记录学习、日常事务。作品尚不完美，存在一定漏洞。如发现问题请及时联系我们。','','"+username+"')";
  	     PreparedStatement pstmt=DB.prepare(conn,sql);
   	 pstmt.executeUpdate();
   	 DB.close(null, pstmt, conn);
    }
    
    
    //增加笔记
    public void addnote(String title,String content,String username) throws Exception{
   	 String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
   	 System.out.println("web增加笔记");
   	 Connection conn =DB.getConn();
  	 String sql = "insert into note(`title`,`content`,`time`,`username`) values('"+title+"','"+content+"','"+time+"','"+username+"')";
  	 PreparedStatement pstmt=DB.prepare(conn,sql);
   	 pstmt.executeUpdate();
   	 DB.close(null, pstmt, conn);
    }
    //删除笔记
    public void deletenote(int noteid) throws Exception{
   	     Connection conn =DB.getConn();
    	 String sql="delete from note where noteid='"+noteid+"'";
      	 PreparedStatement pstmt=DB.prepare(conn,sql);
      	 pstmt.executeUpdate();
      	 DB.close(pstmt);
     	 DB.close(conn);
   
    }
    //the笔记
    public ArrayList<NoteBean>  thenote(int noteid) throws Exception{
    	  ArrayList<NoteBean>  al =new ArrayList<NoteBean> ();
    	  Connection conn =DB.getConn();
    	  String sql="select * from note where noteid='"+noteid+"'";
      	  PreparedStatement pstmt=DB.prepare(conn,sql);
      	  pstmt.executeQuery();
      	  ResultSet rs=pstmt.executeQuery();
     	   if(rs.next()){
     		 NoteBean note=new NoteBean();
     		 note.setNoteid(rs.getInt(1));
     		 note.setTitle(rs.getString(2));
     		 note.setContent(rs.getString(3));
     		 note.setTime(rs.getString(4));
     		 note.setUsername(rs.getString(5));
     		 al.add(note);
     	 }
     	   DB.close(rs, pstmt, conn);
     	  return al;
    }
    //更新笔记
    public void updatenote(String title,String content,int noteid) throws Exception{
   	  Connection conn =DB.getConn();
    	  String sql="update note set title='"+title+"' ,content='"+content+"' where noteid='"+noteid+"'";
      	  PreparedStatement pstmt=DB.prepare(conn,sql);
      	  pstmt.executeUpdate();
      	  DB.close(pstmt);
     	  DB.close(conn);
   	  
    }
  //获取用户信息
	public ArrayList<UserBean> listUserInfo(String username) throws SQLException{
		 ArrayList<UserBean>  al =new ArrayList<UserBean>();
    	 Connection conn =DB.getConn();
     	 String sql="select username,mail from user where username='"+username+"'";
       	 PreparedStatement pstmt=DB.prepare(conn,sql);
       	 ResultSet rs=pstmt.executeQuery();
    	 if(rs.next()){
    		 UserBean us=new UserBean();
    		 us.setUsername(rs.getString(1));
    		 us.setMail(rs.getString(2));
    		 al.add(us);
    	 }
    	 DB.close(rs, pstmt, conn);
    	 return al;
	}
	  //获取总页数
    public int getpagenum(String username) throws Exception{
   	 Connection conn =DB.getConn();
 	 String sql="select count(*) from note where username='"+username+"'";
   	 PreparedStatement pstmt=DB.prepare(conn,sql);
     ResultSet rs=pstmt.executeQuery();
     int count=0;
     if(rs.next()){
    	 if(rs.getInt(1)%8==0){
    		 count=rs.getInt(1)/8;
    	 }else{
    		 count=rs.getInt(1)/8+1;
    	 }
     }
     return count;
    }
}
