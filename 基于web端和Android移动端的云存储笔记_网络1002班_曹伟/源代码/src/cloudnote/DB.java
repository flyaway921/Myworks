package cloudnote;

import java.sql.*;


public class DB {
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");// ͨ��class.forname�������ݿ��������˴����� mysql����
			conn = DriverManager.getConnection("jdbc:mysql://localhost/cloudnote?user=root&password=yingjun&characterEncoding=utf-8");// ʹ��java.sql���µ�drivermanager������ݿ�����
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	/**
	 * ���Ӧ�ó����еĶ��ִ�ж�Ҫ�õ�ͬһ��sql��䣬��ʹӦ�ó����Ч�����Խ��ͣ���ʱ����ʹ��preparedStatement�����������
	 * �˶����һ��ִ�е�ʱ��sql��䴫�����ݿ�Ԥ���룬�Ӷ����Ժ�ִ�����sql���ʱ�ٶȶ��ܵõ��ܴ����ߡ�
	 * ����������
	 * Ҫִ�е�sql���
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
	//�ö����ܻ�ȡ�Զ����ɵļ�������������֪���������Ƿ���Ի�ȡ�Զ����ɵļ�
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
