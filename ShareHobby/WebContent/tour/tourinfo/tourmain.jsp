<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        url: 'TourData.do',
        type: 'get',
        dataType: 'json',
        success: function(msg){
            console.log(msg.response.body.items.item);
            var myItem = msg.response.body.items.item;
            
            for(var i=0; myItem.length; i++){
                var output = '';
                console.log(myItem.length);
                output += '<h3>'+ i + '번째 경북 여행 데이터' +'</h3>';
                output += '<h4>'+myItem[i].addr1+'</h4>';
                output += '<h4>'+myItem[i].contentid+'</h4>';
                output += '<h4>'+myItem[i].contenttypeid+'</h4>';
                output += '<img src="'+myItem[i].firstimage+'"><br>';
                output += '<img src="'+myItem[i].firstimage2+'">';
                output += '<h4>'+myItem[i].overview+'</h4>';
                output += '<h4>'+myItem[i].title+'</h4>';
                output += '<h4>'+myItem[i].tel+'</h4>';
                
                document.body.innerHTML += output;

            }
        }
    });    
    
});

</script>
<style>

</style>
</head>
<body>

<h4 id="test"></h4>

</body>
</html>