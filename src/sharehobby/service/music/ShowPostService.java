package sharehobby.service.music;

import java.sql.Connection;
import java.sql.SQLException;

import javax.xml.ws.Response;

import jdbc.ConnectionProvider;
import sharehobby.dao.music.BoardMusicDao;
import sharehobby.model.music.BoardPost;

public class ShowPostService {
	private static ShowPostService service = new ShowPostService();
	private ShowPostService() {}
	
	public static ShowPostService getInstance() {
		return service;
	}
	
	public BoardPost showPost(int bmNum) throws PostNotFoundException {
		BoardPost post = null;
		Connection conn = null;
		try {
			BoardMusicDao dao = BoardMusicDao.getInstance();
			conn = ConnectionProvider.getConnection();
			dao.addViewCnt(conn, bmNum);
			
			post = dao.selectPost(conn, bmNum);
			
			if(post==null) {
				throw new PostNotFoundException("게시글이 존재하지 않습니다.");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return post;
	}
	
}
