package sharehobby.service.exhb.comment;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.exhb.ExhbCommentDao;

public class DeleteCommentService {
	private DeleteCommentService() {}
	private static DeleteCommentService service = new DeleteCommentService();
	
	public static DeleteCommentService getInstance() {
		return service;
	}
	
	//코멘트 삭제
	public int delete(int bc_num){
		int result = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);
			
			ExhbCommentDao dao = ExhbCommentDao.getInstance();
			result = dao.deleteComment(conn, bc_num);
			
			conn.commit();
		
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}
		
		
		return result;
	}
}
