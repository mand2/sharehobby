<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int contentid = Integer.parseInt(request.getParameter("contentid"));
	
	String conTitle = request.getParameter("title");

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
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>


</script>
<style>

</style>
</head>
<body>

	<div id="create">
		<p class="lead">리뷰를 남겨주세요.</p>
		<a href="../board/CreateBoard.jsp" class="btn btn-primary btn-lg">리뷰 작성</a>
	</div>

			<%
					if (viewData.isEmpty()) {
			%>
						<h3>등록된 메시지가 없습니다.</h3>
			<%
					} else {

					for (Board board : viewData.getBoardList()) {
			%>
			<div id="content">
          			<img src="<%=board.getPhoto()%>" width="200px" height="200px">
          			<h5><%=board.getU_id() %>님의 리뷰</h5> <br>
            		<h4><%=board.getTitle()%></h4> <img src="../image/star2.png" width="25px" height="25px"><%=board.getStar()%><br>
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

</body>
</html> --%>