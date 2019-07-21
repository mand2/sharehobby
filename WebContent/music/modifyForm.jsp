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
			<% if(uId !=null && uId.equals(post.getuId())){ %>
			<div class="wrap">
					<div id="title">
						음악 관련 게시판 
					</div>
					<form action="confirmModify.jsp" method="post">
						<table border="1" style="border-collase:collapse">
							<input type="hidden" name="bmNum" value="<%= bmNum %>">
							<tr>
								<th>제목</th>
								<td style="width: 500px;"><input type="text" value="<%=post.getBmTitle() %>" name="bmTitle"></td>
							</tr>
							<tr>
								<th>별점</th>
								<td>
										<select name="bmStar" value="<%=post.getBmStar()%>">
											<option value="5">5</option>
											<option value="4">4</option>
											<option value="3">3</option>
											<option value="2">2</option>
											<option value="1">1</option>										
										</select>
									</td>
							</tr>
							<tr>
								<th>음악코드</th>
								<td><input type="text" value="<%=post.getHmNum() %>" name="hmNum"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="bmCont" cols="100" rows="40"><%=post.getBmCont()%></textarea></td>
							</tr>
							<tr>
								<td><input type="submit" value="수정완료"></td>
								<td><input type="reset" value="취소"></td>
							</tr>
						</table>
					</form>
			</div>
		<% } else { %>
			<script>
				alert("잘못된 접근입니다.");
				location.go(-1);
			</script>
		<% } %>	
		</div>
		<div id="footer">
		</div>
</body>
</html>