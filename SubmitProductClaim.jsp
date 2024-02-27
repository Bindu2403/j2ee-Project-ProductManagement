<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        form {
            margin-top: 30px;
        }
        table {
            width: 40%;
            border: 1px solid #dddddd;
            border-collapse: collapse;
            margin: 0 auto;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 6px 12px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #333;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #23527c;
        }
        .btn-primary {
            margin-top: 10px;
            background-color: #333;
            border-color: #337ab7;
        }
        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active {
            background-color: #333 !important;
            border-color: #23527c !important;
        }
    </style>
    <title>Submit Product Claim</title>
</head>
<body>

<% String uname = (String) request.getParameter("uname");%>
<% String prodSerialNum = (String) request.getParameter("prodSrNum");%>

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
    <form action="SubmitProductClaimServlet" method="POST">
        <h2>Submit Product Claim</h2>
        <table>
            <tr>
                <td>Username</td>              
                <td><input type="text" name="username" readonly="readonly" value="<%=uname%>"></td>
            </tr>
            <tr>
                <td>Product Serial Number</td>
                <td><input type="number" name="prodSerialNumber" readonly="readonly" value="<%=prodSerialNum%>"></td>
            </tr>
            <tr>
                <td>Date of Claim</td>
                <td><input type="date" name="claimDate"></td>
            </tr>
            <tr>
                <td>Description of Issue</td>
                <td><input type="text" name="issueDescription"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Submit"></td>
            </tr>
        </table>
    </form>
    <br>
    <a href='UserHome.jsp?loggedInUser=<%=uname%>' class="btn btn-primary">Go Home</a><br/>
</div>
</body>
</html>
