package sharehobby.service.music;

import java.sql.Connection;
import java.sql.SQLException;

import javax.xml.ws.Response;

import jdbc.ConnectionProvider;
import sharehobby.dao.music.BoardMusicDao;
import sharehobby.model.music.BoardPost;

public class ShowMusicInfoService {
	private static ShowMusicInfoService service = new ShowMusicInfoService();
	private ShowMusicInfoService() {}
	
	public static ShowMusicInfoService getInstance() {
		return service;
	}
	
	public BoardPost selectMusic(int hmNum)  {
		BoardPost music = null;
		Connection conn = null;
		try {
			BoardMusicDao dao = BoardMusicDao.getInstance();
			conn = ConnectionProvider.getConnection();
			
			music = dao.selectMusic(conn, hmNum);
			
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return music;
	}
	
}
