<%@page import="sharehobby.model.exhb.Exhibition"%>
<%@page import="sharehobby.service.exhb.AlterExhbitService"%>
<%@page import="sharehobby.model.exhb.BoardExhibition"%>
<%@page import="sharehobby.service.exhb.ShowExhbitService"%>
<%@page import="sharehobby.dao.exhb.ExhibitionDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:useBean id="exhbit" class="sharehobby.model.exhb.BoardExhibition"/>
<jsp:setProperty property="*" name="exhbit"/>    
<%
	String num = request.getParameter("be_num");
	
	int be_num = 21; 
	if(num!=null){
		be_num= Integer.parseInt(num);
	}
	
	ShowExhbitService service = ShowExhbitService.getInstance();
	BoardExhibition exhb = service.getDetailMsg(be_num);
	
%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="/sh/css/default_board_ny.css" rel="stylesheet" type="text/css">


<script>
 	$(document).ready(function(){
		$('#submit').click(function(){
			$('#update').submit();
			/* 
			var formData = $('#update').serializeArray();
			
			$.ajax({
				url: 'editExhbit_p.jsp',
				type: 'post',
				cache: false,
				data: 
					formData
				,
				success : function(data){
					if(data=='Y'){
						alert('completed!');
						location.href="exhbBoard.jsp";
						$('#alertmsg').html('변ㅋ경').css('color','blue');
					} else {
						$('#alertmsg').html('변경안ㅋ됨ㅋ').css('color','red');
						alert('denied!'); 
					}
				}
			});  */
		});
	}); 
</script>

<style></style>
</head>
<body>
<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp" %>
<!-- nav 끝 -->

<!-- header 시작 -->
	<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->



<!-- contents 시작 -->
	<form method="post" id="update" name="update" action="editExhbit_p.jsp?be_num=<%= exhb.getBe_num() %>">
	    <div class = "wrap">
				<div id="title">
			            <h2>전시회 상세 후기</h2>
			            <span><a href="exhbBoard.jsp">목록</a></span>
			    </div>
				<div class="review">
		            <h6><%= exhb.getBe_num() %> 번째 글</h6>
		            <h3>
		            	<input type="text" name="be_title" value="<%= exhb.getBe_title() %>">
		            </h3>
					전시명 
						<select name="he_num" required>
						<option selected="selected" disabled="disabled">선택하세요</option>
						<%
							/*--show list of msg --*/					
											for(Exhibition e_name : service.getListExhbName()) {
						%>
								<option value="<%= e_name.getHe_num()%>"><%= e_name.getHe_name() %> | <%= e_name.getHe_artist()%> </option>
							<% } %>
						</select>
					<br>
					평점 <input type="number" name="be_star" min="1" max="5">
					<p>내용</p>
					<textarea rows="25" cols="80" name="be_cont"><%= exhb.getBe_cont() %></textarea>
					<span class="star">사진</span>
					<img src="<%= exhb.getBe_photo() %>" style="width: 200px;">
				</div>
				
				<div id="alter">
					<span id="submit">수정<input type="submit" value = "수정" style="display: none;"></span>
					<span id="alertmsg"> </span>
				</div>
				
		</div>
	</form>
<!-- contents 끝 -->


<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>