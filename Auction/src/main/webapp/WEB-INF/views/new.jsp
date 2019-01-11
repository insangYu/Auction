<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    function callFunction(){
        $.ajax({
            "url": "http://localhost:8080/jbnu/getReadyPage",
            "method": "GET",
            success:function(data){
                window.location.href = data.next_redirect_pc_url;
            }
        });
    }
</script>
<body>
<a href="javascript:callFunction();">
    결제하기
</a>
</body>
</html>