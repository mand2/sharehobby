package sharehobby.dao.food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import sharehobby.model.food.FoodPost;
import sharehobby.model.food.FoodStore;

public class FoodPostDao {

	private static FoodPostDao dao = new FoodPostDao();

	public static FoodPostDao getInstance() {
		return dao;
	}

	private FoodPostDao() {
	}

	public int insert(Connection conn, FoodPost food) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "insert into board_food (bf_num, bf_title, bf_star, bf_cont, bf_photo, u_num, hf_num, bf_time) values(b_food_num_seq.nextval,?,?,?,?,?,?,sysdate)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, food.getBf_title());
			pstmt.setFloat(2, food.getBf_star());
			pstmt.setString(3, food.getBf_cont());
			pstmt.setString(4, food.getBf_photo());
			pstmt.setInt(5, food.getU_num());
			pstmt.setInt(6, food.getHf_num());

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

	public FoodPost select(Connection conn, int bf_num) {

		FoodPost food = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select f.bf_num, f.hf_num, m.u_id, f.bf_title, f.bf_star, f.bf_cont, f.bf_time, h.hf_name, h.hf_address, hf_pnum "
				+ "from board_food f, member m, hobby_food h "
				+ "where f.u_num = m.u_num and f.hf_num=h.hf_num and f.bf_num = ?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bf_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 값이 들어있다면 객체생성
				food = new FoodPost();
				food.setBf_num(rs.getInt(1));
				food.setHf_num(rs.getInt(2));
				food.setU_id(rs.getString(3));
				food.setBf_title(rs.getString(4));
				food.setBf_star(rs.getInt(5));
				food.setBf_cont(rs.getString(6));
				food.setBf_time(rs.getDate(7));
				food.setHf_name(rs.getString(8));
				food.setHf_address(rs.getString(9));
				food.setHf_pnum(rs.getString(10));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return food;

	}

	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;

		// 결과가져오는 변수
		int totalCnt = 0;

		String sql = "select count(*) from board_food";

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				totalCnt = rs.getInt(1);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return totalCnt;
	}
	
	// 게시판 리스트
	public List<FoodPost> selectList(Connection conn, int firstRow, int endRow) {

		List<FoodPost> list = new ArrayList<FoodPost>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select f.bf_num, m.u_id, f.bf_title, f.hf_num, f.bf_star, f.bf_cont, f.bf_time from"
				+ " (select u_num,bf_num, bf_title, hf_num, bf_star, bf_cont, bf_time from ( select rownum rnum,u_num, bf_num, bf_title, hf_num, bf_star, bf_cont, bf_time from"
				+ " ( select * from board_food bf ) where rownum <=?) where rnum >= ? order by bf_num asc) f, member m  where f.u_num = m.u_num";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FoodPost foodpost = new FoodPost();
				foodpost.setBf_num(rs.getInt(1));
				foodpost.setU_id(rs.getString(2));
				foodpost.setBf_title(rs.getString(3));
				foodpost.setHf_num(rs.getInt(4));
				foodpost.setBf_star(rs.getInt(5));
				foodpost.setBf_cont(rs.getString(6));
				foodpost.setBf_time(rs.getDate(7));

				list.add(foodpost);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	
	// 게시판 검색시 리스트
	public List<FoodPost> look(Connection conn, String word,int firstRow, int endRow) {
		
		List<FoodPost> look = new ArrayList<FoodPost>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select f.bf_num, m.u_id, f.bf_title, f.hf_num, f.bf_star, f.bf_cont, f.bf_time from "
				+ "(select u_num,bf_num, bf_title, hf_num, bf_star, bf_cont, bf_time from "
				+ "( select rownum rnum,u_num, bf_num, bf_title, hf_num, bf_star, bf_cont, bf_time from"
				+ "( select * from board_food bf ) where rownum <=5) "
				+ "where rnum >= 1 order by bf_num asc) f, member m  where f.u_num = m.u_num and f.bf_title like '%"+word+"%'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FoodPost foodpost = new FoodPost();
				foodpost.setBf_num(rs.getInt(1));
				foodpost.setU_id(rs.getString(2));
				foodpost.setBf_title(rs.getString(3));
				foodpost.setHf_num(rs.getInt(4));
				foodpost.setBf_star(rs.getInt(5));
				foodpost.setBf_cont(rs.getString(6));
				foodpost.setBf_time(rs.getDate(7));

				look.add(foodpost);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return look;
	}
	
	
	
	public FoodPost viewPost(Connection conn, int bmNum) {
		FoodPost foodpost = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select  b.bf_title, m.u_id, b.bf_time, b.bf_star, h.hf_name, h.hf_address, h.hf_pnum, b.bf_star, b.bf_cont, b.bf_photo  "
				+ "from hobby_food h, hf_menu f, board_food b, member m  "
				+ "where m.u_num=b.u_num and h.hf_num=f.hf_num and h.hf_num=b.hf_num and b.bf_num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bmNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				foodpost = new FoodPost();
				foodpost.setBf_title(rs.getString(1));
				foodpost.setU_id(rs.getString(2));
				foodpost.setBf_time(rs.getDate(3));
				foodpost.setBf_star(rs.getFloat(4));
				foodpost.setHf_name(rs.getString(5));
				foodpost.setHf_address(rs.getString(6));
				foodpost.setHf_pnum(rs.getString(7));
				foodpost.setBf_star(rs.getInt(8));
				foodpost.setBf_cont(rs.getString(9));
				foodpost.setBf_photo(rs.getString(10));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return foodpost;
	}
	
	
	public int deletePost(Connection conn, int bf_num) throws SQLException {

		int resultCnt = 0;
		// PreparedStatement 객체 생성
		PreparedStatement pstmt = null;

		String sql = "delete from board_food where bf_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bf_num);

			resultCnt = pstmt.executeUpdate();
		} finally {
			// 어떤 처리(오류가 나던 안나던)가 되어도 실행됨
			JdbcUtil.close(pstmt);
		}

		return resultCnt;
	}

	public int updatePost(Connection conn, int bf_num, FoodPost updatePost) {

		int resultCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "update board_food set Bf_num=?,bf_title=?,bf_star=?,bf_cont=? where bf_num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, updatePost.getHf_num());
			pstmt.setString(2, updatePost.getBf_title());
			pstmt.setFloat(3,updatePost.getBf_star());
			pstmt.setString(4, updatePost.getBf_cont());
			pstmt.setInt(5,bf_num);
			
			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return resultCnt;

	}

	public int find_uNum(Connection conn, String u_id) {

		int u_num = 0; // 회원번호
		ResultSet rs = null;

		PreparedStatement pstmt = null;
		String sql = "select u_num from member where u_id = ?";

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

}
