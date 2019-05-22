<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>type add page</title>
    </head>
    <body>
        <h1>ADD Type</h1>
        <form action="${ctx}/type/create" method="post">
            <input name="typename" placeholder="TYPENAME"><br>
            <input type="submit" value="ADD">
        </form>
    </body>
</html>