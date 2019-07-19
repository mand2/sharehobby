package sharehobby.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.MemberDao;
import sharehobby.model.LoginInfo;
import sharehobby.model.MemberInfo;

public class LoginService {
	private static LoginService service = new LoginService();
	public static LoginService getInstance() {
		return service;
	}
	
	private LoginService() {};
	
	public MemberInfo select(LoginInfo loginInfo) {
		MemberInfo rs = null;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MemberDao dao = MemberDao.getInstance();
			
			rs = dao.select(conn, loginInfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
}
