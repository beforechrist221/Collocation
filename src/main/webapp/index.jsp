﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <title>BBR996</title>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
    <meta name="keywords" content="HTML5,CSS3,HTML,Template,Themeton" >
    <meta name="description" content="Cloudy Town - Simple Blog HTML Template">
    <meta name="author" content="Themeton">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png"/>
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic%7CPlayball%7CMontserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/bootstrap/css/bootstrap-theme.min.css">

    <!-- Fontawesome -->
    <link rel="stylesheet" type="text/css" href="vendors/font-awesome/css/font-awesome.min.css">

    <!-- Swiper -->
    <link rel="stylesheet" type="text/css" href="vendors/swiper/css/swiper.min.css">
    <!-- Magnific-popup -->
  
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link rel="stylesheet" type="text/css" href="css/welcome.css">
	<style>
		.hide-center {
			width:520px;
			height:250px;
			position:fixed;
			margin-top: -90px;
			right:0;
			left:0;
			bottom:0;
			top:0px;
			margin:auto;
			display:none;
			z-index:99;
		}
		.hide-center .formhead {
			width:520px;
			height:42px;
			margin:0;
			padding-top:12px;
			padding-bottom:-30px;
			border-top-left-radius:10px;
			border-top-right-radius:10px;
			background-color:#101010;
		}
		.hide-center .formhead-title {
			width:150px;
			height:24px;
			margin-left:71px;
			margin-right:36px;
			color:#bfbfbf;
			font-weight:900;
			display:inline-block;
		}
		.hide-center .close {
			width:35px;
			height:35px;
			margin-top: -10px;
			margin-left: -5px;
			border:0;
			border-radius:20%;
			background-color:red;
			color:white;
			display:inline-block;
		}
		.hide-center .formbody {
			width:520px;
			min-height:300px;
			height: auto;
			background-color: #696969;
			border-bottom-left-radius:10px;
			border-bottom-right-radius:10px;
		}
		.u_user{
			width: 25px;
			height: 25px;
			background: url(images/login_ico.png);
			background-position:  -125px 0;
			position: absolute;
			margin: 12px 13px;
		}
		.us_uer{
			width: 25px;
			height: 25px;
			background-image: url(images/login_ico.png);
			background-position: -125px -34px;
			position: absolute;
			margin: 12px 13px;
		}
		.us_email{
			width: 25px;
			height: 25px;
			background-image: url(images/login_ico.png);
			background-position: -85px 0px;
			position: absolute;
			margin: 12px 13px;
		}
		.hide-center .loginUserName {
			padding-left:30px;
			padding-top:30px;
			margin-bottom: 20px;
			border-radius: 50px;
		}
		.hide-center .loginPassword {
			padding-left:30px;
			margin-bottom: 20px;
			border-radius: 50px;
		}
		.hide-center #BSignIn {
			margin-left: 75px;
			margin-top: 10px;
		}
		.hide-center #BSignUp {
			margin-left: 75px;
			margin-top: 10px;
		}
		.text{
			height:52px;
			width:390px;
			padding-left:10px;
			border:0;
			background-color:#141414;
			color:aliceblue;
			border-radius: 50px;
			margin-left: 50px;
		}
	</style>
</head>
<body>
<header id="header">
    <div class="logo" data-bg-image="images/bg-header.jpg">
        <h1>
            <a href="index.jsp">BBR996</a>
        </h1>
        <p>CREATE THE BEST VERSION OF U</p>

    </div>

    <div class="menu-container">
        <div class="container">
            <div class="row">
                <div  class="col-md-7">
					<nav class="main-nav">
						<ul>
							<li class=" current-menu-item menu-item-has-children">
								<a href="index.jsp">Home</a>
							</li>
							<li><a href="single.jsp">类型</a></li>
							<li><a href="<%=basePath %>collocation/queryAllPages.action">全部</a></li>
							<c:choose>
								<c:when test="${sessionScope.user eq null}">

								</c:when>
								<c:otherwise>
								<li><a href="<%=basePath %>collocation/queryByUser.action">我的发布</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>
            </div>
        </div>
    </div>
</header>
<section class="section-content">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8">
					<div class="content"></div>
				</div>

				<div class="col-sm-4 sidebar">
					<c:if test="${sessionScope.user eq null}">
						<div class="widget">
							<div class="widget-content">
								<img src="avatar/default.png" style="width:100px;height:100px;border-radius: 50%;" alt="not image"><br>
								<a href="login.jsp" style="font-size: larger;padding: 25px;">请登录</a>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.user ne null}">
						<div class="widget">
							<h3 class="widget-title">${sessionScope.user.username}</h3>
							<div class="bubble-line"></div>
							<a class="widget-title" href="<%=basePath %>signOut.action">Sign Out</a>
							<div class="bubble-line"></div>
							<div class="widget-content">
								<img src="avatar/${sessionScope.user.avatar}" alt="not image">
								<p>${sessionScope.user.sign}</p>
								<div class="widget-more">
									<a href="information.jsp" class="button">More Infomation</a>
								</div>
							</div>
						</div>
					</c:if>


					<div class="widget">
						<h3 class="widget-title"> 最新搭配 </h3>
						<div class="bubble-line"></div>
						<div class="widget-content">
							<div class="new"></div>

						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="instagram-follow">
		<a><h2>&copy; BBR996 </h2></a>
	</section>

    <script type="text/template" id="tpl-bubble-left">
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 15 30" enable-background="new 0 0 15 30" xml:space="preserve">
            <path fill-rule="evenodd" clip-rule="evenodd" fill="none" stroke="#000000" stroke-miterlimit="10" d="M0,29.4c0,0,7.5,0,7.5-7c0,0,7,0,7-7c0-0.1,0-0.1,0-0.2c0-0.1,0-0.1,0-0.2c0-7-7-7-7-7c0-7-7.5-7-7.5-7"/>
        </svg>
    </script>

    <script type="text/template" id="tpl-bubble-right">
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 15 30" enable-background="new 0 0 15 30" xml:space="preserve">
            <path fill-rule="evenodd" clip-rule="evenodd" fill="none" stroke="#000000" stroke-miterlimit="10" d="M15,29.4c0,0-7.5,0-7.5-7c0,0-7,0-7-7c0-0.1,0-0.1,0-0.2c0-0.1,0-0.1,0-0.2c0-7,7-7,7-7c0-7,7.5-7,7.5-7"/>
        </svg>
    </script>


    <!-- Include jQuery and Scripts -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="vendors/jquery.waypoints.min.js"></script>
    <script type="text/javascript" src="vendors/isotope.pkgd.min.js"></script>
    <!-- Swiper -->
    <script type="text/javascript" src="vendors/swiper/js/swiper.min.js"></script>
    <!-- Magnific-popup -->
    <script type="text/javascript" src="js/scripts.js"></script>
	<script>
        $.ajax({
            url: "<%=basePath %>collocation/queryByLookData.action",
            type: 'get',
            dataType:'json',
            success: (function (data) {
                console.log(data)
                for(var d in data) {
                    $('.content').append('<article class="content-item"">' +
                        '                    <div class="entry-media">' +
                        '                      <div class="post-title">' +
                        '                        <h2> <a href="collocation/queryOneById/' + data[d]['id'] + '.action">' + data[d]['title'] + '</a> </h2>' +
                        '                        <div class="entry-date">' +
                        '                        <ul>' +
                        '                        <li>' +
                        '                          <a href="#">' + data[d]['type']['typename'] + '</a>' +
                        '                        </li>' +
						'						 <li>' + data[d]['user']['username'] + '</li>' +
                        '                        <li>' + data[d]['createTime'] + '</li>' +
                        '                        <li>' + data[d]['lookData'] + '浏览</li>' +
                        '                        </ul>' +
                        '                       </div>' +
                        '                     </div>' +
                        '                     <div class="bubble-line"></div>' +
                        '                       <div class="post-content">' +
                        '                           <img src="/coverPicture/' + data[d]['coverPicture'] + '" alt="not image">' +
                        '                           <p>' + data[d]['introduce'] +
                        '                           </p>' +
                        '                       </div>' +
                        '               </div>' +
                        '           </div>' +
                        '       </article>');
                }
            })
        });
        $.ajax({
            url: "<%=basePath %>collocation/queryByCreateTime.action",
            type: 'get',
            dataType:'json',
            success: (function (data) {
                console.log(data)
                for(var d in data) {
                    $('.new').append('<div class="widget-recent">' +
                        '    			 <img src="/coverPicture/' + data[d]['coverPicture'] + '" alt="not image">' +
                        '                <h4><a href="collocation/queryOneById/' + data[d]['id'] + '.action">' + data[d]['title'] + '</a> </h4>' +
                        '                <p>' + data[d]['content'] +
                        '   			 </p>' +
                        '				 </div>');
                }
            })
        });
	</script>
</body>
</html>
