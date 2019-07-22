package sharehobby.servlet.member;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sharehobby.dao.member.MemberDao;


/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/memberCheck")
public class MemberCheckServlet extends HttpServlet {
	public MemberCheckServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	} 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        int u_num = Integer.parseInt(request.getParameter("u_num"));
        MemberDao dao = MemberDao.getInstance();
        response.getWriter().write(dao.Member(u_num)+ "");

	}

}
