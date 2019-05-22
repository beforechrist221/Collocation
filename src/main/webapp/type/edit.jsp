<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>type edit page</title>
    </head>
    <body>
        <h1>EDIT Type</h1>
        <form action="${ctx}/type/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.type.id}">
            TYPENAME: <input name="typename" value="${sessionScope.type.typename}"><br>
            <input type="submit" value="SAVE">
        </form>
    </body>
</html>