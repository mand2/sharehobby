<%@page import="sharehobby.model.food.FoodStore"%>
<%@page import="sharehobby.model.food.FoodPost"%>
<%@page import="sharehobby.service.food.ViewPostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int bf_num = 0;

	String str = request.getParameter("bf_num");

	if (str != null) {
		bf_num = Integer.parseInt(str);
	}

	ViewPostService service = ViewPostService.getInstance();
	FoodPost foodpost = service.viewPost(bf_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBY - 맛집 :: <%=foodpost.getBf_title()%></title>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<style>
#wrap {
	weight: 900px;
	width: 900px;
	margin: auto;
}
#main {
	weight: 700px;
	width: 700px;
	margin: auto;
}
#title {
	font-size: 30px;
	
}
#user, #time {
	text-align: right;
}
#cont {
	weight: 600px;
	width: 600px;
	margin: auto;
	font-size: 15px;
	border : 1px solid #DDD;
	padding : 5px;
}

#upde {
	text-align: right;
}
</style>


</head>
<body>

	<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->

	<!-- header 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- header 끝 -->

	<!-- contents 시작 -->
	<div id="wrap">
		<div id="main">
			<div class="wrap">

				<div id="title">
					<h3><%=foodpost.getBf_title()%></h3>
				</div>
				<div id="user">
					작성자 : <%=foodpost.getU_id()%>
				</div>
				<div id="time">
					작성일 : <%= foodpost.getBf_time() %>
				</div>
				<div id="store">
					식 당 : <%=foodpost.getHf_name()%> (<%=foodpost.getHf_address()%>) 
				</div>
				<div id="pnum">
					번 호 : <%=foodpost.getHf_pnum()%>
				</div>
				<div id="star">
					평 점 : <%=foodpost.getBf_star()%>
				</div>
				<br>
				<div id="cont">
					<%=foodpost.getBf_cont()%>
				</div>

				<div id="upde">
					<a href="FoodDeletePost.jsp?bf_num=<%=foodpost.getBf_num()%>">삭제하기</a> | 
					<a href="FoodUpdatePost.jsp?bf_num=<%=foodpost.getBf_num()%>">수정하기</a>
				</div>

			</div>

		</div>
	</div>
	<!-- contents 끝 -->


	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->

</body>
</html>