<%@page import="sharehobby.service.food.ViewPostService"%>
<%@page import="sharehobby.service.food.WritePostService"%>
<%@page import="sharehobby.model.food.FoodPostList"%>
<%@page import="sharehobby.service.food.GetPostListService"%>
<%@page import="sharehobby.model.food.FoodPost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String bfNumstr = request.getParameter("bf_num");

	FoodPost post = null;

	int bf_num = 0;

	if (bfNumstr != null) {
		bf_num = Integer.parseInt(bfNumstr);

		ViewPostService service = ViewPostService.getInstance();
		post = service.viewPost(bf_num);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBY - 리뷰 수정</title>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
review {
	border: 3px solid;
	margin: 5px 0px;
	width: 300px;
}

td {
	height: 30px;
}

table tr>td:first-child {
	width: 50px;
}

input[type=text] {
	height: 20px;
	margin: 0 2px;
}

textarea {
	margin: 2px;
}
#wrap {
	weight: 900px;
	width: 900px;
	margin: auto;
}
#updateForm {
	margin: auto;
}

#updateForm>input[type=submit] {
	width: 50px;
	height: 30px;
	margin: 0 3px;
	box-sizing: border-box;
	background-color: #FAF19E;
	border: 0px;
	border-radius: 3px;
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
	<h1>리뷰 수정</h1>
	<br>
	<hr>
	<br>
	<form calss=review action="FoodUpdatePostCheck.jsp" method="post">
		<div id="wrap">
			<table id="updateForm" width="700" border=1>
			<input type="hidden" name="bf_num" value="<%=bf_num%>">
				<tr>
					<td id="title">제 목</td>
					<td><input name="bf_title" type="text" size="70" value="<%=post.getBf_title()%>" /></td>
				</tr>
				<tr>
					<td id="title">식당 번호</td>
					<td>
						<select name="hf_num">
							<option selected><%=post.getHf_num()%></option>
							<option>10</option>
							<option>20</option>
					</select>
					</td>
				</tr>
				<tr>
					<td id="title">평 점</td>
					<td>
						<select name="bf_star">
							<option selected><%=post.getBf_star()%></option>
							<option>10</option>
							<option>9</option>
							<option>8</option>
							<option>7</option>
							<option>6</option>
							<option>5</option>
							<option>4</option>
							<option>3</option>
							<option>2</option>
							<option>1</option>
							
					</select>
					</td>
				</tr>
				<tr>
					<td id="title">내 용</td>
					<td><textarea name="bf_cont" cols="72" rows="20"><%=post.getBf_cont()%></textarea></td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>

			<br>
			<hr>
		</div>
	</form>
	</div>
	<!-- contents 끝 -->

	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>