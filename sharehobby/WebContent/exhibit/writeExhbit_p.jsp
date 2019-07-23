<%@page import="java.io.File"%>
<%@page import="sharehobby.dao.exhb.ExhibitionDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="sharehobby.service.exhb.WriteExhbitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="exhbit" class="sharehobby.model.exhb.BoardExhibition"/>
<jsp:setProperty property="*" name="exhbit"/>


<!-- 아이디로 회원번호받아오기 -->
<%
	String u_id = (String)session.getAttribute("u_id");

	Connection conn = ConnectionProvider.getConnection();
	ExhibitionDao dao = ExhibitionDao.getInstance(); 
	
	int u_num = dao.find_uNum(conn, u_id);
%>


<!-- 파일저장 -->
<%
	int he_num = 0;
	String be_title = "";
	int be_star = 0;
	String be_cont = "";
	
	String fileName = ""; //파일이름
	String saveFileName = ""; //서버에저장할 파일이름변경(사용자별중복 X 위함)
	
	long fileSize = 0;
	
	String fullpath = "";
	String uploadPath = "/uploadFiles";
	String dir = request.getSession().getServletContext().getRealPath(uploadPath);
	
	
	/* real multipart/form-data로 받은건가 확인 */
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	if(isMultipart){	
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		
		/* FileItem : 
			form 페이지에서 전송한 데이터들(he_num , be_title , be_star , be_cont, be_photo)을 
			객체하나로 만들어 가져옴. 
			http://localhost:8080/sh/exhibit/uploadFiles/343884117688400_0001.jpg
		*/
			
		List<FileItem> items = upload.parseRequest(request);
		
		/* 반복하기 + 순서는 모름 */
		Iterator<FileItem> itr = items.iterator();
		
		while(itr.hasNext()){
			FileItem item = itr.next();
			
			
			if(item.isFormField()){
				//input type = file X
				
				//params 중 누가 먼저 넘어올 지 모르기에 비교시작
				if(item.getFieldName().equals("he_num")){
					he_num = Integer.parseInt(item.getString("utf-8"));
				
				} else if(item.getFieldName().equals("be_title")){
					be_title = item.getString("utf-8");
					
				} else if(item.getFieldName().equals("be_star")){
					be_star = Integer.parseInt(item.getString("utf-8"));
					
				} else if(item.getFieldName().equals("be_cont")){
					be_cont = item.getString("utf-8");
					
				}
						
			} else {
				//input type = file O
				if(item.getFieldName().equals("be_photo")){
					fileName = item.getName();
					fileSize = item.getSize();

					saveFileName = System.nanoTime()+"_"+fileName;
					item.write(new File(dir, saveFileName));
					
					fullpath = "/sh/exhibit/uploadFiles/" + saveFileName;
				}
			}
			
		}
	}
	
	/* 넘길 객체로 만들어줌 */
	exhbit.setU_num(u_num);
	exhbit.setHe_num(he_num);
	exhbit.setBe_title(be_title);
	exhbit.setBe_star(be_star);
	exhbit.setBe_cont(be_cont);
	exhbit.setBe_photo(fullpath);
	
	WriteExhbitService service = WriteExhbitService.getInstance();

	int cnt = service.write(exhbit);
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>확인::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>

<script>
	alert('completed!');
	location.href="exhbBoard.jsp"; 
</script>

</head>
<body>
	<%-- <h1>
		<%= cnt>0 ? "메세지 남김" : "오류"%>
	</h1>
	
	<a href="writeExhbit.jsp">다시쓰기</a> --%>
</body>
</html>