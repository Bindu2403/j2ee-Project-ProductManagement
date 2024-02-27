<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f2f2f2;
            font-family: 'Arial', sans-serif;
        }

        .login-form {
            border-radius: 2px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            background-color: #fff;
        }

        .login-form h1 {
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-label {
            color: #555;
        }

        .form-control {
            border-radius: 2px;
            border: 1px solid #ccc;
        }

        .form-control:focus {
            border-color: #aaa;
            box-shadow: none;
        }

        .btn-primary {
            border-radius: 2px;
            background-color: #333;
            border: 1px solid #333;
            padding: 10px 30px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #555;
            border-color: #555;
        }

        .center-links {
            text-align: center;
            margin-top: 20px;
        }

        .center-links a {
            display: inline-block;
            margin: 5px;
            padding: 8px 20px;
            border-radius: 2px;
            color: #555;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .center-links a:hover {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-form">
                    <h1>Login User</h1>
                    <form action="UserLoginServlet" method="POST">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username">
                        </div>
                        <div class="mb-3">
                            <label for="u_password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="u_password" name="u_password">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                    <div class="center-links">
                        <a href="./CreateUserAccountForm.jsp">Register new user</a>
                        <a href="./LoginAdmin.jsp">Login as an Admin</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
