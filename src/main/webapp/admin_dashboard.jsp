<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="models.admin" %>
<%
    admin admin = (admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000000;
            font-family: 'Segoe UI', sans-serif;
            color: #ffffff;
            min-height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            height: 60px;
            display: flex;
            align-items: center;
        }
        .navbar-brand {
            color: #ffffff;
            font-weight: bold;
            font-size: 1.5rem;
        }
        .navbar-brand:hover {
            color: #ffffff;
            opacity: 0.8;
        }
        .btn-outline-light {
            border: 2px solid rgba(255, 255, 255, 0.4);
            color: #ffffff;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        }
        .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
        }
        .content-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .card {
            background-color: rgba(0, 0, 0, 0.7);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 30px;
            color: #ffffff;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.05);
            transition: transform 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }
        .card:hover {
            transform: translateY(-5px);
            border-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.1);
        }
        h4 {
            margin-bottom: 25px;
            font-weight: bold;
            color: #ffffff;
        }
        .btn-manage {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.4);
            color: #ffffff;
            border-radius: 5px;
            font-weight: bold;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        }
        .btn-manage:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg px-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Admin Panel</a>
        <div class="d-flex">
            <a href="admin/logout" class="btn btn-outline-light">Logout</a>
        </div>
    </div>
</nav>

<div class="content-wrapper">
    <div class="card">
        <h4>Welcome, <%= admin.getName() %></h4>
        <p class="mb-4">Use the button below to manage and review certificate requests submitted by students.</p>
        <a href="view_requests.jsp" class="btn btn-manage">Manage Certificate Requests</a>
    </div>
</div>
</body>
</html>
