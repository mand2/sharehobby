package sharehobby.service.member;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.exhb.MemberDao;
import sharehobby.model.member.LoginInfo;

public class LoginService {
	private static LoginService service = new LoginService();
	public static LoginService getInstance() {
		return service;
	}
	
	private LoginService() {};
	
	public int select(LoginInfo loginInfo) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MemberDao dao = MemberDao.getInstance();
			
			rCnt = dao.select(conn, loginInfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
		
	}
}
