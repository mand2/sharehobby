<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

/* 	$.ajax({
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
	}); */
$(document).ready(function () {
	
    $.ajax({          
        url: 'TourData.jsp',
        type: 'get',
        dataType: 'json',
        success: function(msg){
            console.log(msg.response.body.items.item);
            var myItem = msg.response.body.items.item;
            
            for(var i=0; myItem.length; i++){
                var output = '';
                console.log(myItem.length);
                output += '<a href="tourDetail.jsp?contentid='+myItem[i].contentid+'?title='+myItem[i].title+'">';
                output += '<div id="tourinfo">';
                output += '<img src="'+myItem[i].firstimage2+'" width="250px" height="150px">';
                output += '<h4>'+myItem[i].title+'</h4>';
                output += '</div>';
                output += '</a>';
                /* output += '<h4>'+myItem[i].addr1+'</h4>';
                output += '<h4>'+myItem[i].contentid+'</h4>';
                output += '<h4>'+myItem[i].contenttypeid+'</h4>';
                output += '<img src="'+myItem[i].firstimage+'"><br>'; */
                /* output += '<h4>'+myItem[i].overview+'</h4>';
                output += '<h4>'+myItem[i].tel+'</h4>'; */

                document.body.innerHTML += output;
            }
        }
    });    
    
});

</script>
<style>
body {
	margin: 40px auto;
	width: 900px;
}

#tourinfo {
	float: left;
	margin: 10px 10px;
	width: 250px;
	height: 180px;
	text-decoration: none;
}

a {
	color: black;
}

h4 {
	font-size: 15px;
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
		
			</a>
	</div>

  	<!-- Bootstrap core JavaScript -->
  	<script src="vendor/jquery/jquery.min.js"></script>
  	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>