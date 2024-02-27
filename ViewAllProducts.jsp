<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin-top: 20px;
      }
      .container {
        margin-bottom: 30px;
      }
      .navbar {
        margin-bottom: 0;
        background-color: #333;
        color: #fff;
        border-radius: 0;
      }
      .navbar a {
        color: #fff !important;
      }
      .page-header {
        background-color: #f2f2f2;
        padding: 10px 20px;
        border-radius: 4px;
      }
      .form-inline {
        display: flex;
        align-items: baseline;
      }
      .form-inline .form-control {
        width: 60%;
        margin-right: 10px;
      }
      .search-button {
        background-color: #333;
        border-color: #333;
      }
      .search-button:hover {
        background-color: #555;
        border-color: #555;
      }
      .product-table th {
        background-color: #f7f7f7;
      }
      .update-button {
        background-color: #333;
        border-color: #333;
      }
      .update-button:hover {
        background-color: #555;
        border-color: #555;
      }
      a {
        color: #333;
      }
      a:hover {
        color: #555;
        text-decoration: none;
      }
    </style>
    <title>View All Products</title>
  </head>
  <body>
    <% String adminname = (String) request.getParameter("loggedInAdmin"); %>

    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
          <a
            class="navbar-brand"
            href="AdminHome.jsp?loggedInAdmin=<%=adminname%>"
            >Hello <%= adminname %></a
          >
        </div>
        <ul class="nav navbar-nav">
          <li class="active">
            <a href="AdminHome.jsp?loggedInAdmin=<%=adminname%>">Home</a>
          </li>
          <li>
            <a href="./ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>"
              >View All Products</a
            >
          </li>
          <li><a href="LoginAdmin.jsp">Logout</a></li>
        </ul>
      </div>
    </nav>
 <h2>
      <a
        href="./AddNewProduct.jsp?loggedInAdmin=<%=adminname%>"
        class="btn btn-primary"
        >Add New Product</a
      >
    </h2>
    <br />
    <div class="container">
      <div class="page-header">
        <h2>View All Products</h2>
        <form
          action="ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>"
          method="post"
          class="form-inline"
        >
          <div class="form-group">
            <label for="product-name">Enter Product Name:</label>
            <input
              type="text"
              id="product-name"
              name="p_name"
              class="form-control"
            />
          </div>
          <input
            type="submit"
            value="Search Product"
            class="btn btn-primary search-button"
          />
        </form>
      </div>

      <sql:setDataSource
        var="dbCon"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/project"
        user="root"
        password="Binchow1428"
      />

      <sql:query dataSource="${dbCon}" var="res">
        select * from products;
      </sql:query>

      <table class="table product-table">
        <thead>
          <tr>
            <th>Product Serial Number</th>
            <th>Product Name</th>
            <th>Product Model</th>
            <th>Product Color</th>
            <th>Product Company</th>
            <th></th>
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
                <td>
                  <a
                    href="./UpdateProduct.jsp?loggedInAdmin=<%=adminname%>&prodSrNum=${coll.ProductSerialNumber}"
                    class="btn btn-info update-button"
                    >Update</a
                  >
                </td>
              </tr>
            </c:if>
          </c:forEach>
        </tbody>
      </table>
      <a
        href="AdminHome.jsp?loggedInAdmin=<%=adminname%>"
        class="btn btn-primary"
        >Go Home</a
      >
    </div>
  </body>
  <link rel="stylesheet" href="Style.css" />
</html>
