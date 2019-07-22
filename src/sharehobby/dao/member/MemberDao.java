package sharehobby.dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.mysql.cj.protocol.Resultset;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.model.member.LoginInfo;
import sharehobby.model.member.MemberInfo;

public class MemberDao {
	/* �떛湲��넠 泥섎━ */
	private static MemberDao dao = new MemberDao();

	public static MemberDao getInstance() {
		return dao;
	}

	private MemberDao() {
	};

	public int find_uNum(Connection conn, String u_id) {

		int u_num = 0; 
		ResultSet rs = null;

		PreparedStatement pstmt = null;
		
		String sql = "select u_num from member where u_id = ?";
		//String sql = "select u_num from project.member where u_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				u_num = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return u_num;
	}

	// 회원가입
	public int insert(Connection conn, MemberInfo memberInfo) {
		PreparedStatement pstmt = null;
		int rCnt = 0;

		String sql = "insert into member values (member_unum_seq.nextval, ?, ?, ?, ?, ?)";
		//String sql = "insert into project.member (u_num, u_id,u_name, u_pw, u_pnum, u_photo) values (null, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberInfo.getU_id());
			pstmt.setString(2, memberInfo.getU_name());
			pstmt.setString(3, memberInfo.getU_pw());
			pstmt.setString(4, memberInfo.getU_pnum());
			pstmt.setString(5, memberInfo.getU_photo());

			rCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rCnt;

	}

	// 로그인 체크
	public int loginChk(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpw = ""; // db에서 가져올 비밀번호
		int chk = -1;

		String sql = "select u_pw from member where u_id = ?";
		//String sql = "select u_pw from project.member where u_id = ?";

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpw = rs.getString("u_pw");

				if (dbpw.equals(pw)) {
					chk = 1; // 아이디 비밀번호 일치
				} else {
					chk = 0; // 비밀번호 다름
				}
			} else {
				chk = -1; // 회원 x
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
	}

	// 회원정보
	public MemberInfo select(int u_num) {
		MemberInfo memberInfo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where u_num = ? order by u_num";
		//String sql = "select * from project.member where u_num = ? order by u_num";
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberInfo = new MemberInfo();
				memberInfo.setU_num(rs.getInt(1));
				memberInfo.setU_id(rs.getString(2));
				memberInfo.setU_name(rs.getString(3));
				memberInfo.setU_pw(rs.getString(4));
				memberInfo.setU_pnum(rs.getString(5));
				memberInfo.setU_photo(rs.getString(6));
				
				rs = pstmt.executeQuery();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberInfo;
	}
	
	//회원정보 수정
	public int updateMember(MemberInfo memberInfo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int chk=0;
		
		String sql = "update member "
				+ "set u_name = ?, u_pw = ?, u_pum = ?, u_photo = ?  where u_num =?";
		//String sql = "update project.member "
				//+ "set u_name = ?, u_pw = ?, u_pum = ?, u_photo = ?  where u_num =?";
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(5, memberInfo.getU_num());
			
			pstmt.setString(1, memberInfo.getU_name());
			pstmt.setString(2, memberInfo.getU_pw());
			pstmt.setString(3, memberInfo.getU_pnum());
			pstmt.setString(4, memberInfo.getU_photo());
			
			chk = pstmt.executeUpdate();
			
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
			
	}
	
	//회원 삭제  rCnt 왜 안대..  
	public int deleteMember(int num, String pw) throws SQLException {
		// preparedStatement 媛앹껜 �깮�꽦
		int chk = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		String dbpw = "";
		
		String sql1 = "select u_pw from member where u_num = ? ";
		String sql2 = "delete from member where u_num = ? ";
		
		/*
		 * String sql1 = "select u_pw from project.member where u_num = ? "; String sql2
		 * = "delete from project.member where u_num = ? ";
		 */

		try {
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpw = rs.getString("u_pw");
				if(dbpw.equals(pw)) {
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					conn.commit();
					chk=1;
				}else {
					chk=0;
				}
				
			}

		} finally {
			JdbcUtil.close(pstmt);
		}
		return chk;
	}
}