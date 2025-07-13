<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>GIET Student Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000000; /* Pure black background */
            min-height: 100vh;
            color: #ffffff;
            font-family: 'Segoe UI', 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .header {
            background-color: transparent;
            color: #ffffff;
            padding: 2rem;
            text-align: center;
            border-radius: 15px;
            margin-bottom: 2rem;
            border: 2px solid rgba(255, 255, 255, 0.2);
            box-shadow: none;
            width: 100%;
            max-width: 800px;
        }
        .header h2 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        .container {
            max-width: 900px;
            width: 100%;
        }
        .card {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            color: #ffffff;
            padding: 2rem;
            margin: 1rem 0;
            text-align: center;
            backdrop-filter: blur(0px); /* Optional slight blur effect, can remove if pure transparent */
            transition: transform 0.3s, box-shadow 0.3s, border-color 0.3s;
        }
        .card:hover {
            transform: translateY(-5px) scale(1.02);
            border-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.2);
        }
        .btn-custom {
            padding: 0.7rem 2rem;
            font-weight: 500;
            font-size: 1.1rem;
            border-radius: 8px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            background-color: transparent;
            color: #ffffff;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s, border-color 0.3s;
        }
        .btn-custom:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
        }
        .text-muted {
            color: rgba(255, 255, 255, 0.6) !important;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>GIET Certificate Request Portal</h2>
    <p class="mb-0">Seamless certificate services for students and admins</p>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card">
                <h5 class="mb-3">Student Login</h5>
                <p class="text-muted">Access your dashboard to request certificates.</p>
                <a href="student_login.jsp" class="btn btn-custom">Login as Student</a>
            </div>
        </div>
        <div class="col-md-5">
            <div class="card">
                <h5 class="mb-3">Admin Login</h5>
                <p class="text-muted">Manage certificate requests and student queries.</p>
                <a href="admin_login.jsp" class="btn btn-custom">Login as Admin</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
