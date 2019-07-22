package sharehobby.service.music;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.music.BoardMusicDao;
public class AddLikeService {
	private AddLikeService() {};
	private static AddLikeService service = new AddLikeService();
	
	public static AddLikeService getInstance() {
		return service;
	}
	
	
	public int addLike(int uNum,int bmNum) {
		int likeChk = 0;
		Connection conn;
		try {
			conn = ConnectionProvider.getConnection();
			BoardMusicDao dao = BoardMusicDao.getInstance();
			likeChk = dao.addLike(conn, bmNum, uNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return likeChk;
	}
}
