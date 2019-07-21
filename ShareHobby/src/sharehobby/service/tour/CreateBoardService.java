package sharehobby.service.tour;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.tour.BoardDao;
import sharehobby.model.tour.Board;

public class CreateBoardService {

	// 만들어진 인스턴스 값을 외부에서 바꾸지 못하도록 private
	private static CreateBoardService service = new CreateBoardService();
	
	// getInstance 클래스 메서드를 통해 service 인스턴스 하나만 받을 수 있음
	public static CreateBoardService getInstance() {
		return service;
	}
	
	// 생성자 제한
	private CreateBoardService() {}
	
	public int write(Board board, int u_num) {
		
		int rCnt = 0;
		
		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메서드 실행
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			BoardDao dao = BoardDao.getInstance();
			
			rCnt = dao.insert(conn, board, u_num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
