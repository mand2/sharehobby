<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="sharehobby.dao.tour.BoardDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="sharehobby.model.tour.Board"%>
<%@page import="sharehobby.service.tour.CreateBoardService"%>

<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// 1. 폼으로 부터 데이터를 받는다.
	// 2. Message 객체에 저장 : useBean 액션태그
	// 3. WriteMessageService 객체 생성
	// 4. write 메서드 실행 : 1/0
		request.setCharacterEncoding("utf-8");
%>

    
	<jsp:useBean id="board" class="sharehobby.model.tour.Board" />
	<jsp:setProperty property="*" name="board"/>

<%

  
	String title = "";
	String content = "";
	float star = 0;
	String photo = "";
	String saveFileName = "";
	String uploadPath = "/upload";
	String dir = request.getSession().getServletContext().getRealPath(uploadPath);
	String real = "/Users/kwon-yongmin/Desktop/bitcamp/bitcampjn201904/JSP/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ShareHobby/upload/";
	
	String fullpath = "";
	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {

		DiskFileItemFactory factory = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(factory);

		List<FileItem> files = upload.parseRequest(request);

		Iterator<FileItem> itr = files.iterator();

		while (itr.hasNext()) {
			FileItem file = itr.next();

			if (file.isFormField()) {
				// 타입이 파일이 아닌경우
				if (file.getFieldName().equals("title")) {
					title = file.getString("utf-8");
				} else if (file.getFieldName().equals("content")) {
					content = file.getString("utf-8");
				} else if (file.getFieldName().equals("star")) {
					star = Integer.parseInt(file.getString("utf-8"));
				} 
			} else {
				//(2) 파일형식인 경우 --> 파일 경로 분기처리 : 1. 파일이 있는 경우 2. 파일이 없는 경우
				if (file.getFieldName().equals("photo")) {
					photo = file.getName();

					saveFileName = System.nanoTime() + "_" + photo;
					file.write(new File(dir, saveFileName));

					fullpath = "/sh/upload/"+saveFileName;

					/* if (photo.equals(null) || photo.equals("")) {
						fullpath = "../images/noImg.png";
					} */
				}
			}
		}

	}

	board.setTitle(title);
	board.setContent(content);
	board.setPhoto(fullpath);
	board.setStar(star);

	String u_id = (String) session.getAttribute("u_id");

	Connection conn = ConnectionProvider.getConnection();
	BoardDao dao = BoardDao.getInstance();

	int u_num = dao.find_uNum(conn, u_id);

	CreateBoardService service = CreateBoardService.getInstance();
	int cnt = service.write(board, u_num);
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	<% if(cnt>0) { %>
		alert('리뷰가 성공적으로 등록되었습니다');
		location.href='boardmain.jsp'; 
	<% } else { %>
		alert('다시 입력해주세요.');
		history.back(-1);
<% } %>

</script>
<style>

</style>
</head>
<body>

</body>
</html>