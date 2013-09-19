package cloudnote;

import java.sql.*;


public class DB {
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");// 通过class.forname加载数据库驱动，此处加载 mysql驱动
			conn = DriverManager.getConnection("jdbc:mysql://localhost/cloudnote?user=root&password=yingjun&characterEncoding=utf-8");// 使用java.sql包下的drivermanager类打开数据库连接
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	/**
	 * 如果应用程序中的多次执行都要用到同一条sql语句，将使应用程序的效率明显降低，这时可以使用preparedStatement对象来解决。
	 * 此对象第一次执行的时候将sql语句传给数据库预编译，从而在以后执行这个sql语句时速度都能得到很大的提高。
	 * 建立的连接
	 * 要执行的sql语句
	 * @return
	 */
	public static PreparedStatement prepare(Connection conn,  String sql) {
		PreparedStatement pstmt = null; 
		try {
			if(conn != null) {
				pstmt = conn.prepareStatement(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	//该对象能获取自动生成的键。给定常量告知驱动程序是否可以获取自动生成的键
	public static PreparedStatement prepare(Connection conn,  String sql, int autoGenereatedKeys) {
		PreparedStatement pstmt = null; 
		try {
			if(conn != null) {
				pstmt = conn.prepareStatement(sql, autoGenereatedKeys);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	
	public static Statement getStatement(Connection conn) {
		Statement stmt = null; 
		try {
			if(conn != null) {
				stmt = conn.createStatement();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}
	

	
	public static ResultSet getResultSet(Statement stmt, String sql) {
		ResultSet rs = null;
		try {
			if(stmt != null) {
				rs = stmt.executeQuery(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static void executeUpdate(Statement stmt, String sql) {
		try {
			if(stmt != null) {
				stmt.executeUpdate(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public static void close(Connection conn) {
		try {
			if(conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public static void close(ResultSet rs,Statement stmt,Connection conn) {  
        try {   
        	if(rs != null) {  
                rs.close();  
                rs = null;  
            } 
        	if(stmt != null) {  
                stmt.close();  
                stmt = null;  
            }  
            if(conn != null) {  
                conn.close();  
                conn = null;  
            }  
          } catch (SQLException e) {  
            e.printStackTrace();  
        }  
    }  
      
	
	
	
	
}
