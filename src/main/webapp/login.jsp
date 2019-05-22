<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BBR996</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }

        .bg-blur {
            float: left;
            width: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            -webkit-filter: blur(15px);
            -moz-filter: blur(15px);
            -o-filter: blur(15px);
            -ms-filter: blur(15px);
            filter: blur(15px);
        }

        body{
            font-family: "微软雅黑";
            font-size: 14px;
            background: url(images/1494318631621.jpg) fixed center center;
        }
        .logo_box{
            width: 280px;
            height: 490px;
            padding: 35px;
            color: #EEE;
            position: absolute;
            left: 50%;
            top:100px;
            margin-left: -175px;
        }
        .logo_box h3{
            text-align: center;
            height: 20px;
            font: 20px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei",sans-serif;
            color: #FFFFFF;
            height: 20px;
            line-height: 20px;
            padding:0 0 35px 0;
        }
        .input_outer{
            height: 46px;
            padding: 0 5px;
            margin-bottom: 20px;
            border-radius: 50px;
            position: relative;
            border: rgba(255,255,255,0.2) 2px solid !important;
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
        .l-login{
            position: absolute;
            z-index: 1;
            left: 52px;
            top: 0;
            height: 46px;
            font: 14px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei";
            line-height: 46px;
        }
        label{
            color: rgb(255, 255, 255);
            display: block;
        }
        .text{
            width: 200px;
            height: 46px;
            outline: none;
            display: inline-block;
            font: 14px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei";
            margin-left: 50px;
            border: none;
            background: none;
            line-height: 46px;
        }
        .mb2{
            margin-bottom: 20px
        }
        .mb2 a{
            text-decoration: none;
            outline: none;
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

<script src="js/jquery.min.js"></script>

<div class="logo_box">
    <h3>BBR996</h3>

    <form action="<%=basePath %>login.action" method="post" onSubmit="return inputNull(this)">
        <div class="input_outer">
            <span class="u_user"></span>
            <input id="email" name="email" class="text" onFocus=" if(this.value=='输入ID或用户名登录') this.value=''" onBlur="if(this.value=='') this.value='输入ID或用户名登录'" value="输入ID或用户名登录" style="color: #FFFFFF !important" type="text" ><span id="msg"></span>
        </div>
        <div class="input_outer">
            <span class="us_uer"></span>
            <label class="l-login login_password" style="color: rgb(255, 255, 255);display: block;"> 输入密码</label>
            <input id="password" name="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" onFocus="$('.login_password').hide()" onBlur="if(this.value=='') $('.login_password').show()" value="" type="password">
        </div>
        ${requestScope.message}
        <button class="act-but submit" style="color: #FFFFFF">登录</button>
    </form>

    <div class="sas">
        <a href="/reg.jsp">还没注册账号！</a>
    </div>

</div>
<script>
    function inputNull(form){
        var email = $("#email").val();
        var password = $("#password").val();
        if(email =="" || password =="")
            {
                alert("输入的用户名密码不能为空");
                return false;
            }
        }

</script>
</body>
</html>