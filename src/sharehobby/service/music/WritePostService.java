package sharehobby.service.music;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.music.BoardMusicDao;
import sharehobby.model.music.BoardPost;

public class WritePostService {
	private static WritePostService service = new WritePostService();
	private WritePostService() {}
	
	public static WritePostService getInstance() {
		return service;
	}
	
	public int writePost(BoardPost post) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			BoardMusicDao dao = BoardMusicDao.getInstance();
			
			rCnt = dao.insertPost(conn, post);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return rCnt;
	}
	
}
