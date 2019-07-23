package sharehobby.service.member;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.member.MemberDao;

public class LoginService {
	private static LoginService service = new LoginService();
	
	public static LoginService getInstance() {
		return service;
	}
	private LoginService() {};
	
	public int login(int u_num, String u_pw) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MemberDao dao = MemberDao.getInstance();
			
			/* rCnt = dao.loginChk(id, pw); */
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
	}
}
