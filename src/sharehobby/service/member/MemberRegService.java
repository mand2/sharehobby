package sharehobby.service.member;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.exhb.MemberDao;
import sharehobby.model.member.MemberInfo;

public class MemberRegService {
	private static MemberRegService service = new MemberRegService();
	public static MemberRegService getInstance() {
		return service;
	}
	
	private MemberRegService() {};
	
	public int reg(MemberInfo memberInfo) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MemberDao dao = MemberDao.getInstance();
			
			rCnt = dao.insert(conn, memberInfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
		
	}
}
