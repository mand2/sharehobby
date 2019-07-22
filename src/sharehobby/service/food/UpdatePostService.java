package sharehobby.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.food.FoodPostDao;
import sharehobby.model.food.FoodPost;

public class UpdatePostService {
	private static UpdatePostService service = new UpdatePostService();
	private UpdatePostService() {}
	
	public static UpdatePostService getInstance() {
		return service;
	}
	
	public int updatePost(int bf_num, FoodPost updatePost) {
		int resultCnt = 0;
		Connection conn = null;
		
			try {
				FoodPostDao dao = FoodPostDao.getInstance();
				conn = ConnectionProvider.getConnection();
				
				resultCnt = dao.updatePost(conn, bf_num, updatePost);
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
		return resultCnt;
	}
}
