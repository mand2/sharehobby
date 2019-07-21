<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

	$.ajax({
		url: 'tourJson.java',
		type: 'get',
		data: {
			"contentId" : contentid,
			"contentTypeId" : contenttypeid
		},
		dataType: 'json',
		success: function(data){
			
			var myItem = data.response.body.items.item;
			var output = '';
				output += '<h4>'+myItem.treatmenu+'</h4>';
				output += '<h4>'+myItem.treatmenu+'</h4>';
				output += '<h4>'+myItem.treatmenu+'</h4>';
				
				$('window').html(output);
		},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus); alert("Error: " + errorThrown);
			}
	});
	

</script>
<style>

</style>
</head>
<body>

</body>
</html>