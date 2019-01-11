<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
          입찰성공페이지
    </title>

    <meta name="keywords" content="">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>
    <!-- styles -->
    <link href="resources/css/font-awesome.css" rel="stylesheet">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/animate.min.css" rel="stylesheet">
    <link href="resources/css/owl.carousel.css" rel="stylesheet">
    <link href="resources/css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="resources/css/style.blue.css" rel="stylesheet" id="theme-stylesheet">
    <!-- your stylesheet with modifications -->
    <link href="resources/css/custom.css" rel="stylesheet">
    <script src="resources/js/respond.min.js"></script>
    <link rel="shortcut icon" href="favicon.png">
</head>

<body>
    <jsp:include page="_top.jsp"></jsp:include>
    <jsp:include page="_navbar.jsp"></jsp:include>
    <jsp:include page="recentProduct.jsp"></jsp:include>
<div id="all">
   
      <div id="content">
         <div class="container">
         
            <div class="col-md-12">
               <div class="box">
               <center>
                  <h1>입찰이 완료되었습니다</h1>
                  </center>

                  <hr>

                  <form id="form_user_edit" action="" method="post">
                     <div class="form-group">
                     <center>
                        <label for="name">입찰이 성공적으로 완료되었습니다</label>
                        </center>
                     </div>
                     <div class="text-center">
                        <button id="confirm-button" class="btn btn-primary">
                           <i class="fa fa-user-md"></i> 확인
                        </button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
 </div>
 <div style=height:400px; ></div>   
    <div>

    <jsp:include page="_footer.jsp"></jsp:include>
    <jsp:include page="_copyright.jsp"></jsp:include>

    </div>
    <!-- /#all -->


    

    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
    <script src="resources/js/jquery-1.11.0.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.cookie.js"></script>
    <script src="resources/js/waypoints.min.js"></script>
    <script src="resources/js/modernizr.js"></script>
    <script src="resources/js/bootstrap-hover-dropdown.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/front.js"></script>
    <script>
         $(document).ready(function() {
                   $("#confirm-button").click(function() {
                      $.ajax({
                              url : "http://localhost:8080/jbnu/home",
                              method : "GET",
                              success : function() {
                              window.location.replace("${pageContext.request.contextPath}");
                              }
                              })}
               )
         });
      </script>
	

</body>

</html>