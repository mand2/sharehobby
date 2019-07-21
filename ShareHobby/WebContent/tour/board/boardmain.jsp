<%@page import="sharehobby.dao.tour.BoardDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="sharehobby.model.tour.Board"%>
<%@page import="sharehobby.model.tour.BoardListView"%>
<%@page import="sharehobby.service.tour.GetBoardListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
<%
	request.setCharacterEncoding("utf-8");


	String u_id = (String)session.getAttribute("u_id");

	Connection conn = ConnectionProvider.getConnection();
	BoardDao dao = BoardDao.getInstance(); 

	int u_num = dao.find_uNum(conn, u_id);

	
	String pageNumberstr = request.getParameter("page");

	int pageNumber = 1;

	if (pageNumberstr != null) {
		pageNumber = Integer.parseInt(pageNumberstr);
	}

	// 핵심 처리할 서비스 객체
	GetBoardListService service = GetBoardListService.getInstance();

	// 응답 데이터의 결과
	BoardListView viewData = service.getBoardListView(pageNumber);
%>

<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shard Bobby 에 오신것을 환영합니다 !!</title>

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/heroic-features.css" rel="stylesheet">


<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
/* $(document).ready(function () {
	
	
	//$('#btn').click(function() {
	$('#search').keyup(function() {
		
		$('#searchd').html("");
	
		$.ajax({
			url: 'searchajax.jsp',
			type: 'POST',
			dataType: 'text',
			data: {
				search: $('#search').val(),
			},
			success: function (data) {
				$('#searchd').append(data);

			}
		
		});
		
	});
		
		
		
});

	 */

</script>
<style>
body {
	margin: 40px auto;
	width: 800px;
}

#container {
	height: 500px;
}
#content {
	float: left;
	margin: 40px 10px;
	border-bottom: 1px solid #DDD;
}

#content>img {
	float: left;
	margin: 0 20px;
}
#content>a {
	margin-left: 300px;
	margin-bottom: 10px;
}

</style>
</head>
<body>
  <%@ include file="../frame/nav.jsp" %>


  <!-- Page Content -->
  <div id="container">

	<%@ include file="../frame/header.jsp" %>

			<form action="search.jsp" method="get" id="sform">
				<input type="text" id="search" name="search"> <input
					type="submit" value="검색">
				<h4 id="searchd"></h4>
			</form>
			<div id="create">
				<p class="lead">리뷰를 남겨주세요.</p>
				<a href="CreateBoard.jsp" class="btn btn-primary btn-lg">리뷰 작성</a>
			</div>
			<hr>

				<%
					if (viewData.isEmpty()) {
				%>
						<h3>등록된 리뷰가 없습니다.</h3>
				<%
					} else {

						for (Board board : viewData.getBoardList()) {
				%>
			<div id="content">
          			<img src="<%=board.getPhoto()%>" width="250px" height="280px">
          			<h5><%=board.getU_id() %>님의 리뷰</h5> <img src="../image/star2.png" width="25px" height="25px"><%=board.getStar()%><br><br>
            		<h4><%=board.getTitle()%></h4> <br>
            		<p><%=board.getContent()%></p> <br>
            		<a href="DetailBoard.jsp?pk=<%=board.getPk()%>" class="btn btn-primary">자세한 리뷰 보기</a>
			</div>



				<%
					}
				}

					// [1] [2] [3]
					for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
				%>
				<a href="boardmain.jsp?page=<%=i%>">[<%=i%>]
				</a>

				<%
					}
				%>

<!-- 			<div id="aside">
				<ul>
					<li>추천 여행지</li>
					<li>내가 찜한 여행지</li>
					<li>추천 리뷰</li>
					<li>나의 리뷰</li>
				</ul>
			</div> -->

	</div>



  	<!-- Bootstrap core JavaScript -->
  	<script src="vendor/jquery/jquery.min.js"></script>
  	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>