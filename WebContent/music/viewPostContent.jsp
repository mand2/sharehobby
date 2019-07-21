<%@page import="sharehobby.service.music.PostNotFoundException"%>
<%@page import="sharehobby.service.music.ShowPostService"%>
<%@page import="sharehobby.model.music.LoginInfo"%>
<%@page import="sharehobby.model.music.BoardMusicList"%>
<%@page import="sharehobby.service.music.BoardMusicListService"%>
<%@page import="sharehobby.model.music.BoardPost"%>
<%@page import="sharehobby.service.music.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String uId = (String)session.getAttribute("u_id");
	
	int bmNum = 0;
	
	String str = request.getParameter("bmNum");
	String msg ="";
	BoardPost post = null;
	
	if(str!=null){
		bmNum = Integer.parseInt(str);
	}
	
	ShowPostService service = ShowPostService.getInstance();
	try{
		post  = service.showPost(bmNum);
	} catch(PostNotFoundException e){
		msg = e.getMessage();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/default_board.css">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
	<%@include file="../frame/nav.jsp" %>
	<%@include file="../frame/header.jsp" %>
		<div id="main">
			<div id="container">
					<% if(post !=null){ %>
					<h3 class="title-header">
						리뷰 상세보기 
					</h3>
					<div id="detail-cont-wrap">
						<h4 class="detail-title">
				
							<%=post.getBmTitle() %>
							<span>
							<%=post.getBmTime() %>
							</span>	
						</h4>
						<div class="title-info">
							<span>
							<%=post.getuId() %></span>
							<span>조회수
								<%= post.getBmCnt() %>
							</span>
							<span>좋아요
								<%= post.getBmLike() %>
							</span>
						<a href="#">좋아요</a>
						</div>
						
						<div class="cont-wrap">
						음악코드
							<%=post.getHmNum() %>
						</div>
						<div class="album-info">
							<img src="<%=post.getmPhoto() %>" alt="<%=post.getmName() %>이미지" width="250">										
							<p class="hm-title">
							<%=post.getHmTitle() %> </p>
							<p><%=post.getmName() %> | <%=post.getmSinger() %></p>
							<%=post.getmGenre() %>
							<p class="cont-star">
						평점
							<%=post.getBmStar() %>
						</p>
						</div>
						<p class="bm-cont"><%=post.getBmCont() %></p>
						
						
							
						<a style="background-color:red" href="boardMusicList.jsp">목록보기</a>
						<% if(uId != null && uId.equals(post.getuId())) { %>
							<a style="background-color:red" href="confirmDelete.jsp?bmNum=<%=post.getBmNum()%>">글삭제</a>
							<a style="background-color:red" href="modifyForm.jsp?bmNum=<%=post.getBmNum()%>">글수정</a>
						<% } %>
					</div>
					<!-- /detail-cont-wrap -->
				</div>
				<!-- /container -->
			</div>
			<!-- /main -->
		<div id="footer">
		</div>
		<%} else{ %>
		<script>
			alert("<%=msg%>");
			location.href="boardMusicList.jsp";
		</script>
			
		<%} %>
</body>
</html>