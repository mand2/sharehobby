<%@page import="sharehobby.service.ShowPostService"%>
<%@page import="sharehobby.model.LoginInfo"%>
<%@page import="sharehobby.model.BoardMusicList"%>
<%@page import="sharehobby.service.BoardMusicListService"%>
<%@page import="sharehobby.model.BoardPost"%>
<%@page import="sharehobby.service.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String uId = (String)session.getAttribute("u_id");
	
	int bmNum = 0;
	
	String str = request.getParameter("bmNum");
	
	if(str!=null){
		bmNum = Integer.parseInt(str);
	}
	
	ShowPostService service = ShowPostService.getInstance();
	BoardPost post  = service.showPost(bmNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main_css.css">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
	<%@include file="../frame/header.jsp" %>
	<%@include file="../frame/nav.jsp" %>
		<div id="main">
			<div class="wrap">
					<div id="title">
						음악 관련 게시판 
					</div>
					<div>
					글번호
						<%=post.getBmNum() %>
					</div>
					<div>
					음악코드
						<%=post.getHmNum() %>
					</div>
					<div>
					제목
						<%=post.getBmTitle() %>
					</div>
					<div>
					작성자
						<%=post.getuId() %>
					</div>
					<div>
					내용
						<p>
						<span>앨범 제목 : </span>
						<%=post.getmName() %><br>
						<img src="<%=post.getmPhoto() %>" alt="<%=post.getmName() %>이미지" width="250"><br>
						<%=post.getBmCont() %>
												
						
					</div>
					<div>
					평점
						<%=post.getBmStar() %>
					</div>
					<div>
					작성시간
						<%=post.getBmTime() %>
					</div>
					
						
				</div>
				<a style="background-color:red" href="confirmDelete.jsp?bmNum=<%=post.getBmNum()%>">글삭제</a>
				<a style="background-color:red" href="modifyForm.jsp?bmNum=<%=post.getBmNum()%>">글수정</a>
				
			</div>
		<div id="footer">
		</div>
</body>
</html>