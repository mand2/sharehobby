<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">

<style>
* {
	margin: 0;
	padding: 0;
}

div {
	width: 300px;
	margin: 100px auto;
}

#pw {
	margin: 20px;
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
	<div id=confirmdel>
		<form action="deleteMember.jsp" method="post">
			탈퇴하시기 전에 비밀번호를 입력해주세요.<br> <input type="hidden" name="u_num"
				value="<%=request.getParameter("u_num")%>">
			<!-- 사용자에게 보이지않지만 전송할떄 같이 전송해야하므로 사용 -->
			<div id="pw">
				<table>
					<tr>
						<td><input type="password" name="u_pw" required></td>
						<td><input type="submit" value="탈퇴"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<!-- contents 끝 -->


	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>