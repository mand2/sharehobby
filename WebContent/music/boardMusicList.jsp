<%@page import="java.text.SimpleDateFormat"%>
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
		
	String pageNumberstr = request.getParameter("page");
	
	int pageNumber = 1;
	
	if(pageNumberstr != null){
		pageNumber = Integer.parseInt(pageNumberstr);
	}
	
	BoardMusicListService listService = BoardMusicListService.getInstance();
	BoardMusicList viewData = listService.getBoardMusicListService(pageNumber);
	
	

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
	
	<%
		if(uId != null){ %>
	<%@include file="../frame/header.jsp" %>
	<%@include file="../frame/nav.jsp" %>
		<div id="main">
			<div class="wrap">
					<div id="title">
						음악 관련 게시판 
						<a href="boardMusicWriteForm.jsp">글쓰기</a>
					</div>
					<%
						if(viewData.isEmpty()){
					%> 
						<h3 class="viewStatus">등록된 게시글이 없습니다.</h3>	
						<div id="content-wrap">	
					<%	} else { %>
							<p><%=viewData.getPageTotalCount() %>개의 게시글이 있습니다.</p>
							<table border="1" style="border-collapse:collapse">
								<thead>
									<tr>
										<th>글번호</th>
										<th>작성자</th>
										<th>평점</th>
										<th>제목</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
						<%
							for(BoardPost postlist : viewData.getPostList()){ 
						%>
									<tr>
										<td><%= postlist.getBmNum() %></td>
										<td><%= postlist.getuId() %></td>
										<td><%= postlist.getBmStar() %></td>
										<td><a href="viewPostContent.jsp?bmNum=<%=postlist.getBmNum()%>"><%= postlist.getBmTitle() %></a></td>
										<td><%= postlist.getBmTime() %></td>
									</tr>
						<%	}
						%>
								</tbody>
							</table>
						<%	
							}
						%>
						</div>
						<%
						for(int i=1;i<=viewData.getPageTotalCount();i++){
						%>
							<a href="boardMusicList.jsp?page=<%= i %>">[<%=i %>]</a>
						<%
						}
						%>	
				</div>
				
			</div>
		<div id="footer">
		</div>
		<% } else {
			
		%>
		<script>
			alert("해당 서비스는 로그인 한 회원만 이용 가능합니다.");
			location.href="notLogin.jsp";
		</script>
		<% } %>
</body>
</html>