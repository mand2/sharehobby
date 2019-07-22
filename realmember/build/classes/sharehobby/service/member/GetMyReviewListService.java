package sharehobby.service.member;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.member.ReviewDao;
import sharehobby.model.member.MyReviewListView;

public class GetMyReviewListService {
	private static GetMyReviewListService service = new GetMyReviewListService();

	public static GetMyReviewListService getInstance() {
		return service;
	}

	private GetMyReviewListService() {}
	
	private static final int MYREVIEW_COUNT_PER_PAGE = 3;
	
	public MyReviewListView getMyReviewListView(int pageNumber) {
		int currentPageNumber = pageNumber;
		
		Connection conn;
		
		MyReviewListView view = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			ReviewDao dao = ReviewDao.getInstance();
			//dao.show(conn, u_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
