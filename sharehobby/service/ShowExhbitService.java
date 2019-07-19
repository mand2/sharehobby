package sharehobby.service;
/*-------------------
 * 파일이름: ShowExhbitService.java
 * 파일설명: 전시회 게시판 보여주는 Service
 * --> ExhbitListView 모델을 기본으로 하여 해당 페이지에 있는 게시글만 list로 보내줌.  
 * 작성자: 김나연
 * 버전: 1.0.0
 * 생성일자: 2019-07-16 오후 8시 50분
 * 최종수정일자: 2019-07-18 오전 2시 12분
 * 최종수정자: 김나연
 * 최종수정내용: 내용 추가
 * abbr: exhbit
 * -------------------*/

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.ExhibitionDao;
import sharehobby.model.BoardExhibition;
import sharehobby.model.ExhbListView;

public class ShowExhbitService {
	/*singleton*/
	private ShowExhbitService() {}
	private static ShowExhbitService service = new ShowExhbitService();
	public static ShowExhbitService getInstance() {
		return service;
	}
	
	//@CNT 페이지당 보여줄 게시글 개수
	final private static int CNT = 4; 
	
	
/*ExhbListView
 * (int msgTotalCnt, 
 * int numPerPage, 
 * int curPageNum, 
 * List<BoardExhibition> msgList, 
 * int first,
 * int last)*/	
	
	public ExhbListView getMsgListView(int curPageNum) {
		Connection conn = null;
		ExhbListView view = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//초기화
			List<BoardExhibition> msgList = null;
			int first = 0;
			int last = 0;
			
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			int msgTotalCnt = dao.selectMsgCnt(conn); //전체게시글수

			if(msgTotalCnt > 0) {
				first = (curPageNum-1) * CNT + 1 ;
				last = first + CNT - 1;
				
				msgList = dao.selectList(conn, first, last);
				
			} else {
				curPageNum = 0;
				msgList = Collections.emptyList();
			}
			
			view = new ExhbListView(msgTotalCnt, CNT, curPageNum, msgList, first, last);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return view;
	}
	
	//클릭한 게시글 보기
	public BoardExhibition getDetailMsg(int num) {
		Connection conn = null;
		BoardExhibition exhb = null;
			
		
		try {
			conn = ConnectionProvider.getConnection();
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			
			exhb = dao.selectMsg(conn, num);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return exhb;
	}
	
	

}
