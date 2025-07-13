<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.requested_files, java.util.List" %>
<%@ page session="true" %>
<%
    List<requested_files> files = (List<requested_files>) request.getAttribute("files");
    int requestId = 0;
    if (request.getAttribute("requestId") != null) {
        requestId = (int) request.getAttribute("requestId");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Documents Submitted for Certificate Request</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.6);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 20px;
            margin-top: 30px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.05);
        }
        h4 {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .list-group-item {
            background-color: rgba(255, 255, 255, 0.05);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .list-group-item:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        .filename {
            max-width: 60%;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .btn-outline-primary {
            border: 2px solid #fff !important;
            color: #fff !important;
            background-color: transparent;
            transition: background-color 0.3s ease, color 0.3s ease;
            border-radius: 5px;
        }
        .btn-outline-primary:hover {
            background-color: #fff;
            color: #000 !important;
            border-color: #fff !important;
        }
        .btn-secondary {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-secondary:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    
    <div class="top-bar">
        <a href="view_requests.jsp" class="btn btn-secondary">⬅ Back</a>
        <h4>Request ID: <%= requestId %></h4>
        <div></div>
    </div>
    
    <% if (files != null && !files.isEmpty()) { %>
        <ul class="list-group">
            <% for (requested_files f : files) { %>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span class="filename" title="<%= f.getFile_name() %>"><%= f.getFile_name() %></span>
                    <a href="<%= f.getFile_path() %>" class="btn btn-outline-primary btn-sm" target="_blank">
                        View / Download
                    </a>
                </li>
            <% } %>
        </ul>
    <% } else { %>
        <div class="alert alert-warning mt-3">No files submitted for this request.</div>
    <% } %>

</div>
</body>
</html>
