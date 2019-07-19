<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="sharehobby.service.ShowExhbitService"%>
<%@page import="sharehobby.model.BoardExhibition"%>
<%@page import="sharehobby.dao.ExhibitionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("be_num");
	
	int be_num = 21; 
	if(num!=null){
		be_num= Integer.parseInt(num);
	}
	
	ShowExhbitService service = ShowExhbitService.getInstance();
	
	BoardExhibition exhb = service.getDetailMsg(be_num);

%>

<!-- 작성자와 보는사람 아이디 비교 -->
<%
	String u_id = (String)session.getAttribute("u_id");

	Connection conn = ConnectionProvider.getConnection();
	ExhibitionDao dao = ExhibitionDao.getInstance(); 
	
	int user_num = dao.find_uNum(conn, u_id);
%>

<%-- <%
	String u_id = "aa";
	
	Connection conn = ConnectionProvider.getConnection();
	ExhibitionDao dao = ExhibitionDao.getInstance(); 
	
	int user_num = dao.find_uNum(conn, u_id);
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글보기::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/default_board.css" rel="stylesheet" type="text/css">
<style></style>

<script>
	$(document).ready(function(){
		
		$('#d').click(function(){
			$.ajax({
				url: 'deleteExhbit.jsp',
				type: 'GET',
				dataType : 'text',
				data: {
					be_num : '<%= exhb.getBe_num() %>'
				},
				success : function(data){
					if(data=='Y'){
						$('#alertmsg').html('삭제되었습니다.').css('color','blue');
						alert('completed!');
						location.href="exhbBoard.jsp";
					} else {
						$('#alertmsg').html('삭제안ㅋ됨ㅋ').css('color','red');
						alert('denied!');
					}
				}
			});//ajax	
		});
	});
</script> 


</head>
<body>
	
<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp" %>
<!-- nav 끝 -->

<!-- header 시작 -->
	<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->


<!-- contents 시작 -->    
	<div class = "wrap">
		<div id="title">
	            <h2>전시회 상세 후기</h2>
	            <span><a href="exhbBoard.jsp">목록</a></span>
	    </div>
		<div class="review">
            
            <h6><%= exhb.getBe_num() %> 번째 글</h6>
            <h3><%= exhb.getBe_title() %></h3>
			<h5>
				작성시간 <%= exhb.getBe_time()%> | 작성자 <%= exhb.getU_num() %>
			</h5>
			<span class="star">전시코드 <%= exhb.getHe_num() %> | 평점 <%= exhb.getBe_star() %> </span>
			<p><%= exhb.getBe_cont() %></p>
			<span class="star">사진 <%= exhb.getBe_photo() %></span>
		</div>
		
		
		<!-- 글쓴사람아이디 == 해당게시글쓴사람아이디 -->
		<%
			if(user_num == exhb.getU_num()){
		%>
				<div id="alter">
					<span id="d">삭제</span>
					<span><a href="editExhbit.jsp?be_num=<%= exhb.getBe_num()%>">수정</a></span>
				</div>
				<p id="alertmsg">  </p>
		<%
			}
		%>
	</div>

<!-- contents 끝 -->


<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>