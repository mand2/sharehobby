package sharehobby.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.BoardMusicDao;
import sharehobby.model.BoardPost;

public class ModifyPostService {
	private static ModifyPostService service = new ModifyPostService();
	private ModifyPostService() {}
	
	public static ModifyPostService getInstance() {
		return service;
	}
	
	public int modifyPost(int bmNum, BoardPost post) {
		int rCnt = 0;
		Connection conn = null;
		try {
			BoardMusicDao dao = BoardMusicDao.getInstance();
			conn = ConnectionProvider.getConnection();
			
			rCnt = dao.modifyPost(conn, bmNum, post);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
