package sharehobby.dao.music;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import sharehobby.model.music.LoginInfo;
import sharehobby.model.music.MemberInfo;


public class MemberDao {
	/* 싱글톤 처리 */
	private static MemberDao dao = new MemberDao();

	public static MemberDao getInstance() {
		return dao;
	}

	private MemberDao() {
	};

	//회원가입
	public int insert(Connection conn, MemberInfo memberInfo) {
		PreparedStatement pstmt = null;
		int rCnt = 0;

		String sql = "insert into member values (member_unum_seq.nextval, ?, ?, ?, ?, ?)";

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
	
	//회원정보 보기
	public MemberInfo select(Connection conn,LoginInfo loginInfo) {
		MemberInfo memberInfo = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		
		String sql = "select * from member where u_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginInfo.getU_id());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberInfo = new MemberInfo();
				memberInfo.setU_num(rs.getInt(1));
				memberInfo.setU_id(rs.getString(2));
				memberInfo.setU_name(rs.getString(3));
				memberInfo.setU_pw(rs.getString(4));
				memberInfo.setU_pnum(rs.getString(5));
				memberInfo.setU_photo(rs.getString(6));
				
			};
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return memberInfo;
	}

}
