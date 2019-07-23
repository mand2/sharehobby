package sharehobby.service.music;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import sharehobby.dao.music.BoardMusicDao;
public class AddLikeService {
	private AddLikeService() {};
	private static AddLikeService service = new AddLikeService();
	
	public static AddLikeService getInstance() {
		return service;
	}
	
	
	public int addLike(int uNum,int bmNum) {
		
		BoardMusicDao dao = null;
		Connection conn = null;
		
		// user가 좋아요 했는지 안했는지 체크
		int chkUser = 0;
		// 좋아요 존재 체크
		int chkLike = 0;
		
		// 좋아요 전체 카운트
		int cntLike = 0;
		
		
		try {
			dao = BoardMusicDao.getInstance();
			chkUser = dao.chkUserLike(conn, uNum);
			conn = ConnectionProvider.getConnection();
			
			// 존재한다면 like를 0으로
			if(chkUser == 1) {
				chkLike = dao.updateLike(conn, bmNum, uNum);
			} else {
				chkLike = dao.insertLike(conn, bmNum, uNum);
				cntLike = dao.countLike(conn, bmNum);
			}
			
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cntLike;
	}
	
	
	public int countLike(int bmNum) {
		BoardMusicDao dao = null;
		Connection conn = null;
		// 좋아요 전체 카운트
		int cntLike = 0;
		
		
		
		try {
			dao = BoardMusicDao.getInstance();
			conn = ConnectionProvider.getConnection();
			cntLike = dao.countLike(conn, bmNum);
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cntLike;
	}
}
