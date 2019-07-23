package sharehobby.dao.exhb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import sharehobby.model.exhb.BoardExhibition;
import sharehobby.model.exhb.Exhibition;
import sharehobby.model.member.MemberInfo;

/*-------------------
 * 파일이름: ExhibitionDao.java
 * 파일설명: 전시관련 게시판 DAO 
 * 작성자: 김나연
 * 버전: 2.0.1
 * 생성일자: 2019-07-16 오후 8시 37분
 * 최종수정일자: 2019-07-19 오후 5시 27분
 * 최종수정자: 김나연
 * 최종수정내용: 아이디로 게시판 검색기능 추가 
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
		String sql = "insert into BOARD_EXHB (BE_NUM, U_NUM, HE_NUM, BE_TITLE, BE_STAR, BE_CONT, BE_PHOTO) "
					+"values (B_EXHB_NUM_SEQ.NEXTVAL,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			//1,2는 변경처리필요
			pstmt.setInt(1, exhbit.getU_num());
			pstmt.setInt(2, exhbit.getHe_num());
			
			pstmt.setString(3, exhbit.getBe_title());
			pstmt.setFloat(4, exhbit.getBe_star());
			pstmt.setString(5, exhbit.getBe_cont());
			
			pstmt.setString(6, exhbit.getBe_photo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	//전시코드를 통해 전시명을 알기-글 입력/수정시 드랍박스에 나오게.
	public List<Exhibition> showEnumList(Connection conn){
		List<Exhibition> list = new ArrayList<Exhibition>();
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from HOBBY_EXHB order by he_num";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
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
			
		}
		
		return list;
	}
	
	//게시판번호를 통해 해당 전시상세정보 및 전시장소정보 가져오기
	public BoardExhibition selectExhbInfo(Connection conn, int be_num) {
		BoardExhibition exhb = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select be_num, he_num, "
					+ " he_name, he_artist, he_cont, he_theme, "
					+ " e_num, e_name, e_address, e_pnum "
					+ " from board_exhb "
					+ " inner join hobby_exhb "
					+ " using (he_num) "
					+ " inner join he_place "
					+ " using (e_num) "
					+ " where be_num = ?"
					;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, be_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				exhb = new BoardExhibition();
				
				exhb.setBe_num(rs.getInt(1));
				exhb.setHe_num(rs.getInt(2));
				
				exhb.setHe_name(rs.getString(3));
				exhb.setHe_artist(rs.getString(4));
				exhb.setHe_cont(rs.getString(5));
				exhb.setHe_theme(rs.getString(6));
				
				exhb.setE_num(rs.getInt(7));
				exhb.setE_name(rs.getString(8));
				exhb.setE_address(rs.getString(9));
				exhb.setE_pnum(rs.getString(10));
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return exhb;
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
		
		String sql = "select be_num, u_num, he_num, be_title, be_time, be_star, BE_CONT, BE_PHOTO, be_hit from ( "
				+ " select rownum rnum, be_num, u_num, he_num, be_title, be_time, be_star, BE_CONT, BE_PHOTO, be_hit from ( "
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
				exhb.setBe_hit(rs.getInt(9));
				
				list.add(exhb);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
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
				exhb.setBe_hit(rs.getInt(9));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return exhb;
	}//selectMsg()
	
	//메세지 삭제
	public int deleteMsg(Connection conn, int be_num) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql = "delete from board_exhb where be_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, be_num);
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//메세지 변경
	public int updateMsg(Connection conn, BoardExhibition exhbit, int be_num) {
		int result = 0;
		
		String sql = "update board_exhb "
				   + " set HE_NUM = ? , "
				   + " BE_TITLE = ? , "
				   + " BE_STAR = ? , "
				   + " BE_CONT = ? , "
				   + " BE_PHOTO = ? "
				   + " where be_num = ? ";
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(6, be_num);
			pstmt.setInt(1, exhbit.getHe_num());
			pstmt.setString(2, exhbit.getBe_title());
			pstmt.setFloat(3, exhbit.getBe_star());
			pstmt.setString(4, exhbit.getBe_cont());
			pstmt.setString(5, exhbit.getBe_photo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	/*게시판 검색 : 전체보여주기
	 * @opt: 옵션*/
		public List<BoardExhibition> selectSearchList(Connection conn, int opt, String condition){
			
			List<BoardExhibition> list = new ArrayList<BoardExhibition>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;

			//제목검색
			if(opt == 1) {
				sql = "select * from BOARD_EXHB "
							+ " where be_title like ?"
							+ " order by be_num desc";
			}
			//내용검색
			else if(opt == 2) {
				sql = "select * from BOARD_EXHB "
						+ " where be_cont like ?"
						+ " order by be_num desc";
			}
			//제목+내용검색
			else if(opt == 3) {
				sql = "select * from BOARD_EXHB "
						+ " where be_title like ? or "
						+ " where be_cont like ? "
						+ " order by be_num desc";
			}
			
			try {
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, "%"+condition+"%");
				
				if(opt == 3) pstmt.setString(2, "%"+condition+"%"); //제목내용검색일때만 세팅
				
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
					exhb.setBe_hit(rs.getInt(9));
					
					list.add(exhb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return list;
		}//selectSearchList()
		
		

	/*게시판 검색 : 결과몇개인지 보여주기
	 * @opt: 옵션*/
	public int selecSearchCnt(Connection conn, int opt, String condition) {
		int cnt = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;

		//제목검색
		if(opt == 1) {
			sql = "select count(*) from BOARD_EXHB "
						+ " where be_title like ? "
						+ " order by be_num ";
		}
		//내용검색
		else if(opt == 2) {
			sql = "select count(*) from BOARD_EXHB "
					+ " where be_cont like ? "
					+ " order by be_num ";
		}
		//제목+내용검색
		else if(opt == 3) {
			sql = "select count(*) from BOARD_EXHB "
					+ " where be_title like ? or "
					+ " where be_cont like ? "
					+ " order by be_num ";
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+condition+"%");
			
			if(opt == 3) pstmt.setString(2, "%"+condition+"%"); //제목내용검색일때만 세팅
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
	//조회수 처리
	public void updateHit(Connection conn, int be_num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "update BOARD_EXHB set BE_HIT = BE_HIT + 1 "
					+ " where be_num = ?"
				;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, be_num);
			rs = pstmt.executeQuery();

			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
		
}
