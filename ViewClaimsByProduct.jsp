<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container-fluid {
            padding: 0;
        }
        .navbar {
            background-color: #333;
            color: #fff;
            border-radius: 0;
            border: none;
            margin-bottom: 0;
        }
        .navbar a {
            color: #fff !important;
        }
        h2 {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="submit"],
        .btn-primary {
            background-color: #333 !important;
            border-color: #333 !important;
        }
        input[type="submit"]:hover,
        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active {
            background-color: #333 !important;
            border-color: #333 !important;
        }
    </style>
    <title>User Product Claims</title>
</head>
<body>
    <% String uname = (String) request.getParameter("uname");%>
    <% String prodName = (String) request.getParameter("pname"); %>
    <% String prodSerialNum = (String) request.getParameter("prodSrNum"); %>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Hello <%= uname %></a>  
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="UserHome.jsp?loggedInUser=<%=uname%>">Home</a></li>
                <li><a href='LoginUser.jsp'>Logout</a></li>      
            </ul>
        </div>
    </nav>
    <br>

    <div align="center">
        <sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/project" user="root"
            password="Binchow1428" />

        <sql:query dataSource="${dbCon}" var="result">
            select * from claim WHERE username = ? AND serialNumber = ?;
            <sql:param value="<%=uname%>" />
            <sql:param value="<%=prodSerialNum%>" />
        </sql:query>

        <h2>Product Claims</h2>
        <table>
            <tr>
                <th>Product Name</th>
                <th>Product Serial Number</th>
                <th>Description</th>
                <th>Claim Date</th>
                <th>Status</th>
            </tr>

            <c:forEach var="col" items="${result.rows}">
                <tr>
                    <td><c:out value="<%=prodName%>"></c:out></td>
                    <td><c:out value="${col.serialNumber}"></c:out></td>
                    <td><c:out value="${col.Description}"></c:out></td>
                    <td><c:out value="${col.DateOfClaim}"></c:out></td>
                    <td><c:out value="${col.Status}"></c:out></td>                        
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href='UserHome.jsp?loggedInUser=<%=uname%>' class="btn btn-primary">Go Home</a><br/>
    </div>
</body>
<link rel="stylesheet" href="Style.css">
</html>
