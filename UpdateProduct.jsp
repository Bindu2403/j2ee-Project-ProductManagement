<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #333;
            color: #fff;
            padding: 15px 0;
        }
        .navbar-brand {
            font-size: 24px;
            color: #fff;
        }
        .container {
            margin-top: 20px;
        }
        .form-control {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .btn-primary {
            background-color: #333;
            border: 1px solid #333;
        }
        .btn-primary:hover {
            background-color: #555;
            border: 1px solid #555;
        }
        h2 {
            margin-top: 20px;
        }
        table {
            width: 60%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn-back {
            display: block;
            width: 100px;
            margin: 20px auto;
            text-align: center;
        }
    </style>
</head>
<body>

<% 
String adminname = (String) request.getParameter("loggedInAdmin");
String prodSrNum = (String) request.getParameter("prodSrNum");
%>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Hello <%= adminname %></a>    
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Home</a></li>
            <li><a href="./ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>">View All Products</a></li>
            <li><a href='LoginAdmin.jsp'>Logout</a></li>  
        </ul>
    </div>
</nav>

<div class="container">
    <sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/project" user="root"
            password="Binchow1428" />
            
    <sql:query dataSource="${dbCon}" var="result">
        select * from products WHERE ProductSerialNumber = ?;
        <sql:param value="<%=prodSrNum%>" />
    </sql:query>
    
    <c:forEach var="col" items="${result.rows}">    
        <form action="UpdateProductServlet" method="POST">
            <input type="hidden" name="loggedInAdmin" value="<%=adminname%>">
            <h2 class="text-center">Update Product</h2>
            <table>
                <tr>
                    <td>Product Serial Number</td>
                    <td><input type="number" name="prodSerialNum" readonly="readonly" value="<%=prodSrNum%>" class="form-control"></td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td><input type="text" name="prodName" value="${col.ProductName}" class="form-control"></td>
                </tr>
                <tr>
                    <td>Product Model</td>
                    <td><input type="text" name="prodModel" value="${col.ProductModel}" class="form-control"></td>
                </tr>
                <tr>
                    <td>Product Color</td>
                    <td><input type="text" name="prodColor" value="${col.ProductColor}" class="form-control"></td>
                </tr>
                <tr>
                    <td>Product Company</td>
                    <td><input type="text" name="prodCompany" value="${col.ProductCompany}" class="form-control"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit" class="btn btn-primary"></td>
                </tr>
            </table>
        </form>
    </c:forEach>
    <a href='ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>' class="btn btn-primary btn-back">Go Back</a><br/>
</div>

</body>
<link rel="stylesheet" href="Style.css">
</html>
