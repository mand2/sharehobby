package sharehobby.dao.exhb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import sharehobby.model.exhb.BoardComment;

/**
 * 파일이름: ExhbCommentDao.java
 * 파일설명: 게시글의 '댓글'관련 게시판 DAO 
 * 작성자: 김나연
 * 버전: 1.0.2
 * 생성일자: 2019-07-21 오후 1시 57분
 * 최종수정일자: 2019-07-21 오후 1시 57분
 * 최종수정자: 김나연
 * 최종수정내용: 클래스 생성 및 내용 작성 
 */
public class ExhbCommentDao {
	/*싱글턴 처리*/
	
	private ExhbCommentDao() {}
	private static ExhbCommentDao dao = new ExhbCommentDao();
	public static ExhbCommentDao getInstance() {
		return dao;
	}
	
	
	/*댓글 넣기*/
	public int insertComment(Connection conn, String bc_cont, int be_num, int u_num, int bc_parent) {
		int result = 0;

		PreparedStatement pstmt = null;
		
		String sql = "insert into BE_COMMENT (bc_num, bc_cont, be_num, u_num, bc_parent) "
					+ "values (BE_COMMENT_SEQ.NEXTVAL,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* BoardComment comment = new BoardComment(); */
			
			pstmt.setString(1, bc_cont);
			pstmt.setInt(2, be_num);
			pstmt.setInt(3, u_num);
			pstmt.setInt(4, bc_parent);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		
		return result;
	}
	
	
	/*게시판번호에 해당하는 댓글 List로 가져옴 + level 사용*/
	public List<BoardComment> selectComment(Connection conn, int be_num) {
		
		List<BoardComment> list = new ArrayList<BoardComment>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select "
					+ " LEVEL, " 
					+ " bc_num, bc_cont, " 
					+ " u_num, bc_date, bc_parent "
					+ " from BE_COMMENT "
					+ " where be_num = ?"
					+ " START WITH bc_parent = be_num"
					+ " connect by PRIOR bc_num = bc_parent"
					;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, be_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardComment comment = new BoardComment();
				
				comment.setBc_level(rs.getInt(1));
				comment.setBc_num(rs.getInt(2));
				comment.setBc_cont(rs.getString(3));
				
				comment.setU_num(rs.getInt(4));
				comment.setBc_date(rs.getDate(5));
				comment.setBc_parent(rs.getInt(6));
				
				list.add(comment);
			}
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//부모넘버 가져오기
	public BoardComment selectParent(Connection conn, int bc_num) {
		BoardComment comment = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from BE_COMMENT where bc_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bc_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				comment = new BoardComment();
				
				comment.setBc_num(rs.getInt(1));
				comment.setBc_cont(rs.getString(2));
				comment.setBe_num(rs.getInt(3));
				comment.setU_num(rs.getInt(4));
				comment.setBc_date(rs.getDate(5));
				comment.setBc_parent(rs.getInt(6));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return comment;
	}
	
	
	//댓글 삭제
	public int deleteComment(Connection conn, int bc_num) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql = "delete from BE_COMMENT where bc_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bc_num);
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//댓글 변경
	public int updateComment(Connection conn, BoardComment comment, int bc_num) {
		int result = 0;
		
		String sql = "update BE_COMMENT "
					+ " set bc_cont = ? "
					+ " where bc_num = ? ";
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, comment.getBc_cont());
			pstmt.setInt(2, bc_num);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//변경할 댓글 가져오기
	public BoardComment selectOneComment(Connection conn, int bc_num) {
		BoardComment comment = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from BE_COMMENT where bc_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bc_num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				comment = new BoardComment();
				
				comment.setBc_cont(rs.getString(2));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comment;
	}
		
	//전체 댓글 수
	public int selectCnt(Connection conn, int be_num) {
		int cnt = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from BE_COMMENT "
					+ " where be_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, be_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		
		return cnt;
	}
	
}
