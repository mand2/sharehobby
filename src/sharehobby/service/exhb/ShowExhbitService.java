package sharehobby.service.exhb;
/*-------------------
 * 파일이름: ShowExhbitService.java
 * 파일설명: 전시회 게시판 보여주는 Service
 * --> ExhbitListView 모델을 기본으로 하여 해당 페이지에 있는 게시글만 list로 보내줌.  
 * 작성자: 김나연
 * 버전: 2.3.1
 * 생성일자: 2019-07-16 오후 8시 50분
 * 최종수정일자: 2019-07-20 오후 7시 12분
 * 최종수정자: 김나연
 * 최종수정내용: 조상+부모 테이블의 정보를 통한 전시회 정보 가져오기
 * abbr: exhbit
 * -------------------*/

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.exhb.ExhibitionDao;
import sharehobby.model.exhb.BoardExhibition;
import sharehobby.model.exhb.ExhbListView;
import sharehobby.model.exhb.Exhibition;

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
	public BoardExhibition getDetailMsg(int be_num) {
		Connection conn = null;
		BoardExhibition exhb = null;
			
		
		try {
			conn = ConnectionProvider.getConnection();
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			
			exhb = dao.selectMsg(conn, be_num);
			dao.updateHit(conn, be_num);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return exhb;
	}
	
	//게시글의 전시명 list 보여주기
	public List<Exhibition> getListExhbName(){
		List<Exhibition> list = null;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			list = dao.showEnumList(conn);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//게시글의 번호로 전시상세정보 및 전시정보 장소 가져옴
	public BoardExhibition getExhbInfo(int be_num) {
		 Connection conn = null;
		 BoardExhibition exhb = null;
		 
		 try {
			conn = ConnectionProvider.getConnection();
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			exhb = dao.selectExhbInfo(conn, be_num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
		 return exhb;
	}

}
