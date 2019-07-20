package sharehobby.service.member;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;
import sharehobby.dao.member.MemberDao;
import sharehobby.exception.member.InvalidMemberPasswordException;
import sharehobby.exception.member.MemberNotFoundException;
import sharehobby.model.member.MemberInfo;

public class UpdateMemberService {
	private static UpdateMemberService service = new UpdateMemberService();
	public static UpdateMemberService getInstance() {
		return service;
	}
	private UpdateMemberService() {}
	
	public int updateMember(int u_num, MemberInfo memberInfo) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			MemberDao dao = MemberDao.getInstance();
			
			rCnt = dao.updateMember(u_num, memberInfo);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
		
	}
}
