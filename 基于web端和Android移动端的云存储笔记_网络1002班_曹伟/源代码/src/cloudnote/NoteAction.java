package cloudnote;


import java.sql.SQLException;
import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


@SuppressWarnings("serial")
public class NoteAction  {
	  public String title;
	  public String content;
	  public int noteid;
	  public ArrayList<NoteBean> al;
      public ArrayList<UserBean> all;
      public int page;
      public int pagenum;
      
      HttpServletRequest request=ServletActionContext.getRequest();
      HttpSession session=request.getSession();
      String username=(String)session.getAttribute("username");
      NoteDao nd=new NoteDao();    
	     //获取用户信息
          public String listuserinfo() throws SQLException{
    	  all=nd.listUserInfo(username);
    	  return "index";
      }
      
 
		//增加笔记
        public String addnote() throws Exception{
           nd.addnote(title, content, username);
           System.out.println("跳的页码是："+page);
           al=nd.getnote(username,page);
           pagenum=nd.getpagenum(username);
      	   return "success";
        }
        
    	//删除笔记
        public String deletenote() throws Exception{
           nd.deletenote(noteid);
           System.out.println("跳的页码是："+page);
           al=nd.getnote(username,page);
           pagenum=nd.getpagenum(username);
      	   return "success";
        }
      //更新笔记
        public String updatenote() throws Exception{
           nd.updatenote(title, content, noteid);
           System.out.println("跳的页码是："+page);
           al=nd.getnote(username,page);
           pagenum=nd.getpagenum(username);
      	   return "success";
        }
      //the笔记
        public String thenote() throws Exception{
           al=nd.thenote(noteid);
      	   return "thenote";
        }
        
       //浏览笔记
         public String listnote() throws Exception{
    	  System.out.println("跳的页码是："+page);
    	
    	  al=nd.getnote(username,page);
    	  pagenum=nd.getpagenum(username);
    	  return "success";
      }
     
  
    public String getTitle() {
 		return title;
 	}
 	public void setTitle(String title) {
 		this.title = title;
 	}
 	public String getContent() {
 		return content;
 	}
 	public void setContent(String content) {
 		this.content = content;
 	}
 	public int getNoteid() {
 		return noteid;
 	}
 	public void setNoteid(int noteid) {
 		this.noteid = noteid;
 	}


	public ArrayList<NoteBean> getAl() {
		return al;
	}


	public void setAl(ArrayList<NoteBean> al) {
		this.al = al;
	}


	public ArrayList<UserBean> getAll() {
		return all;
	}


	public void setAll(ArrayList<UserBean> all) {
		this.all = all;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getPagenum() {
		return pagenum;
	}


	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
 
  
     
}
