package sharehobby.service.music;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.music.MemberDao;
import sharehobby.model.music.LoginInfo;
import sharehobby.model.music.MemberInfo;

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
