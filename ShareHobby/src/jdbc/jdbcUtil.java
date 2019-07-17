package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbcUtil {

	
	public static void close(ResultSet rs) {
		
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// Statement <- PreparedStatement 상속관
	// 다형성이 가능하므로 Pstmt 도 사용이 가능
	public static void close(Statement stmt) {
		
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(Connection conn) {
	
	if(conn != null) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	}
	
	public static void rollback(Connection conn) {
	      if(conn != null) {
	         try {
	            conn.rollback();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	 }
	
	
	
}
