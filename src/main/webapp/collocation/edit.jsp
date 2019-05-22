<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"%>
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
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png"/>
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic%7CPlayball%7CMontserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/vendors/bootstrap/css/bootstrap-theme.min.css">

    <!-- Fontawesome -->
    <link rel="stylesheet" type="text/css" href="/vendors/font-awesome/css/font-awesome.min.css">

    <!-- Swiper -->
    <link rel="stylesheet" type="text/css" href="/vendors/swiper/css/swiper.min.css">
    <!-- Magnific-popup -->

    <link rel="stylesheet" type="text/css" href="/style.css">
    <link rel="stylesheet" type="text/css" href="/css/welcome.css">
    <style>
        .text{
            border: none;
        }
        .text:hover{
            border: 1px solid #e7e7e7;
            /*border-radius: 50px;*/
        }
    </style>
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
    </header>	<section class="section-content">
    <div class="container">
        <div class="row ">
            <%--<div class="col-md-1 full-width-content">
                <article class="content-item">
                    <div class="entry-media">
                        <h1 style="margin-left:90px;padding: 20px">EDIT Collocation</h1>
                        <form action="<%=basePath %>modify.action" method="post">
                            <input class="text" type="hidden" name="id" value="${sessionScope.collocation.id}">
                            <input class="text" name="title" value="${sessionScope.collocation.title}"><br>
                            <input class="text" name="introduce" value="${sessionScope.collocation.introduce}"><br>
                            <input class="text" name="coverPicture" value="${sessionScope.collocation.coverPicture}"><br>
                            <input class="text" name="content" value="${sessionScope.collocation.content}"><br>
                            <input class="text" name="status" value="${sessionScope.collocation.status}"><br>
                            <input class="text" name="createTime" value="${sessionScope.collocation.createTime}"><br>
                            <input style="width:300px; height:50px; margin-left: 100px;margin-top: 10px;border-radius: 50px" type="submit" value="更新">
                        </form>
                    </div>
                </article>
            </div>--%>
            <div class="col-md-1 full-width-content">
                <article class="content-item">
                    <div class="entry-media">
                        <div class="post-title">
                            <h2>
                                <input id="id" class="text" type="hidden" name="id" value="${sessionScope.collocation.id}">
                                <a><input id="title" class="text" name="title" value="${sessionScope.collocation.title}"><br></a><br>
                                <a style="font-size: small"><input id="introduce" class="text" name="introduce" value="${sessionScope.collocation.introduce}"></a>
                            </h2>
                            <div class="entry-date">
                                <ul>
                                    <li>
                                        <a>
                                            <select class="text" id="typeId" name="typeId">
                                            </select>
                                        </a>
                                    </li>
                                    <li>${sessionScope.collocation.createTime}</li>
                                    <li>${sessionScope.collocation.lookData}</li>
                                    <li><a class="delete" href="${ctx}remove/${collocation.id}.action" onclick="return del()">REMOVE</a></li>
                                    <li>
                                        <select class="text" id="status" name="status">
                                            <option value="公开">公开</option>
                                            <option value="私密">私密</option>
                                        </select><br>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="bubble-line"></div>
                        <div class="post-content full-width">
                            <img src="/coverPicture/${sessionScope.collocation.coverPicture}" alt="not image">
                            <p>
                                <textarea rows="3" cols="120" id="content" class="text" name="content" value="${sessionScope.collocation.content}">${sessionScope.collocation.content}</textarea><br>
                            </p>

                            <input id="updateCollocation" style="width:300px; height:50px; margin-top: 10px;border-radius: 50px" type="submit" value="更新">
                        </div>
                        <div class="bubble-line"></div>
                        <div class="post-footer">
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="javascript:;" class="button">Continue reading</a>
                                </div>
                                <div class="col-sm-6 text-right">
                                    <div class="content-social">
                                        <a href="javascript:;"><i class="fa fa-facebook"></i> <span>Facebook</span></a>
                                        <a href="javascript:;"><i class="fa fa-twitter"></i> <span>Twitter</span></a>
                                        <a href="javascript:;"><i class="fa fa-pinterest"></i> <span>Pinterest</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>

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
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/vendors/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/vendors/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="/vendors/isotope.pkgd.min.js"></script>
<!-- Swiper -->
<script type="text/javascript" src="/vendors/swiper/js/swiper.min.js"></script>
<!-- Magnific-popup -->
<script type="text/javascript" src="/js/scripts.js"></script>
<script type="text/javascript">
    $.ajax({
        url: "<%=basePath %>queryAllTypes.action",
        type: 'get',
        dataType:'json',
        success: (function (data) {
            console.log(data)
            for(var d in data){
                $('#typeId').append('<option value="' + d + '">' + data[d] + '</option>');
            }
        })
    });

    $("#updateCollocation").click(function () {
        var id = $("#id").val();
        var title = $("#title").val();
        var introduce = $("#introduce").val();
        var content = $("#content").val();
        var status = $("#status").val();
        var typeId = $("#typeId").val();
        $.ajax({
            url: "<%=basePath %>modify.action",
            type: 'post',
            data:{"id":id, "title":title, "introduce":introduce, "content":content, "status":status,"typeId":typeId},
            dataType:'json',
            success: (function (data) {
                console.log(data);
                alert(data.result);
                window.location.href = "<%=basePath %>collocation/queryOneById/" + id + ".action";
            })
        })
    });
</script>
</body>
</html>

