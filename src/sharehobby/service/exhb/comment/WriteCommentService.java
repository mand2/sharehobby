package sharehobby.service.exhb.comment;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.exhb.ExhbCommentDao;
import sharehobby.model.exhb.BoardComment;

public class WriteCommentService {
	//싱글턴
	private WriteCommentService() {}
	private static WriteCommentService service = new WriteCommentService();
	public static WriteCommentService getInstance() {
		return service;
	}

	//게시글쓰기
	public int write(String bc_cont, int be_num, int u_num, int bc_parent) {
		int result = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ExhbCommentDao dao = ExhbCommentDao.getInstance();
			
			result = dao.insertComment(conn, bc_cont, be_num, u_num, bc_parent);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result ;
	}

	//부모넘버 가져오기
	public BoardComment getParent(int bc_num) {
		BoardComment parent = null;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ExhbCommentDao dao = ExhbCommentDao.getInstance();
			
			parent = dao.selectParent(conn, bc_num);
			
			
		} catch (SQLException e) {
			System.out.println(e + "부모넘버못가져옴");
			e.printStackTrace();
		}
		return parent;
	}

}
