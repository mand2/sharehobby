package sharehobby.service.music;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.music.BoardMusicDao;
import sharehobby.model.music.BoardPost;

public class ModifyPostService {
	private static ModifyPostService service = new ModifyPostService();
	private ModifyPostService() {}
	
	public static ModifyPostService getInstance() {
		return service;
	}
	
	public int modifyPost(int bmNum, BoardPost currentPost) {
		int rCnt = 0;
		Connection conn = null;
		try {
			BoardMusicDao dao = BoardMusicDao.getInstance();
			conn = ConnectionProvider.getConnection();
			rCnt = dao.modifyPost(conn, bmNum, currentPost);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
