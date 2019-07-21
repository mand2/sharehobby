package sharehobby.service.tour;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import sharehobby.dao.tour.BoardDao;
import sharehobby.model.tour.Board;
import sharehobby.model.tour.BoardListView;

public class GetBoardListService {

	
	// MessageListView 를 생성해서 결과로 반환
	
	private GetBoardListService() {}
	
	private static GetBoardListService service = new GetBoardListService();
	
	public static GetBoardListService getInstance() {
		return service;		
	}
	
	// 1. 한페이지에 보여줄 게시글의 개수
	private static final int BOARD_COUNT_PER_PAGE = 10;
	
	public BoardListView getBoardListView(int pageNumber) {
		
		// 2. 현재 페이지 번호
		int currentPageNumber = pageNumber;
		
		Connection conn;
		
		BoardListView view = null;
		
		try {
			// Connection
			conn = ConnectionProvider.getConnection();
			
			// DAO
			BoardDao dao = BoardDao.getInstance();
			
			// 전체 게시물의 개수
			int messageTotalCount = dao.selectCount(conn);
			
			// 게시물 내용 리스트, DB 검색에 사용할 start_row, end_row
			List<Board> boardList = null;
			int firstRow = 0;
			int endRow = 0;
			
			
			if(messageTotalCount > 0 ) {
	            firstRow = (pageNumber - 1) * BOARD_COUNT_PER_PAGE ;
	            endRow = BOARD_COUNT_PER_PAGE ;
	            boardList = dao.selectList(conn, firstRow, endRow);
	                  
	         } else {
	            currentPageNumber = 0;
	            boardList = Collections.emptyList();
	         }
			
			/*
			 * if(messageTotalCount > 0) {
			 * 
			 * firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE + 1; 
			 * endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
			 * messageList = dao.selectList(conn, firstRow, endRow);
			 * 
			 * } else { currentPageNumber = 0; messageList = Collections.emptyList(); }
			 */
			
			view = new BoardListView(messageTotalCount, 
										currentPageNumber, 
										boardList, 
										BOARD_COUNT_PER_PAGE, 
										firstRow, 
										endRow);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return view;
	}
}
