<%--
  Created by IntelliJ IDEA.
  User: Artemis
  Date: 2018/10/28
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>

</head>
<body>
    <h1>edit</h1>

    <form action="/book/modify" method="post">
        <input type="hidden" name="id" value="${sessionScope.book.id}">
        <input name="title" placeholder="Title" value="${sessionScope.book.title}"><br>
        Cover <input  type="file" name="cover" value="${sessionScope.book.cover}"><br>
        <input name="price" placeholder="Price" value="${sessionScope.book.price}"><br>
        <input name="date" placeholder="Date" value="${sessionScope.book.date}"><br>
        <input type="submit" value="Update Book">

    </form>
</body>
</html>
