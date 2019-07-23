package sharehobby.service.exhb.comment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.exhb.ExhbCommentDao;
import sharehobby.model.exhb.BoardComment;

public class ShowCommentService {

	//싱글턴
	private ShowCommentService() {}
	private static ShowCommentService service = new ShowCommentService();
	public static ShowCommentService getInstance() {
		return service;
	}
	
	//comment 리스트 보여주기
	public List<BoardComment> getList(int be_num){
		List<BoardComment> list = null;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ExhbCommentDao dao = ExhbCommentDao.getInstance();
		
			list = dao.selectComment(conn, be_num);
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		return list;
	}
	
	//댓글수
	public int getCnt(int be_num) {
		int cnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ExhbCommentDao dao = ExhbCommentDao.getInstance();
			
			cnt = dao.selectCnt(conn, be_num);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return cnt;
	}
}
