﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <title>Cloudy town</title>
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
  
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="css/welcome.css">
</head>
<body>

	<div class="wrapper">
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
					<div class="col-sm-4 sidebar">
						<div class="widget">
							<h3 class="widget-title"> Category</h3>
							<div class="bubble-line"></div>
							<div class="widget-content">
								<ul id="typeId">

								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8 col-md-8">
						<div class="content">

						</div>
					</div>

				</div>
			</div>
		</section>
	</div>
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
            url: "<%=basePath %>queryAllTypes.action",
            type: 'get',
            dataType:'json',
            success: (function (data) {
                console.log(data)
                for(var d in data){
                    $('#typeId').append('<li class="typeName"  id="'+ d +'">' + data[d] + '</li>');
                }
            })
        });
        $.ajax({
            url: "<%=basePath %>collocation/queryByType/1.action",
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
        $("body").on("click",".typeName",function(){
            var type_id = $(this).attr('id');
            $.ajax({
                url: "<%=basePath %>collocation/queryByType/" + type_id + ".action",
                data: {'id': type_id},
                type: 'post',
                dataType:'json',
                success: (function (data) {
                    $('.content').empty();
                    console.log(data);
                    for(var d in data){
                        $('.content').append('<article class="content-item"">' +
                            '                    <div class="entry-media">' +
                            '                      <div class="post-title">' +
                            '                        <h2> <a href="collocation/queryOneById/'+ data[d]['id'] + '.action">' + data[d]['title'] +'</a> </h2>' +
                            '                        <div class="entry-date">' +
                            '                        <ul>' +
                            '                        <li>' +
                            '                          <a href="#">' + data[d]['type']['typename'] + '</a>' +
                            '                        </li>' +
                            '                        <li>'+ data[d]['createTime']+ '</li>' +
                            '                        <li>'+ data[d]['lookData']+ '浏览</li>' +
                            '                        </ul>' +
                            '                       </div>' +
                            '                     </div>' +
                            '                     <div class="bubble-line"></div>' +
                            '                       <div class="post-content">' +
                            '                           <img src="/coverPicture/'+ data[d]['coverPicture'] + '" alt="not image">' +
                            '                           <p>' + data[d]['introduce'] +
                            '                           </p>' +
                            '                       </div>' +
                            '                     <div class="bubble-line"></div>' +
                            '                     <div class="post-footer">' +
                            '                       <div class="row">' +
                            '                           <div class="col-sm-6">' +
                            '                               <a href="javascript:;" class="button">Continue reading</a>' +
                            '                           </div>' +
                            '                           <div class="col-sm-6 text-right">' +
                            '                               <div class="content-social grid">' +
                            '                                   <a href="javascript:;"><i class="fa fa-facebook"></i></a>' +
                            '                                   <a href="javascript:;"><i class="fa fa-twitter"></i></a>' +
                            '                                   <a href="javascript:;"><i class="fa fa-pinterest"></i></a>' +
                            '                           </div>' +
                            '                       </div>' +
                            '                     </div>' +
                            '               </div>' +
                            '           </div>' +
                            '       </article>');
                    }
                })
            });
        });
	</script>
</body>
</html>
