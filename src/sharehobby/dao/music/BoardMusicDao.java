package sharehobby.dao.music;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;
import sharehobby.model.music.AlbumInfo;
import sharehobby.model.music.BoardPost;
import sharehobby.model.music.MusicInfo;

public class BoardMusicDao {
	
	private static BoardMusicDao dao = new BoardMusicDao();
	private BoardMusicDao() {}
	
	public static BoardMusicDao getInstance() {
		return dao;
	}
	
	// 요청받은 입력값 insert
	public int insertPost(Connection conn, BoardPost post) {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "insert into board_music "
				+ "(bm_num,u_num,hm_num,bm_title,bm_star,bm_cont,bm_time,bm_cnt)"
				+ "values(bm_num_seq.nextval,?,?,?,?,?,sysdate,0)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post.getuNum());
			pstmt.setInt(2, post.getHmNum());
			pstmt.setString(3,post.getBmTitle());
			pstmt.setFloat(4, post.getBmStar());
			pstmt.setString(5,post.getBmCont());
			rCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return rCnt;
	}
	
	// 조회수 추가
		public void addViewCnt(Connection conn, int bmNum) {
			PreparedStatement pstmt = null;
			
			String sql = "update board_music set bm_cnt = bm_cnt+1 where bm_num =?";
			
			try {
				BoardPost post = new BoardPost();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,bmNum);
				
				pstmt.executeQuery();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
				
			}
			
			
		}
		
		
		//게시글 좋아요 유저 확인
		// 좋아요 한 적 있으면 1
		// 없으면 0
		public int chkUserLike(Connection conn, int uNum) {
			System.out.println(uNum);
			int chk = 0;
			ResultSet rs = null;
			
			PreparedStatement pstmt = null;
			String sql = "select count(*) from bm_like where u_num = ?";
			
			try {
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, uNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					chk = 1;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				try {
					rs.close();
					pstmt.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
			return chk;
			
		}
		
	// 게시글 좋아요
		public int insertLike(Connection conn, int bmNum,int uNum) {
			int likeChk = 0;
			PreparedStatement pstmt = null;
			String sql = "insert into bm_like values(1,?,?)";
			try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bmNum);
			pstmt.setInt(2,uNum);
			
			pstmt.executeQuery();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
				
			}
			return likeChk = 1;
		}
		
		public int updateLike(Connection conn, int bmNum, int uNum) {
			int likeChk = 0;
			PreparedStatement pstmt = null;
			String sql = "delete bm_like where bm_num = ? and u_num=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,bmNum);
				pstmt.setInt(2,uNum);
				pstmt.executeQuery();

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
					} catch(SQLException e) {
						e.printStackTrace();
					}
					
				}
				return likeChk = 0;
		}
		
		// 게시글 좋아요 수 count
		public int countLike(Connection conn, int bmNum) {
			int cntLike = 0;
			ResultSet rs = null;
			
			PreparedStatement pstmt = null;
			String sql = "select count(*) from bm_like where bm_num = ?";
			
			try {
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bmNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					cntLike = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				try {
					rs.close();
					pstmt.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
			return cntLike;
			
		}
		
		
		
	// 리스트 상세보기 select
	public BoardPost selectPost(Connection conn, int bmNum) {
		BoardPost post = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select b.bm_num,h.hm_num, b.bm_title, m.u_id, b.bm_star, a.m_name,a.m_photo, b.bm_cont, b.bm_time, b.bm_cnt, h.hm_title, a.m_singer,a.m_genre, h.hm_lyc from hm_album a, hobby_music h, board_music b,member m where b.u_num = m.u_num and a.hm_num=h.hm_num2 and h.hm_num=b.hm_num and b.bm_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bmNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				post = new BoardPost();
				post.setBmNum(rs.getInt(1));
				post.setHmNum(rs.getInt(2));
				post.setBmTitle(rs.getString(3));
				post.setuId(rs.getString(4));
				post.setBmStar(rs.getFloat(5));
				post.setmName(rs.getString(6));
				post.setmPhoto(rs.getString(7));
				post.setBmCont(rs.getString(8));
				post.setBmTime(rs.getDate(9));
				post.setBmCnt(rs.getInt(10));
				post.setHmTitle(rs.getString(11));
				post.setmSinger(rs.getString(12));
				post.setmGenre(rs.getString(13));
				post.setHmLyc(rs.getString(14));
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
		
		return post;
	}
	
	// 게시글 검색 select
	public BoardPost select(Connection conn, int bmNum) {
		BoardPost post = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "select bm_num, hm_num, u_id, bm_title, bm_star,bm_cont,bm_time "
				+ "from board_music b,member m "
				+ "where b.u_num = m.u_num and bm_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bmNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				post = new BoardPost();
				post.setBmNum(rs.getInt(1));
				post.setHmNum(rs.getInt(2));
				post.setuId(rs.getString(3));
				post.setBmTitle(rs.getString(4));
				post.setBmStar(rs.getFloat(5));
				post.setBmCont(rs.getString(6));
				post.setBmTime(rs.getDate(7));

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
		
		return post;
	}
	
	// 전체 게시글 갯수 반환 메소드
	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int totalCnt =0;
		
		String sql = "select count(*) from board_music";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				totalCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return totalCnt;
		
	}
	
	// 전체 내용 출력용
	
	
	// 게시판 리스트 출력용
	public List<BoardPost> selectPost(Connection conn, int startRow, int endRow) {
		List<BoardPost> list = new ArrayList<BoardPost>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select bm_num, u_id, bm_title, bm_star, bm_cont, bm_time,m_photo,bm_cnt from (select rownum rnum, bm_num, u_id, bm_title, bm_star, bm_cont, bm_time,m_photo,bm_cnt from (select * from board_music b, member m, hm_album a, hobby_music h where b.u_num = m.u_num and a.hm_num=h.hm_num2 and h.hm_num=b.hm_num order by bm_num desc) where rownum <= ? ) where rnum > = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardPost post = new BoardPost();
				post.setBmNum(rs.getInt(1));
				post.setuId(rs.getString(2));
				post.setBmTitle(rs.getString(3));
				post.setBmStar(rs.getFloat(4));
				post.setBmCont(rs.getString(5));
				post.setBmTime(rs.getDate(6));
				post.setmPhoto(rs.getString(7));
				post.setBmCnt(rs.getInt(8));
				
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		

		return list;
		
	}
	public int deletePost(Connection conn, int bmNum) throws SQLException {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from board_music where bm_num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bmNum);
			
			rCnt = pstmt.executeUpdate();
		} finally {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return rCnt;
	}
	
	public int modifyPost(Connection conn, int bmNum, BoardPost post) throws SQLException {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "update board_music set hm_num=?,bm_title=?,bm_star=?,bm_cont=? where bm_num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, post.getHmNum());
			pstmt.setString(2, post.getBmTitle());
			pstmt.setFloat(3,post.getBmStar());
			pstmt.setString(4, post.getBmCont());
			pstmt.setInt(5,bmNum);
			
			rCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return rCnt;
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
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return u_num;
	}
	
	
	
	// select 앨범 정보 검색 select
		public AlbumInfo selectAlbum(Connection conn, int mNum) throws SQLException {
			AlbumInfo album = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select a.hm_num,m_singer,m_genre,m_name,m_photo from hm_album a, hobby_music h, board_music b where a.hm_num=h.hm_num2 and h.hm_num=b.hm_num and a.hm_num =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mNum);
			
			rs = pstmt.executeQuery();
			try {
			if(rs.next()) {
				album.setmNum(rs.getInt(1));
				album.setmSinger(rs.getString(2));
				album.setmGenre(rs.getString(3));
				album.setmName(rs.getString(4));
				album.setmPhoto(rs.getString(4));
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
			return album;
			
		}
		
		// 음악 정보 검색 select
		public BoardPost selectMusic(Connection conn, int hmNum) throws SQLException {
			BoardPost music = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select hm_num,hm_title, hm_lyc from board_music b, hobby_music h where b.hm_num = h.hm_num and b.bm_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,hmNum);
			
			rs = pstmt.executeQuery();
			try {
			if(rs.next()) {
				music.setHmNum(rs.getInt(1));
				music.setHmTitle(rs.getString(2));
				music.setHmLyc(rs.getString(3));
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
			return music;
		}
		
		// 게시글 좋아요
}
