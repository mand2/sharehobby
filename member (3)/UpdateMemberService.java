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
	
	private UpdateMemberService() {};
	
	public int UpdateMember(int u_num, String u_pw) throws SQLException, MemberNotFoundException, InvalidMemberPasswordException  {
		int resultCnt = 0;
		
		Connection conn = null;
		
		MemberDao dao = MemberDao.getInstance();
		
		MemberInfo memberInfo = dao.select(u_num);
		
		try {
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);
			
			if(memberInfo == null) {
				throw new MemberNotFoundException("��ϵ� ȸ���� �ƴմϴ�." + u_num);
			}
			if(!memberInfo.hasu_pw()) {
				throw new InvalidMemberPasswordException("���̵� Ȥ�� ��й�ȣ�� Ʋ���ϴ�.");
			}
			if(!memberInfo.matchu_numpw(u_num, u_pw)) {
				throw new InvalidMemberPasswordException("���̵� Ȥ�� ��й�ȣ�� Ʋ���ϴ�.");
			}
			
			resultCnt = dao.updateMember(memberInfo);
			
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
