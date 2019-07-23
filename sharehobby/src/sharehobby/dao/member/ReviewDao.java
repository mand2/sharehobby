package sharehobby.dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sharehobby.model.member.MusicReview;

public class ReviewDao {
	private static ReviewDao dao = new ReviewDao();

	public static ReviewDao getInstance() {
		return dao;
	}

	private ReviewDao() {
	}
	// ΩÃ±€≈Ê

	// ¿Ωæ« ¥Ò±€∫∏±‚
	public MusicReview show(Connection conn, String u_id) {
		MusicReview musicreview = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberDao dao = MemberDao.getInstance();
		int u_num = dao.find_uNum(conn, u_id);

		String sql = "select bm_title, bm_time, m.u_id, bm_cnt, bm_like, bm_star, bm_cont from member m, board_music c where c.u_num = m.u_num and c.u_num = ? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				MusicReview music = new MusicReview();
				music.getBmTitle();
				music.getBmTime();
				music.getuId();
				music.getBmCnt();
				music.getBmLike();
				music.getBmStar();
				music.getBmCont();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return musicreview;

	}

}
