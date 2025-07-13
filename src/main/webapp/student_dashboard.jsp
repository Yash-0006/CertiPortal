<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="models.student" %>
<%
    student student = (student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("student_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #000000;
            min-height: 100vh;
            color: #ffffff;
            font-family: 'Segoe UI', 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: transparent !important;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            backdrop-filter: blur(0px);
        }
        .navbar-brand {
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none !important;
        }
        .navbar-brand:hover {
            color: #ffffff;
            text-decoration: none !important;
        }
        .profile-info {
            display: flex;
            align-items: center;
        }
        .profile-info span {
            margin-right: 1rem;
            color: rgba(255, 255, 255, 0.8);
        }
        .btn-logout {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #ffffff;
            padding: 0.5rem 1.2rem;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease, border-color 0.3s ease;
            text-decoration: none !important;
        }
        .btn-logout:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            color: #ffffff;
            border-color: rgba(255, 255, 255, 0.6);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            text-decoration: none !important;
        }
        .btn-logout:focus,
        .btn-logout:active,
        .btn-logout:focus:active {
            outline: none;
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            border-color: rgba(255, 255, 255, 0.6);
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.4);
            text-decoration: none !important;
        }
        .dashboard {
            margin-top: 40px;
            padding: 20px;
            text-align: center;
        }
        .dashboard h2 {
            margin-bottom: 30px;
            color: #ffffff;
        }
        .card {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            color: #ffffff;
            padding: 2rem;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
            backdrop-filter: blur(0px);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.05);
            text-align: center;
        }
        .card:hover {
            transform: translateY(-5px) scale(1.02);
            border-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.15);
        }
        .card-title {
            color: #ffffff;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .card-text {
            margin-bottom: 1.5rem;
            color: rgba(255, 255, 255, 0.8);
        }
        .bi {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #ffffff;
            transition: transform 0.3s ease, color 0.3s ease;
        }
        .card:hover .bi {
            transform: scale(1.2);
            color: rgba(255, 255, 255, 0.8);
        }
        .btn {
            border-radius: 5px;
            padding: 0.6rem 1.5rem;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease, border-color 0.3s ease;
            align-self: center;
            min-width: 150px;
            text-decoration: none !important;
        }
        .btn-primary, .btn-outline-primary, .btn-outline-secondary {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #ffffff;
        }
        .btn:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
            text-decoration: none !important;
        }
        .btn:focus,
        .btn:active,
        .btn:focus:active {
            outline: none;
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.4);
            border-color: rgba(255, 255, 255, 0.6);
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            text-decoration: none !important;
        }
    </style>
</head>
<body>

<nav class="navbar">
    <a class="navbar-brand" href="#">CertiPortal</a>
    <div class="profile-info">
        <span>Welcome, <%= student.getName() %></span>
        <a href="logout" class="btn-logout">Logout</a>
    </div>
</nav>

<div class="container dashboard">
    <h2>Student Dashboard</h2>
    <div class="row g-4 justify-content-center">
        <div class="col-md-4">
            <div class="card d-flex">
                <i class="bi bi-file-earmark-text"></i>
                <h5 class="card-title">Request Certificate</h5>
                <p class="card-text">Apply for TC, Bonafide, Conduct, etc.</p>
                <a href="request_certificate.jsp" class="btn btn-primary">Request Now</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card d-flex">
                <i class="bi bi-graph-up"></i>
                <h5 class="card-title">Track Request</h5>
                <p class="card-text">Track your pending requests and admin comments.</p>
                <a href="student_track_requests.jsp" class="btn btn-outline-primary">Track Requests</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card d-flex">
                <i class="bi bi-folder2-open"></i>
                <h5 class="card-title">Issued Certificates</h5>
                <p class="card-text">Download certificates issued by admin.</p>
                <a href="student_issued_certificates.jsp" class="btn btn-outline-secondary">View Issued</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
