<%@page import="sharehobby.service.food.UpdatePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="updatePost" class="sharehobby.model.food.FoodPost" />
<jsp:setProperty property="bf_title" name="updatePost" />
<jsp:setProperty property="bf_star" name="updatePost" />
<jsp:setProperty property="hf_num" name="updatePost" />
<jsp:setProperty property="bf_cont" name="updatePost" />
<%
String bfNumstr = request.getParameter("bf_num");


int bf_num = 0;
if (bfNumstr != null) {
	bf_num = Integer.parseInt(bfNumstr);
	
	UpdatePostService service = UpdatePostService.getInstance();
	service.updatePost(bf_num, updatePost);
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<script>

	alert("리뷰가 수정되었습니다."); 	
	
	location.href="FoodListPost.jsp";
	
	</script>
</body>
</html>