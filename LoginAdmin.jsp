<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Admin</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<!-- Add custom CSS -->
<style>
body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
}

.container {
	margin-top: 40px;
	max-width: 500px;
	padding: 15px;
	border-radius: 2px;
	background-color: #fff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #333;
	font-size: 1.5em;
	margin-bottom: 30px;
}

.form-control {
	border-color: #333;
	border-radius: 2px;
	padding: 10px;
}

.btn-primary {
	background-color: #333;
	color: white;
	font-weight: bold;
	border-radius: 2px;
	padding: 10px 20px;
}

.form-group a {
	display: block;
	color: #333;
	margin-top: 15px;
	text-decoration: none;
}

.form-group a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Login Admin</h1>
		<form action="AdminLoginServlet" method="POST">
			<div class="form-group">
				<label for="adminname">Admin Name</label>
				<input type="text" name="adminname" class="form-control" id="adminname">
			</div>
			<div class="form-group">
				<label for="a_password">Password</label>
				<input type="password" name="a_password" class="form-control" id="a_password">
			</div>
			<div class="form-group">
				<input type="submit" value="Submit" class="btn btn-primary">
			</div>
			<div class="form-group">
				<a href="./LoginUser.jsp">Login as a User</a>
			</div>
		</form>
	</div>
</body>
</html>
