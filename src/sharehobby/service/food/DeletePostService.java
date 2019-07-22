package sharehobby.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.food.FoodPostDao;
import sharehobby.model.food.FoodPost;

public class DeletePostService {
	
	private DeletePostService() {}
	
	private static DeletePostService service = new DeletePostService();
	
	public static DeletePostService getInstance() {
		return service;
	}
	
	public int deletePost(int bmNum) throws PostNotFoundException {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();

			// 트랜잭션 처리
			conn.setAutoCommit(false);

			FoodPostDao dao = FoodPostDao.getInstance();
			FoodPost foodpost = new FoodPost();

			if(foodpost != null) {
				rCnt = dao.deletePost(conn, bmNum);
			} else { 
				throw new PostNotFoundException("게시글이 존재하지 않습니다. : " + bmNum);
			}
			// 정상 처리
			conn.commit();
		} catch (SQLException e) {
			// .rollback() : conn이 null값이 아니라면 rollback처리 할거임.
			// null값이 들어간다면 굳이 rollback할 거리도 없기 때문에 안해도됨 null예외 웅앵으로 넘어갈것임
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		} 
		return rCnt;
	}

}
