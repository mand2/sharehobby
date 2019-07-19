package sharehobby.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.BoardMusicDao;
import sharehobby.model.BoardPost;

public class ShowPostService {
	private static ShowPostService service = new ShowPostService();
	private ShowPostService() {}
	
	public static ShowPostService getInstance() {
		return service;
	}
	
	public BoardPost showPost(int bmNum) {
		BoardPost post = null;
		Connection conn = null;
		try {
			BoardMusicDao dao = BoardMusicDao.getInstance();
			conn = ConnectionProvider.getConnection();
			
			post = dao.selectPost(conn, bmNum);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return post;
	}
	
}
