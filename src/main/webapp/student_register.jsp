<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000000;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-family: 'Segoe UI', 'Arial', sans-serif;
            padding: 20px;
        }
        .card {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 2rem;
            color: #ffffff;
            backdrop-filter: blur(0px);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            border-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.2);
        }
        h3 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-weight: bold;
            color: #ffffff;
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            background-color: transparent;
            color: #ffffff;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
        }
        .form-control:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.6);
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.4);
            background-color: transparent;
            color: #ffffff;
        }
        .btn-primary {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #ffffff;
            padding: 0.6rem 1.5rem;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s, border-color 0.3s;
        }
        .btn-primary:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.5);
        }
        .btn-primary:focus,
        .btn-primary:active,
        .btn-primary:focus:active {
            outline: none;
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.4);
            border-color: rgba(255, 255, 255, 0.6);
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
        }
        a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: color 0.3s;
        }
        a:hover {
            color: #ffffff;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <h3>Student Registration</h3>
                <form action="register" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="department" class="form-label">Department</label>
                        <input type="text" class="form-control" id="department" name="department" required>
                    </div>
                    <div class="mb-3">
                        <label for="pin_no" class="form-label">PIN Number</label>
                        <input type="text" class="form-control" id="pin_no" name="pin_no" required>
                    </div>
                    <div class="mb-3">
                        <label for="phone_no" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="phone_no" name="phone_no" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Register</button>
                    <div class="text-center mt-3">
                        Already have an account? <a href="student_login.jsp">Login here</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
