package sharehobby.service.tour;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.tour.BoardDao;
import sharehobby.model.tour.Board;

public class DetailBoardService {

	
	private DetailBoardService() {};
	
	private static DetailBoardService service = new DetailBoardService();
	
	public static DetailBoardService getInstance() {
		return service;
	}
	
	public Board detail(int pk) {
		
		Connection conn = null;
		
		Board board = new Board();
		
		try {
			conn = ConnectionProvider.getConnection();
			
			BoardDao dao = BoardDao.getInstance();
			
			board = dao.detail(conn,pk);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return board;
	}
	
}
