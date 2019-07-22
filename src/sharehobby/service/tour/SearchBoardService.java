package sharehobby.service.tour;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;
import sharehobby.dao.tour.BoardDao;
import sharehobby.model.tour.Board;

public class SearchBoardService {

	
	private SearchBoardService() {}
	
	private static SearchBoardService service = new SearchBoardService();
	
	public static SearchBoardService getInstance() {
		return service;
	}
	
	public List<Board> search(String search) {
		
		Connection conn;
		
		Board board = new Board();
		
		List<Board> boardList = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			BoardDao dao = BoardDao.getInstance();
			
			
			
			boardList = dao.search(conn,search);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
}
