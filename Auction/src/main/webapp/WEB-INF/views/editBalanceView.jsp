<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Obaju e-commerce template">
<meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
<meta name="keywords" content="">

<title>내꺼니꺼</title>

<meta name="keywords" content="">

<link
   href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100'
   rel='stylesheet' type='text/css'>

<!-- styles -->
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">

<!-- theme stylesheet -->
<link href="resources/css/style.blue.css" rel="stylesheet"
   id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link href="resources/css/custom.css" rel="stylesheet">


<script src="resources/js/respond.min.js"></script>

<link rel="shortcut icon" href="favicon.png">

</head>

<body>

   <jsp:include page="_top.jsp"></jsp:include>
   <jsp:include page="_navbar.jsp"></jsp:include>

   <div id="all">

      <div id="content">
         <div class="container">

            <div class="col-md-12">

               <ul class="breadcrumb">
                  <li><a href="home">홈</a></li>
                  <li>예치금</li>
               </ul>

            </div>

            <div class="col-md-6">
               <div class="box">
                  <h1>예치금 충전</h1>

                  <hr>

                  <form id="form_edit_balance" action="" method="post">
                     <div class="form-group">
                        <label for="balance">충전 금액을 입력하세요</label> <input type="text"
                           class="form-control" id="balance" name="balance">
                     </div>
                     
                     <div class="text-center">
                        <button id="edit-button" class="btn btn-primary">
                           <i class="fa fa-user-md"></i> 충전
                        </button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         <!-- /.container -->
      </div>
      <!-- /#content -->


      <jsp:include page="_footer.jsp"></jsp:include>
      <jsp:include page="_copyright.jsp"></jsp:include>

   </div>
   <!-- /#all -->




   <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
   <script src="resources/js/jquery-1.11.0.min.js"></script>
   <script src="resources/js/jquery.validate.min.js"></script>
   <script src="resources/js/additional-methods.min.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/jquery.cookie.js"></script>
   <script src="resources/js/waypoints.min.js"></script>
   <script src="resources/js/modernizr.js"></script>
   <script src="resources/js/bootstrap-hover-dropdown.js"></script>
   <script src="resources/js/owl.carousel.min.js"></script>
   <script src="resources/js/front.js"></script>
   <script type="text/javascript">
   $(document).ready(
           function() {
              $("#charge-button").on('click', function() {
                 if($("#form_edit_balance").valid()) {
                    $.post('${pageContext.request.contextPath}/balance_edit', {
                       balance : $("#balance").val()
                    }, function(data, status, jqXHR) {
                    }).done(function() {
                       alert("충전이 완료되었습니다.");
                       window.location.replace("${pageContext.request.contextPath}/home");
                    }).fail(function(jqXHR) {
                       if(jqXHR.status == "6974") {
                          alert("웨애애애애애애애애애애애애애애애애애애애애애ㅐ애애애애애앵")
                       }
                    }).always(function() {
                    });
                 } else {
                    System.out.println("충전 실패");
                 }
              }
           )});
   </script>


</body>

</html>