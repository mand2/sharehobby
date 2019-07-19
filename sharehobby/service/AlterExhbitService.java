package sharehobby.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import sharehobby.dao.ExhibitionDao;
import sharehobby.model.BoardExhibition;

public class AlterExhbitService {
	private AlterExhbitService () {}
	private static AlterExhbitService service = new AlterExhbitService();
	public static AlterExhbitService getInstance() {
		return service;
	}
	
	public int alterMsg(BoardExhibition exhbit, int be_num) {
		int result = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
		
			conn.setAutoCommit(false);
			
			ExhibitionDao dao = ExhibitionDao.getInstance();
			result = dao.updateMsg(conn, exhbit, be_num);
			
			conn.commit();
		
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}
		return result;
	}
}
