<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
        <div class="container">
            <a href="https://www.xadmin.net" class="navbar-brand">User Management Application</a>
            <ul class="navbar-nav ml-auto"> <!-- This aligns the items to the right -->
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1 bg-danger">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded">
                        <%= session.getAttribute("name") %>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</header>



        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Users</h3>
        <hr>

        <div class="container text-left">
            <form action="Search" method="post">
                Enter your id <input type="text" name="id"/><br/>
                <input type="submit" value="Search">
            </form>
        </div>

        <div class="container text-right">
            <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New User</a>
        </div>
        <br>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><c:out value="${user.name}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.country}" /></td>
                    <td>
                        <a href="edit?id=<c:out value='${user.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="delete?id=<c:out value='${user.id}' />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Pagination links -->
        <div class="text-center">
            <ul class="pagination">
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="?page=1">First</a>
                </li>
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${currentPage - 1}">Previous</a>
                </li>
                <c:forEach var="page" begin="1" end="${totalPages}">
                    <li class="page-item ${currentPage == page ? 'active' : ''}">
                        <c:if test="${currentPage != page}">
                            <a class="page-link" href="?page=${page}">${page}</a>
                        </c:if>
                        <c:if test="${currentPage == page}">
                            <span class="page-link">${page}</span>
                        </c:if>
                    </li>
                </c:forEach>
                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${currentPage + 1}">Next</a>
                </li>
                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${totalPages}">Last</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>