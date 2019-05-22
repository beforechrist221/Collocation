<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>type list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <c:import url="add.jsp"/>
        <hr/>
        <h1>LIST Type</h1>
        <hr/>
        <table border="1">
            <tr>
                <th>COUNT</th>
                <th>TYPENAME</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="type" items="${sessionScope.pagination.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${type.typename}</td>
                <td><a href="${ctx}/type/queryById/${type.id}">EDIT</a></td>
                <td><a class="delete" href="${ctx }/type/remove/${type.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
        <c:import url="${ctx}/commons/page.jsp">
            <c:param name="path" value="type/${sessionScope.pagination.sqlId}"/>
        </c:import>
    </body>
</html>