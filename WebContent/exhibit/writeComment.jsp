<%@page import="sharehobby.service.exhb.comment.AlterCommentService"%>
<%@page import="sharehobby.model.exhb.BoardComment"%>
<%@page import="sharehobby.service.exhb.comment.ShowCommentService"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="sharehobby.dao.exhb.ExhibitionDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); 
%>
<%
	ShowCommentService ser = ShowCommentService.getInstance();

	ExhibitionDao dao1 = ExhibitionDao.getInstance(); 
	int u_num = dao1.find_uNum(conn, u_id);
	
	AlterCommentService ser2 = AlterCommentService.getInstance();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>

<script>

	$(document).ready(function(){

		 $('.add').click(function() {
			var chk = $(this).closest('.edit').find('.re_chk').prop('checked');
			var w = $(this).closest('.reply').width() - 30; /* 대댓크기줄임 */
            var w2 = w - 22; /* textarea 크기줄임 */
			          
			if(chk){
			    $(this).closest('.edit').find('.replyForm').css('display', 'block').width(w);
			    $(this).closest('.edit').find('textarea').width(w2);
			} else {
			    $(this).closest('.edit').find('.replyForm').css('display', 'none');
			}
		});
		
		
		$('#btn').click(function() {
				var comment = $(this).closest('#wirteComment');

			$.ajax({
				url: 'writeComment_p.jsp',
				type: 'post',
				dateType: 'text',
				data: {
					u_num: comment.find('#u_num').val(),
					be_num: comment.find('#be_num').val(),
					bc_cont: comment.find('#bc_cont').val(),
					bc_parent: comment.find('#bc_parent').val()
				},
				success : function(data) {
					if(data == 'Y'){
						$('#btn +p').html('등록되었습니다').css('color','blue');
						//addComment(u_num, be_num, bc_cont);
					} else {
						$('#btn +p').html('등록 안되었습니다').css('color','red');
					}
				}
			});
		});
		
		$('.re_btn').click(function(){
			
			var reply = $(this).closest('.replyForm');
			
			$.ajax({
				url: 'writeComment_p.jsp',
				type: 'post',
				dateType: 'text',
				data: {
					u_num: reply.find('#u_num').val(),
					be_num: reply.find('#be_num').val(),
					bc_cont: reply.find('#bc_cont').val(),
					bc_parent: reply.find('#bc_parent').val()
				},
				success : function(data) {
					if(data == 'Y'){
						$('#btn +p').html('등록되었습니다').css('color','blue');
						
					} else {
						$('#btn +p').html('등록 안되었습니다').css('color','red');
					}
				}
			});
		});
		
		/* function addComment(u_num, be_num, bc_cont) {
			var str = "";
			str += '<div class="reply">';
            str += '<div class="info">';
            str += '    <h4>' + u_num + ' &nbsp; ' + new Date() + '</h4></div>';
            str += '<div id="contents">' + bc_cont + '</div>';
            str += '<div class="edit"> <a>수정</a> <a>삭제</a> <a class="reply">댓글</a>';
            str += '    <form method="post" style="display: none" class="replyForm">';
            str += '		<div>';
            str += '		<input type="hidden" name="u_num" id="u_num" value="' + u_num + '">';
            str += '		<input type="hidden" name="be_num" id="be_num" value="' + be_num + '">';
            str += '		<input type="hidden" name="bc_parent" id="bc_parent" value="' + be_num + '">';
            str += '		<textarea placeholder="이 댓글에 댓글입력"></textarea>';
            str += '		<span class="re_btn">이 댓글에 댓글쓰기</span>';
            str += '		</div></form></div></div>';
            
            $('#commentList').append(str);
		} */
		
		$('.delete').click(function() {
			$.ajax({
				url: 'deleteComment.jsp',
				type: 'post',
				dateType: 'text',
				data: {
					bc_num: $('#bc_num').val(),
				},
				success : function(data) {
					if(data == 'Y'){
						alert('completed!');
					} else {
						alert('denied!');
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="comment">
        <h3>전체 <%= ser.getCnt(be_num) %> 개</h3>
        <hr>
        <div id="commentList">
        <% 
        	for(BoardComment comment : ser.getList(be_num)) {
        		int level = comment.getBc_level();
        		int depth = 580 - ( (level-1) * 30 );
        %>

        <!-- 완료된것 -->
        <div class="reply" style="width:<%= depth %>px;">
            <div class="info">
                <h4> 작성자 <%=comment.getU_num() %> |&nbsp; <%= comment.getBc_date() %></h4>
            </div>
            <div id="contents"><%= comment.getBc_cont() %></div>
            
            <div class="edit">
            	<div>
            	<%
            		if(u_num == comment.getU_num()) {
            	%>
	            	<input type="hidden" name="bc_num" id="bc_num" value="<%= comment.getBc_num()%>">
	            	<a>수정</a> 
	            	<a class="delete">삭제</a> 
            	<% } %>
					<a class="add"><label><input type="checkbox" class="re_chk">댓글</label></a>
            	</div>
            	<!-- 댓글에 댓글,, -->
            	<form method="post" style="display: none" class="replyForm">
                    <div>
                        <input type="hidden" name="u_num" id="u_num" value="<%= u_num%>">
			        	<input type="hidden" name="be_num" id="be_num" value="<%= be_num%>">
			        	<input type="hidden" name="bc_parent" id="bc_parent" value="<%= comment.getBc_num()%>">
			        	<textarea name="bc_cont" id="bc_cont" placeholder="이 댓글에 댓글입력"></textarea>
                        <span class="re_btn">이 댓글에 댓글쓰기</span>
                    </div>
				</form>
            </div>
        </div>
        
        <% 
        	}
        %>
        </div>
        
		<!-- 쓰기 폼 -->        
        <div id="wirteComment">
        	<input type="hidden" name="u_num" id="u_num" value="<%= u_num%>">
        	<input type="hidden" name="be_num" id="be_num" value="<%= be_num%>">
        	<input type="hidden" name="bc_parent" id="bc_parent" value="<%= be_num%>">
            <textarea name="bc_cont" id="bc_cont" placeholder="댓글입력"></textarea>
            <span id="btn">댓글쓰기</span>
            <p></p>
        </div>
     
	</div>
</body>
</html>