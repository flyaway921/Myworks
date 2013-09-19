package cloudnote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AdviceAction extends ActionSupport {
	private String advice;

    public String execute() throws SQLException{	 
   	 System.out.println(advice);
   	 Connection conn =DB.getConn();
   	 String sql = "insert into advice(`advice`) values('"+advice+"')";
   	 PreparedStatement pstmt=DB.prepare(conn,sql);
	 pstmt.executeUpdate();
	 DB.close(pstmt);
	 DB.close(conn);
   	 return "success";
    }
    
	
	
	
	public String getAdvice() {
		return advice;
	}

	public void setAdvice(String advice) {
		this.advice = advice;
	}
}
