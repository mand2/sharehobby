package sharehobby.servlet.member;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sharehobby.dao.member.MemberDao;
import sharehobby.model.member.MemberInfo;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/memberJoin")
public class MemberJoinServlet extends HttpServlet {
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        int u_num = Integer.parseInt(request.getParameter("u_num"));
        String u_id = request.getParameter("u_id");
        String u_pw = request.getParameter("u_pw");
        String u_pw2 = request.getParameter("u_pw2");
        String u_name = request.getParameter("u_name");
        String u_pnum = request.getParameter("u_pnum");
        
 
        // 빈칸이 하나라도 있으면 안됨
        if (u_id == null || u_id.equals("") || u_pw == null || u_pw.equals("")
                || u_pw2 == null || u_pw2.equals("") || u_name == null || u_name.equals("")
                ) {
            // session을 가져와서 속성을 설정함 (신기)
            // 요청하는 것 -> index.jsp에서 일어날 일
            // reponse받아오는 것-> 실행후 해야할 일
            request.getSession().setAttribute("messageType", "오류 메시지");
            request.getSession().setAttribute("messageContent", "fill in the all blanks");
            response.sendRedirect("join_form.jsp");
            return;
        }
        if (!u_pw.equals(u_pw2)) {
            request.getSession().setAttribute("messageType", "오류 메시지");
            request.getSession().setAttribute("messageContent", "two password are not equal");
            response.sendRedirect("join_form.jsp");
            return;
        }

	}

}
