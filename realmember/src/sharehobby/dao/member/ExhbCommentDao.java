package sharehobby.dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import sharehobby.model.member.BoardComment;
import sharehobby.model.member.BoardExhibition;

/**
 * �����̸�: ExhbCommentDao.java
 * ���ϼ���: �Խñ��� '���'���� �Խ��� DAO 
 * �ۼ���: �質��
 * ����: 1.0.2
 * ��������: 2019-07-21 ���� 1�� 57��
 * ������������: 2019-07-21 ���� 1�� 57��
 * ����������: �質��
 * ������������: Ŭ���� ���� �� ���� �ۼ� 
 */
public class ExhbCommentDao {
	/*�̱��� ó��*/
	
	private ExhbCommentDao() {}
	private static ExhbCommentDao dao = new ExhbCommentDao();
	public static ExhbCommentDao getInstance() {
		return dao;
	}
	
	
	/*��� �ֱ�*/
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
		}
		
		
		return result;
	}
	
	
	/*�Խ��ǹ�ȣ�� �ش��ϴ� ��� List�� ������ + level ���*/
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
	
	//�θ�ѹ� ��������
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
	
	
	//��� ����
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
	
	//��� ����
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
	
	//������ ��� ��������
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
		
	//��ü ��� ��
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