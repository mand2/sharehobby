package jdbc;

import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Loader extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		
		//여러개 가져올 수 있기 때문에 s를 붙임
		String drivers = config.getInitParameter("jdbcdriver");
		//데이터베이스 드라이버클래스이름을 등록해서 사용할때 드라이버를 로드할때 ,를 기준으로 문자를 잘라 사용
		StringTokenizer st = new StringTokenizer(drivers, ",");
		
		//StringTokenizer은 자른 문자열을 한줄로 나열이 아니라 그 다음줄로 보내기 때문에 gasMoreTokens로 다음값이 있는지 확인
		while(st.hasMoreTokens()) {
			//driver 변수에 읽어온 데이터 저장
			String driver = st.nextToken();
			
			//데이터 베이스 드라이버 로드
			try {
				Class.forName(driver);
				System.out.println("데이터베이스 드라이버 로드 성공");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
	}

}
