<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Home</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        color: #333;
        margin: 0;
        padding: 0;
      }
      .container {
        margin-top: 20px;
        width: 120%;
      }
      .search-bar {
        margin-bottom: 20px;
      }
      table {
        width: 100%;
        margin-bottom: 20px;
      }
      th,
      td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }
      th {
        background-color: #444;
        color: #fff;
      }
      .navbar {
        background-color: #444;
      }
    </style>
  </head>
  <body>
    <% String username = (String) request.getAttribute("loggedInUser");
    if(username == null) { username = (String)
    request.getParameter("loggedInUser"); } %>

    <nav class="navbar navbar-expand-md navbar-dark">
      <div class="container">
        <a class="navbar-brand" href="#">Hello <%= username %></a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#collapsibleNavbar"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="LoginUser.jsp">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container">
      <h2>
        <a
          href="./RegisterProduct.jsp?uname=<%=username%>"
          class="btn btn-primary"
          >Register new product</a
        >
      </h2>
      <br /><br />
      <!-- <%
        String productName = request.getParameter("p_name");
        String searchCondition = "";
        if (productName != null && !productName.isEmpty()) {
            searchCondition = " AND (r.ProductName LIKE '%" + productName + "%' OR c.Description LIKE '%" + productName + "%')";
        }
    %> -->
      <sql:setDataSource
        var="dbCon"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/project"
        user="root"
        password="Binchow1428"
      />
      <sql:query dataSource="${dbCon}" var="result">
        select * from registeredproducts WHERE login_id = ?;
        <sql:param value="<%=username%>" />
      </sql:query>
      <div class="row">
        <div class="col-md-6">
          <h2>Registered Products</h2>
          <table class="table table-bordered">
            <thead class="thead-dark">
              <tr>
                <th>Product Name</th>
                <th>Product Serial Number</th>
                <th>Purchase Date</th>
                <th>Add a Claim</th>
                <th>View Claims</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="col" items="${result.rows}">
                <tr>
                  <td><c:out value="${col.productname}" /></td>
                  <td><c:out value="${col.serialno}" /></td>
                  <td><c:out value="${col.Purchasedate}" /></td>
                  <td>
                    <a
                      href="./SubmitProductClaim.jsp?uname=<%=username%>&prodSrNum=${col.serialno}"
                      class="btn btn-primary"
                      >Add a claim</a
                    >
                  </td>
                  <td>
                    <a
                      href="./ViewClaimsByProduct.jsp?uname=<%=username%>&pname=${col.productname}&prodSrNum=${col.serialno}"
                      class="btn btn-secondary"
                      >View Claims</a
                    >
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <sql:query dataSource="${dbCon}" var="res">
            select r.ProductName, c.SerialNumber, c.Description, c.DateOfClaim,
            c.Status from claim c JOIN registeredproducts r ON c.serialNumber =
            r.serialno WHERE c.Username = ?;
            <sql:param value="<%=username%>" />
          </sql:query>
        </div>
        <div class="col-md-6">
          <h2>Product Claims</h2>
          <table class="table table-bordered">
            <thead class="thead-dark">
              <tr>
                <th>Product Name</th>
                <th>Product Serial Number</th>
                <th>Description</th>
                <th>Claim Date</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="coll" items="${res.rows}">
                <tr>
                  <td><c:out value="${coll.ProductName}" /></td>
                  <td><c:out value="${coll.SerialNumber}" /></td>
                  <td><c:out value="${coll.Description}" /></td>
                  <td><c:out value="${coll.DateOfClaim}" /></td>
                  <td><c:out value="${coll.Status}" /></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
