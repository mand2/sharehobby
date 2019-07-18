package sharehobby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import sharehobby.model.BoardExhibition;
import sharehobby.model.Exhibition;
import sharehobby.model.MemberInfo;

/*-------------------
 * 파일이름: ExhibitionDao.java
 * 파일설명: 전시관련 게시판 DAO 
 * 작성자: 김나연
 * 버전: 1.0.2
 * 생성일자: 2019-07-16 오후 8시 37분
 * 최종수정일자: 2019-07-17 오후 11시 40분
 * 최종수정자: 김나연
 * 최종수정내용: 아이디로 회원코드 추출 메서드 추가 
 * insertMessgae>>요구사항: 연결될 객체인 member와 Hobby_exhibiton 사용해서 변경처리필요
 * abbr: exhbit / exhb
 * -------------------*/
public class ExhibitionDao {
	
	/* 싱글턴처리 */
	private static ExhibitionDao dao = new ExhibitionDao();
	private ExhibitionDao() {}
	public static ExhibitionDao getInstance() {
		return dao;
	}
	
	/*메세지넣기*/
	public int insertMessage(Connection conn, BoardExhibition exhbit) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		//게시글,회원번호,전시코드,제목,평점,내용
		String sql = "insert into BOARD_EXHB (BE_NUM, U_NUM, HE_NUM, BE_TITLE, BE_STAR, BE_CONT) "
					+"values (B_EXHB_NUM_SEQ.NEXTVAL,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			//1,2는 변경처리필요
			pstmt.setInt(1, exhbit.getU_num());
			pstmt.setInt(2, exhbit.getHe_num());
			
			pstmt.setString(3, exhbit.getBe_title());
			pstmt.setFloat(4, exhbit.getBe_star());
			pstmt.setString(5, exhbit.getBe_cont());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		
		return result;
	}
	
	
	//전시코드를 통해 전시명을 알기
	public List<Exhibition> showEnumList(Connection conn){
		List<Exhibition> list = new ArrayList<Exhibition>();
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from HOBBY_EXHB order by e_num";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				Exhibition exhbit = new Exhibition();
				
				
				exhbit.setHe_num(rs.getInt(1));
				exhbit.setE_num(rs.getInt(2));
				exhbit.setHe_name(rs.getString(3));
				exhbit.setHe_artist(rs.getString(4));
				exhbit.setHe_cont(rs.getString(5));
				exhbit.setHe_theme(rs.getString(6));
				
				list.add(exhbit);
				
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
		return list;
	}
	
	
	
	//세션에 저장된 member의 u_id를 통하여 u_num가져오기 
	public int find_uNum(Connection conn, String u_id) {
		
		int u_num = 0; //가져올 회원번호
		ResultSet rs = null;
		
		PreparedStatement pstmt = null;
		String sql = "select u_num from member where u_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				u_num = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return u_num;
	}
	
	//게시판에 올라온 전체 글 수 카운트
	public int selectMsgCnt(Connection conn) {
		int cnt = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from BOARD_EXHB";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		
		return cnt;
	}
	
	
	//게시판잘라서 리스트로 반환해주는 메서드
	public List<BoardExhibition> selectList(Connection conn, int first, int last){
		
		List<BoardExhibition> list = new ArrayList<BoardExhibition>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select be_num, u_num, he_num, be_title, be_time, be_star, BE_CONT, BE_PHOTO from ( "
				+ " select rownum rnum, be_num, u_num, he_num, be_title, be_time, be_star, BE_CONT, BE_PHOTO from ( "
				+ " select * from BOARD_EXHB b order by b.BE_NUM desc "
				+ " ) where rownum <= ? " 
				+ " ) where rnum >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, last);
			pstmt.setInt(2, first);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardExhibition exhb = new BoardExhibition();
				
				exhb.setBe_num(rs.getInt(1));
				exhb.setU_num(rs.getInt(2));
				exhb.setHe_num(rs.getInt(3));
				exhb.setBe_title(rs.getString(4));
				exhb.setBe_time(rs.getDate(5));
				exhb.setBe_star(rs.getFloat(6));
				exhb.setBe_cont(rs.getString(7));
				
				list.add(exhb);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return list;
	}//selectList()
	
	
	//클릭한 게시글 보기
	public BoardExhibition selectMsg(Connection conn, int be_num) {
		BoardExhibition exhb = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board_exhb where be_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, be_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				exhb = new BoardExhibition();
				exhb.setBe_num(rs.getInt(1));
				exhb.setU_num(rs.getInt(2));
				exhb.setHe_num(rs.getInt(3));
				exhb.setBe_title(rs.getString(4));
				exhb.setBe_time(rs.getDate(5));
				exhb.setBe_star(rs.getFloat(6));
				exhb.setBe_cont(rs.getString(7));
				exhb.setBe_photo(rs.getString(8));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return exhb;
	}//selectMsg()
	
	
}
