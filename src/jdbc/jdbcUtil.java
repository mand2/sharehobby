package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbcUtil {

	public static void close(ResultSet rs) {
		// nullPointException 방지하기 위해 null인지 아닌지 판별하는 것이 필요함.
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	// PreparedStatement 또한 같이 처리됨.
	// 다형성에 해당되기 때문임
	public static void close(Statement stmt) {
		// nullPointException 방지하기 위해 null인지 아닌지 판별하는 것이 필요함.
		if(stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Connection conn) {
		// nullPointException 방지하기 위해 null인지 아닌지 판별하는 것이 필요함.
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 트랜잭션 관리
	public static void rollback(Connection conn) {
		if(conn!=null) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
