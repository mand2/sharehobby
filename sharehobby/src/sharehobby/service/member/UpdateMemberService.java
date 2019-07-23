package sharehobby.service.member;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
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
	
	public int updateMember(int u_num, String u_pw, MemberInfo memberInfo) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);
			
			MemberDao dao = MemberDao.getInstance();
			
			memberInfo = dao.Member(u_num);
			
			if(memberInfo == null) {
				throw new MemberNotFoundException("가입된 회원의 정보가 없습니다.." + u_num);
			}if(!memberInfo.hasu_pw()){
				throw new InvalidMemberPasswordException("아이디 혹은 비밀번호가 틀렸습니다.");
			}if (!memberInfo.matchu_numpw(u_num, u_pw)) {
				throw new InvalidMemberPasswordException("아이디 혹은 비밀번호가 틀렸습니다.");
			}
			rCnt = dao.updateMember(u_num, memberInfo);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MemberNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidMemberPasswordException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
		
	}
}
