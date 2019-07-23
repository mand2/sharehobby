package sharehobby.service.exhb;
/*-------------------
 * 파일이름: DeleteExhbitService.java
 * 파일설명: 게시판에 쓴 글 삭제 Service
 * 작성자: 김나연
 * 버전: 1.0.2
 * 생성일자: 2019-07-16 오후 8시 45분
 * 최종수정일자: 2019-07-18 오후 2시 48분
 * 최종수정자: 김나연
 * 최종수정내용: 메서드 추가
 * abbr: exhbit
 * -------------------*/

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.exhb.ExhibitionDao;
import sharehobby.model.exhb.BoardExhibition;

public class DeleteExhbitService {
	//생성자
	private DeleteExhbitService() {}
	private static DeleteExhbitService service = new DeleteExhbitService();
	public static DeleteExhbitService getInstance() {
		return service;
	}
	
	//메세지딜리트
	public int deleteMessage(int be_num) {
		int result = 0;
		Connection conn=null;
		/*
		 * dao 에서
		 * int deleteMsg(Connection conn, int be_num) 써야함.
		 * */
		
		try {
			conn = ConnectionProvider.getConnection();
			//커밋 막음
			conn.setAutoCommit(false);
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			
			result = dao.deleteMsg(conn, be_num);
			conn.commit();
			
			
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		
		} finally {
			JdbcUtil.close(conn);
		} 
		
		return result;
		
	}
}
