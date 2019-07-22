package sharehobby.service.member;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.member.MemberDao;
import sharehobby.model.member.LoginInfo;
import sharehobby.model.member.MemberInfo;

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
