package sharehobby.service.exhb;

/*-------------------
 * 파일이름: AlterExhbitService.java
 * 파일설명: 전시회 게시판 검색 Service
 * --> 게시판 검색과 검색 개수 보여줌  
 * 작성자: 김나연
 * 버전: 1.1.0
 * 생성일자: 2019-07-19 오후 4시 14분
 * 최종수정일자: 2019-07-19 오후 4시 14분
 * 최종수정자: 김나연
 * 최종수정내용: 내용 추가
 * abbr: exhbit
 * -------------------*/
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import sharehobby.dao.exhb.ExhibitionDao;
import sharehobby.model.exhb.BoardExhibition;

public class SearchMsgService {
	
	private SearchMsgService() {};
	private static SearchMsgService service = new SearchMsgService();
	public static SearchMsgService getInstance() {
		return service;
	}
	
	public List<BoardExhibition> searchMsg(int opt, String condition){
		List<BoardExhibition> list = new ArrayList<BoardExhibition>();
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			list = dao.selectSearchList(conn, opt, condition);
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public int searchCnt(int opt, String condition) {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
		
			ExhibitionDao dao = ExhibitionDao.getInstance();
			
			result = dao.selecSearchCnt(conn, opt, condition);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
}
