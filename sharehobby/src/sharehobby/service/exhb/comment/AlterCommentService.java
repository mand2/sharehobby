package sharehobby.service.exhb.comment;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.exhb.ExhbCommentDao;
import sharehobby.model.exhb.BoardComment;

public class AlterCommentService {
	private AlterCommentService() {}
	private static AlterCommentService service = new AlterCommentService();
	public static AlterCommentService getInstance() {
		return service;
	}
	
	//코멘트 변경
	public int alter(BoardComment comment, int bc_num) {
		int result = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);
			
			ExhbCommentDao dao = ExhbCommentDao.getInstance();
			result = dao.updateComment(conn, comment, bc_num); 
			
			conn.commit();
		
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}
		
		return result;
	}
	//변경할 코멘트 선택
	public BoardComment getComment(int bc_num) {
		BoardComment comment = null;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ExhbCommentDao dao = ExhbCommentDao.getInstance();
			
			comment = dao.selectOneComment(conn, bc_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return comment;
	}
}
