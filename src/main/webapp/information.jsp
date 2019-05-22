<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        /*.u_user{
            width: 25px;
            height: 25px;
            background: url(images/HornetHive.png);
            !*background-position:  -125px 0;*!
            position: absolute;
            !*margin: 12px 13px;*!
        }*/
        .u_user{
            width: 25px;
            height: 25px;
            background: url(images/login_ico.png);
            background-position:  -125px 0;
            position: absolute;
            margin: 12px 13px;
        }
        .u_gender{
            width: 25px;
            height: 25px;
            background-image: url(images/Butterfly.png);
            /*background-position: -125px -34px;*/
            position: absolute;
            /*margin: 12px 13px;*/
        }
        .u_sign{
            width: 25px;
            height: 25px;
            background-image: url(images/Giraffe.png);
            /*background-position: -85px 0px;*/
            position: absolute;
            margin: 12px 13px;
        }
        .u_phone{
            width: 25px;
            height: 25px;
            background-image: url(images/Leopard.png);
            /*background-position: -85px 0px;*/
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
            width:370px;
            padding-left:10px;
            border:0;
            background-color:#fff;
            color: #888;
            border-radius: 50px;
            margin-left: 50px;
        }
        .submit {
            padding: 15px;
            margin-top: 20px;
            display: block;
        }
        .act-but{
            width: 280px;
            height: 46px;
            line-height: 20px;
            text-align: center;
            font-size: 20px;
            border-radius: 50px;
            background: #0096e6;
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
</header>	<section class="section-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 sidebar social">
                <div class="widget">
                    <h3 class="widget-title">${sessionScope.user.username}</h3>
                    <div class="bubble-line"></div>
                    <a class="widget-title" href="<%=basePath %>signOut.action">Sign Out</a>
                    <div class="bubble-line"></div>
                    <a class="widget-title">
                        <span id="resetPassword" onclick="resetPassword()">
                            更换密码
                        </span>
                    </a>
                    <div class="bubble-line"></div>
                    <div class="widget-content">
                        <img style="width: 100px;height: 100px" src="avatar/${sessionScope.user.avatar}" alt="not image">
                        <span id="changeAvatar">
                            更换头像
                        </span>
                    </div>
                </div>
                <div class="widget">
                    <h3 class="widget-title"> INFORMATION</h3>
                    <div class="bubble-line"></div>
                    <%--${sessionScope.user}--%>
                    <div class="widget-content">
                        <form id="form1">
                            <input type="hidden" id="id" value="${sessionScope.user.id}">
                            <div class="input_outer">
                                <span class="u_user"></span>
                                <input id="username" class="text" type="text" value="${sessionScope.user.username}">
                            </div>
                            <div class="input_outer">
                                <span class="u_user"></span>
                                <select class="text" id="gender" name="gender" value="${sessionScope.user.gender}">
                                    <%--<option selected="selected" value="${sessionScope.user.gender}">${sessionScope.user.gender}</option>--%>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select><br>
                                <%--<input id="gender" class="text" type="text" value="${sessionScope.user.gender}">--%>
                            </div>
                            <div class="input_outer">
                                <span class="u_user"></span>
                                <input id="sign" class="text" type="text" value="${sessionScope.user.sign}">
                            </div>
                            <div class="input_outer">
                                <span class="u_user"></span>
                                <input id="phone" class="text" type="number" value="${sessionScope.user.phone}">
                            </div>
                            <button class="act-but submit" style="color: #FFFFFF" id="updateUserInfo">修改</button>
                            <%--<button class="act-but submit" style="color: #FFFFFF">修改</button>--%>
                        </form>

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
<script type="text/javascript">
    $("#updateUserInfo").click(function () {
        var id = $("#id").val();
        var username = $("#username").val();
        var gender = $("#gender").val();
        var sign = $("#sign").val();
        var phone = $("#phone").val();
        console.log(username);
        $.ajax({
            url: "updateInfo.action",
            type: 'post',
            data:{"id":id, "username":username, "gender":gender, "sign":sign, "phone":phone},
            dataType:'json',
            success: (function (data) {
                console.log(data);
                alert(data.result);
            })
        });
    });

    $(function () {
        $('span#changeAvatar').on('click',function () {
            $('<hr>' +
                '<form action="<%=basePath %>resetAvatar.action" method="post" enctype="multipart/form-data">\n' +
                '        <div class="form-group">\n' +
                '            <label for="avatarFile">AVATAR</label>\n' +
                '            <input type="file" id="avatarFile" name="avatarFile" class="form-control"  ><br>\n' +
                '        </div>\n' +
                '        <input id="changeAvatar" type="submit" value="SAVE">\n' +
                '    </form>').insertAfter($(this));
        });
    });
    function resetPassword(){
        var id = $("#id").val();
        var newPassword=prompt("Please enter your new password","")
        console.log(newPassword);
        if (newPassword!=null && newPassword!="")
        {
            $.ajax({
                url: "resetPassword.action",
                type: 'post',
                data:{"id":id, "password":newPassword},
                dataType:'json',
                success: (function (data) {
                    console.log(data);
                    alert(data.result);
                })
            });
        }
    }

</script>
</body>
</html>
