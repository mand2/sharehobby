package sharehobby.service.exhb;
/*-------------------
 * 파일이름: AlterExhbitService.java
 * 파일설명: 전시회 게시판 수정 Service
 * --> 작성자만 수정버튼이 보임)  
 * 작성자: 김나연
 * 버전: 1.1.0
 * 생성일자: 2019-07-18 오후 2시 50분
 * 최종수정일자: 2019-07-19 오전 9시 34분 
 * 최종수정자: 김나연
 * 최종수정내용: 내용 추가
 * abbr: exhbit
 * -------------------*/

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.exhb.ExhibitionDao;
import sharehobby.model.exhb.BoardExhibition;

public class AlterExhbitService {
	private AlterExhbitService () {}
	private static AlterExhbitService service = new AlterExhbitService();
	public static AlterExhbitService getInstance() {
		return service;
	}
	
	public int alterMsg(BoardExhibition exhbit, int be_num) {
		int result = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
		
			conn.setAutoCommit(false);
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			result = dao.updateMsg(conn, exhbit, be_num);
			
			conn.commit();
		
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}
		return result;
	}
}
