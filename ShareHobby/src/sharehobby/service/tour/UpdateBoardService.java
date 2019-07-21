package sharehobby.service.tour;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;
import sharehobby.dao.tour.BoardDao;
import sharehobby.model.tour.Board;

public class UpdateBoardService {

	
	private UpdateBoardService() {}
	
	private static UpdateBoardService service = new UpdateBoardService();
	
	public static UpdateBoardService getInstance() {
		return service;
	}
	
	public Board updateView(int pk) throws BoardNotFoundException {
		
		int resultCnt = 0;
		
		Connection conn = null;
		
		Board select = new Board();
		
			try {
				conn = ConnectionProvider.getConnection();
				
				BoardDao dao = BoardDao.getInstance();
				
				select = dao.select(conn, pk);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		return select;
	}
	
	public int updateBoard(int pk, Board board) throws SQLException {
		
		int rCnt = 0;

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			// 트랜잭션 처리
			conn.setAutoCommit(false);

			BoardDao dao = BoardDao.getInstance();

			rCnt = dao.update(conn, pk, board);

			conn.commit();

		} catch (SQLException e) {
			// 트랜잭션의 롤백
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;

		}


		return rCnt;

	}
	
}
