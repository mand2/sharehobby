package sharehobby.service.food;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.food.FoodPostDao;
import sharehobby.model.food.FoodPost;

public class WritePostService {
	
	private static WritePostService service = new WritePostService();
	
	public static WritePostService getInstance() {
		return service;
	}
	
	public int write(FoodPost foodpost) {
		int rCnt = 0;
		
		//1. Connection 생성
		//2. dao 생성
		//3. insert 메서드 시랭
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			FoodPostDao dao = FoodPostDao.getInstance();
			
			rCnt = dao.insert(conn, foodpost);
			
		} catch (SQLException e) {                                                                                                                                                                                
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return rCnt;
		
	}
}
	