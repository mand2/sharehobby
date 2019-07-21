package sharehobby.service.tour;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;
import sharehobby.dao.tour.BoardDao;
import sharehobby.model.tour.Board;

public class DeleteBoardService {

 	private DeleteBoardService() {}
	
	private static DeleteBoardService service = new DeleteBoardService();
		
	public static DeleteBoardService getInstance() {
		return service;
	}

	public int deleteBoard(int pk) throws SQLException, BoardNotFoundException {
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			
			
			// Message Dao 필요
			BoardDao dao = BoardDao.getInstance();
			
			// 1. 전달받은 게시물 아이디로 게시물 확인
			Board board = dao.select(conn, pk);
			
			// 2. 게시물이 존재 하지 않으면 예외 처리
			if(board == null) {
				throw new BoardNotFoundException("메시지가 존재하지 않습니다. : " + pk);
			}
			
//			// 3. 게시물이 존재 하면 비밀번호 확인 -> 사용자가 입력한 비밀번호와 비교
//			// 4. 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린경우 예외처리
//			if(!board.hasPassword()) {
//				throw new InvalidBoardPasswordException("비밀번호가 일치하지 않습니다.");
//			}
//			
//			// 비밀번호 비교
//			if(!board.matchPassword(password)) {
//				throw new InvalidBoardPasswordException("비밀번호가 일치하지 않습니다.");
//			}
			
			// 5. 비밀번호가 일치하면 정상 처리(삭제) -> commit
			
			resultCnt = dao.deleteBoard(conn, pk);
			
			// 정상 처리
			conn.commit();
			
			
		} catch (SQLException e) {
			// 트랜잭션의 롤백
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
			
		} catch (BoardNotFoundException e) {
			// 트랜잭션의 롤백
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}	
//		 catch (InvalidBoardPasswordException e) {
//			// 트랜잭션의 롤백
//			jdbcUtil.rollback(conn);
//			e.printStackTrace();
//			throw e;
//		}
		
		return resultCnt;
		
	}
}
