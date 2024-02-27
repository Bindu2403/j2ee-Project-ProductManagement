<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
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
        .form-control {
            width: 70%;
        }
        .btn-primary {
            margin-top: 10px;
            background-color: #888888;
            border-color: #888888;
        }
        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active {
            background-color: #666666 !important;
            border-color: #666666 !important;
        }
        h2 {
            margin-bottom: 20px;
        }
        .container-fluid{ position: relative;}
        .navbtn{position:abosolute;
        right: 5px;}
    </style>
</head>
<body>

<% String uname = (String) request.getParameter("uname");%>

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
        <a class="navbtn" href='UserHome.jsp?loggedInUser=<%=uname%>' class="btn btn-primary">Home</a>

<div class="container text-center">
    <form action="RegisterProductServlet" method="POST">
        <h2>Register Product</h2>
        <table class="table">
            <tr>
                <td>Username</td>
                <td><input type="text" name="username" readonly="readonly" value="<%=uname%>"></td>
            </tr>
            <tr>
                <td>Product Name</td>
                <td><input type="text" name="productName" class="form-control"></td>
            </tr>
            <tr>
                <td>Serial Number</td>
                <td><input type="number" name="productSerialNum" min="10001" max="99999" class="form-control"></td>
            </tr>
            <tr>
                <td>Purchase Date</td>
                <td><input type="date" name="purchaseDate" class="form-control"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Submit" class="btn btn-primary"></td>
            </tr>
        </table>
    </form>
</div>

<div class="container text-center">
    <form action="RegisterProduct.jsp?uname=<%=uname%>" method="post">
        <table class="table">
            <tr>
                <td>Enter Product Name:</td>
                <td><input type="text" name="p_name" class="form-control">&nbsp;&nbsp;&nbsp;<input type="submit" value="Search Product" class="btn btn-primary"></td>
            </tr>
        </table>
    </form> 
    
    <sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/project" user="root"
            password="Binchow1428" />
    
    <sql:query dataSource="${dbCon}" var="res">
            select * from products;
    </sql:query>
    
    <h2>Available Products</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Product Serial Number</th>
                <th>Product Name</th>
                <th>Product Model</th>
                <th>Product Color</th>
                <th>Product Company</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="coll" items="${res.rows}">
                <c:set var="pn" value="${coll.ProductName}" />
                <c:set var="entered_pname" value="${param.p_name}" />
                
                <c:if test="${fn:containsIgnoreCase(pn, entered_pname)}">
                    <tr>
                        <td><c:out value="${coll.ProductSerialNumber}"></c:out></td>
                        <td><c:out value="${coll.ProductName}"></c:out></td>
                        <td><c:out value="${coll.ProductModel}"></c:out></td>
                        <td><c:out value="${coll.ProductColor}"></c:out></td>    
                        <td><c:out value="${coll.ProductCompany}"></c:out></td>                                            
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <br>
    <br>
</div>
</body>
</html>
