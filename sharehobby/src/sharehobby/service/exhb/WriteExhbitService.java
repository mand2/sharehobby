package sharehobby.service.exhb;
/*-------------------
 * 파일이름: WriteExhbitService.java
 * 파일설명: 게시판에 글 쓰기 Service
 * 작성자: 김나연
 * 버전: 1.0.2
 * 생성일자: 2019-07-16 오후 8시 45분
 * 최종수정일자: 2019-07-17 오후 3시 30분
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

public class WriteExhbitService {
	
	//싱글턴
	private WriteExhbitService() {}
	private static WriteExhbitService service = new WriteExhbitService();
	
	public static WriteExhbitService getInstance() {
		return service;
	}
	
	//게시글쓰기
	public int write(BoardExhibition exhbit) {
		int result = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			/*
			 * //auto commit 막기 conn.setAutoCommit(false);
			 */
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			result = dao.insertMessage(conn, exhbit);
			//conn.commit();//잘되면 넣고
		} catch (SQLException e) {
			//JdbcUtil.rollback(conn);
			e.printStackTrace();
		
		} finally {
			
			JdbcUtil.close(conn);
		}
		
		return result;
	}
	
}
