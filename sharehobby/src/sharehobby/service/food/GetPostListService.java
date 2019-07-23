package sharehobby.service.food;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import sharehobby.dao.food.FoodPostDao;
import sharehobby.model.food.FoodPost;
import sharehobby.model.food.FoodPostList;

public class GetPostListService {
	
	private GetPostListService() {}
	
	private static GetPostListService service = new GetPostListService();
	
	public static GetPostListService getInstance() {
		return service;
	}
	
	//1. 한페이지에 보여줄 게시글의 개수
	private static final int POST_COUNT_PER_PAGE = 10;
	
	public FoodPostList getPostListView(int pageNumber) {
		
		int currentPageNumber = pageNumber;
		
		Connection conn;
		
		FoodPostList view = null;
		
		try {
			// Connection
			conn = ConnectionProvider.getConnection();
			
			//DAO
			FoodPostDao dao = FoodPostDao.getInstance();
			
			//전체 게시물의 개수
			int postTotalCount = dao.selectCount(conn);
			
			//게시물 내용 리스트, DB 검색에 사용할 start_row, end_row 구하기
			List<FoodPost> postList = null;
			int firstRow = 0;
			int endRow = 0;
			
			if(postTotalCount > 0) {
				//있다면
				firstRow = (pageNumber-1)* POST_COUNT_PER_PAGE + 1;
				endRow = firstRow + POST_COUNT_PER_PAGE -1;
				
				postList = dao.selectList(conn, firstRow, endRow);
			}else {
				//0일때
				currentPageNumber = 0;
				postList = Collections.emptyList();
			}
			view = new FoodPostList(postTotalCount, currentPageNumber, postList, POST_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return view;
	}

}
