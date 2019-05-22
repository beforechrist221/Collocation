<%--
  Created by IntelliJ IDEA.
  User: Artemis
  Date: 2018/10/28
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../commons/inc.jsp"%>
<html>
<head>
    <title>home</title>
    <script>
        function del() {
            return confirm("DEL?");
        }
    </script>
</head>
<body>
    <h1>home</h1>
    ${sessionScope.user.username}
    <hr>
    <a href="${ctx}/user/signOut">Sign Out</a>

    <hr>
WELCOME！
</body>
</html>
