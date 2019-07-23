package sharehobby.dao.tour;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import jdbc.jdbcUtil;
import sharehobby.model.tour.Board;
import sharehobby.model.tour.Comment;

public class BoardDao {

	
	// 싱글톤 패턴 적용
	private static BoardDao dao = new BoardDao();

	public static BoardDao getInstance() {
		return dao;
	}
	
	private BoardDao() {}
	
	public int insert(Connection conn, Board board, int u_num) {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO BOARD_TOUR (BT_NUM, BT_TITLE,BT_CONT, BT_PHOTO, BT_STAR, BT_TIME, U_NUM, HT_NUM) VALUES (B_TOUR_NUM_SEQ.nextval, ?, ?, ?, ?, sysdate, ?, 1)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getPhoto());
			pstmt.setFloat(4, board.getStar());
			pstmt.setInt(5, u_num);
			
			rCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return rCnt;
	}
	
	public Board select(Connection conn, int pk) {
		
		Board board = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board_tour where BT_NUM=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pk);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				board.setPk(rs.getInt(1));
				board.setStar(rs.getFloat(5));
				board.setContent(rs.getString(6));
				board.setPhoto(rs.getString(7));
				board.setTitle(rs.getString(8));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return board;
	}

	public int selectCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rs = null;
		
		 int totalCnt = 0; //전체게시물의개수 카운트
	      
	      String sql = "select count(*) from BOARD_TOUR";
	      
	      try {
	         stmt = conn.createStatement();
	         rs = stmt.executeQuery(sql);
	         
	         if(rs.next()) {
	            totalCnt = rs.getInt(1);
	         }
		
		/*
		 * int totalCnt = 0;
		 * 
		 * String sql = "select count(*) from guestbook_message";
		 * 
		 * try { stmt = conn.createStatement();
		 * 
		 * rs = stmt.executeQuery(sql);
		 * 
		 * if(rs.next()) { totalCnt = rs.getInt(1); }
		 */
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCnt;
	}

	public List<Board> selectList(Connection conn, int firstRow, int endRow) {

		List<Board> list = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select BT_NUM,BT_TITLE,BT_CONT,BT_STAR,BT_PHOTO,U_ID from ( "
				+ " select rownum rnum, BT_NUM,BT_TITLE,BT_CONT,BT_STAR,BT_PHOTO,U_ID from ( "
				+ " select * from BOARD_TOUR b, MEMBER m where b.u_num=m.u_num order by b.BT_NUM desc "
				+ " ) where rownum <= ? " 
				+ " ) where rnum >= ?";
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, firstRow);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						Board msg = new Board();
						msg.setPk(rs.getInt(1));
						msg.setTitle(rs.getString(2));
						msg.setContent(rs.getString(3));
						msg.setStar(rs.getFloat(4));
						msg.setPhoto(rs.getString(5));
						msg.setU_id(rs.getString(6));
						
						list.add(msg);
						
					}
	
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return list;
	}

	public int deleteBoard(Connection conn, int pk) throws SQLException {
		
		int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from BOARD_TOUR where BT_NUM=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pk);
			
			resultCnt = pstmt.executeUpdate();
			
			
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		return resultCnt;
	}
	
	public int update(Connection conn,int pk, Board board) {
		
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE BOARD_TOUR SET BT_TITLE=?, BT_CONT=?, BT_PHOTO=?, BT_STAR=? WHERE BT_NUM=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(5, pk);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getPhoto());
			pstmt.setFloat(4, board.getStar());
			
			rCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return rCnt;
		
	}
	
	public List<Board> search(Connection conn, String search) {
		
		List<Board> list = new ArrayList<Board>();
		
		Board board = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = "SELECT BT_NUM,BT_TITLE,BT_CONT,BT_STAR,BT_PHOTO "
				+ "FROM BOARD_TOUR WHERE BT_TITLE=? order by BT_NUM desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new Board();
				board.setPk(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setStar(rs.getFloat(4));
				board.setPhoto(rs.getString(5));	
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Board detail(Connection conn, int pk) {
		
		Board board = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = "SELECT b.BT_NUM,b.BT_TITLE,b.BT_CONT,b.BT_STAR,b.BT_PHOTO, m.U_ID "
				+ "FROM BOARD_TOUR b join member m using (u_num) WHERE BT_NUM=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pk);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				board.setPk(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setStar(rs.getFloat(4));
				board.setPhoto(rs.getString(5));
				board.setU_id(rs.getString(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return board;
	}
	
	
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
	
	public int createCommnet(Connection conn, int u_num, int r_num, String comment) {
		
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO BT_COMMENT VALUES (?, ?, ?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			pstmt.setInt(2, u_num);
			pstmt.setString(3, comment);

			rCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return rCnt;
	}
	
	public List<Comment> commentList(Connection conn, int r_num) {
		
		List<Comment> list = new ArrayList<Comment>();

		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = "select u_id,b.b_comment from bt_comment b join member m using (u_num) where bt_num=? order by c_time asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment com = new Comment();
				com.setU_name(rs.getString(1));
				com.setComment(rs.getString(2));	
				list.add(com);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int deleteComment(Connection conn, String comment) throws SQLException {
		
		int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from BT_COMMENT where B_COMMENT=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment);
			
			resultCnt = pstmt.executeUpdate();
			
			
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		return resultCnt;
	}
	
	
}
