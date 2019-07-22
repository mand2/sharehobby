<%@page import="sharehobby.service.music.PostNotFoundException"%>
<%@page import="sharehobby.service.music.ShowPostService"%>
<%@page import="sharehobby.model.member.LoginInfo"%>
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
	<script>
		$(document).ready(function(){
			var cnt = 0;
			$('.likeReview').click(function(){
				$.ajax({
					url: "likeReview.jsp",
					type:"GET",
					data: {
						bmNum:<%=post.getBmNum()%>,
						uId:<%=post.getuId()%>
				},
					success: function(data){
						if(response.uId == '헐'){
							$('.like-cnt').css('background-color','red');
						} else {
							
							$('.like-cnt').html("좋아요 "+cnt++);
						}
					}
						
				});
			});
			
			
		});
	</script>
	
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
							<span class="like-cnt">좋아요<span class="like-cnt"></span>
							</span>
						<a class="likeReview" href="#">좋아요</a>
						</div>
						
						
						<div class="album-info">
							<img src="<%=post.getmPhoto() %>" alt="<%=post.getmName() %>이미지" width="250">										
							<p class="hm-title">
							<%=post.getHmTitle() %> </p>
							<p><%=post.getmName() %> | <%=post.getmSinger() %></p>
							<%=post.getmGenre() %>
							<p>
								음악코드
									<%=post.getHmNum() %>
								</p>
							<p class="cont-star">
						평점
							<%=post.getBmStar() %>
						</p>
						</div>
						<p class="bm-cont"><%=post.getBmCont() %></p>
						
						
							
						<a href="boardMusicList.jsp">목록보기</a>
						<% if(uId != null && uId.equals(post.getuId())) { %>
							<a class="user-service btn-write" href="${pageContext.request.contextPath}/music/confirmDelete.jsp?bmNum=<%=post.getBmNum()%>">글삭제</a>
							<a class="user-service btn-write" href="${pageContext.request.contextPath}/music/modifyForm.jsp?bmNum=<%=post.getBmNum()%>">글수정</a>
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
			location.href="${pageContext.request.contextPath}/music/boardMusicList.jsp";
		</script>
			
		<%} %>
</body>
</html>