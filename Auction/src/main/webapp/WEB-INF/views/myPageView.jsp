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
                  <li>마이페이지</li>
               </ul>

            </div>

            <div id="advantages">

                <div class="container">
                    <div class="same-height-row">
                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-heart"></i>
                                </div>

                                <h3><a href="javascript:window.location.reload(true);">이름</a></h3>                
                                <p>${user_name}</p>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-tags"></i>
                                </div>

                                <h3><a href="#">아이디</a></h3>
                                <p>${user_id}</p>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa fa-thumbs-up"></i>
                                </div>

                                <h3><a href="#">예치금</a></h3>
                                <p>${user_balance}</p>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->

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
   
   </script>


</body>

</html>