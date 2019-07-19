package sharehobby.service.member;

import java.sql.Connection;
import java.sql.SQLException;

import com.sun.crypto.provider.RSACipher;

import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;
import sharehobby.dao.member.MemberDao;
import sharehobby.exception.member.InvalidMemberPasswordException;
import sharehobby.exception.member.MemberNotFoundException;
import sharehobby.model.member.MemberInfo;

public class DeleteMemberService {

	private static DeleteMemberService service = new DeleteMemberService();

	public static DeleteMemberService getInstance() {
		return service;
	}

	private DeleteMemberService() {
	};
	//�떛湲��넠 �걹

	public int deleteMember(int u_num, String u_pw) throws SQLException, MemberNotFoundException, InvalidMemberPasswordException {
		int resultCnt = 0;

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);

			MemberDao dao = MemberDao.getInstance();
			
			MemberInfo memberInfo = dao.select(u_num);

			if (memberInfo == null) {
				throw new MemberNotFoundException("가입된 회원의 정보가 없습니다.." + u_num);
			}
			if (!memberInfo.hasu_pw()) {
				throw new InvalidMemberPasswordException("아이디 혹은 비밀번호가 틀렸습니다.");
			}
			if (!memberInfo.matchu_numpw(u_num, u_pw)) {
				throw new InvalidMemberPasswordException("아이디 혹은 비밀번호가 틀렸습니다.");
			}
			
			resultCnt = dao.deleteMember(u_num, u_pw);
			
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (MemberNotFoundException e) {
			// TODO Auto-generated catch block
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (InvalidMemberPasswordException e) {
			// TODO Auto-generated catch block
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}

		return resultCnt;
	}
}
