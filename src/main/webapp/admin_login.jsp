<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000000;
            font-family: 'Segoe UI', sans-serif;
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .card {
            background-color: rgba(0, 0, 0, 0.8);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 30px;
            width: 100%;
            max-width: 400px;
            color: #ffffff;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.05);
            transition: transform 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            border-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.1);
        }
        h3 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #ffffff;
        }
        .form-label {
            color: #d1d1d1;
            font-weight: 500;
        }
        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #ffffff;
            border-radius: 5px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            color: #ffffff;
        }
        .btn-login {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.4);
            color: #ffffff;
            border-radius: 5px;
            font-weight: bold;
            padding: 10px;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        }
        .btn-login:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
        }
    </style>
</head>
<body>
<div class="card">
    <h3>Admin Login</h3>
    <form action="admin/login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-login">Login</button>
    </form>
</div>
</body>
</html>
 