package sharehobby.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.food.FoodPostDao;
import sharehobby.model.food.FoodPost;

public class ViewPostService {
	private static ViewPostService service = new ViewPostService();
	private ViewPostService() {}
	
	public static ViewPostService getInstance() {
		return service;
	}
	
	public FoodPost viewPost(int bf_num) {
		FoodPost foodpost = null;
		Connection conn = null;
		try {
			FoodPostDao dao = FoodPostDao.getInstance();
			conn = ConnectionProvider.getConnection();
			
			foodpost = dao.select(conn, bf_num);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return foodpost;
	}
}
