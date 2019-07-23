package sharehobby.service.music;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import sharehobby.dao.music.BoardMusicDao;
import sharehobby.model.music.BoardMusicList;
import sharehobby.model.music.BoardPost;

// 게시글 리스트 출력하는 service class

public class BoardMusicListService {
	
	private static BoardMusicListService service = new BoardMusicListService();
	private BoardMusicListService() {}
	
	public static BoardMusicListService getInstance() {
		return service;
	}
	
	
	// 한 페이지당 보여줄 게시글 갯수 = 10
	
	private static final int POST_COUNT_PER_PAGE = 10;
	public BoardMusicList getBoardMusicListService(int pageNumber) {
		
		// 현재 페이지 번호 : 
		// jsp로부터 받은 pageNumber 값을 대입해서 처리함.
		int currentPageNumber = pageNumber;
		Connection conn;
		
		BoardMusicList view = null;
		
		try {
			BoardMusicDao dao = BoardMusicDao.getInstance();
			conn = ConnectionProvider.getConnection();
			
			int rCnt = dao.selectCount(conn);
			
			List<BoardPost> boardList = null;
			int startRow = 0;
			int endRow = 0;
			
			if(rCnt>0) {
				startRow = (pageNumber - 1) * POST_COUNT_PER_PAGE + 1;
				endRow = startRow + POST_COUNT_PER_PAGE -1;
				
				boardList = dao.selectPost(conn, startRow, endRow);
			} else {
				currentPageNumber = 0;
				boardList = Collections.emptyList();
			}
			
			view = new BoardMusicList(rCnt, currentPageNumber, boardList,
					POST_COUNT_PER_PAGE, startRow, endRow);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return view;
	}
	
}
