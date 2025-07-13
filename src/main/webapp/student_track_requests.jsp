<%@ page import="models.student, models.requests, java.util.List" %>
<%@ page import="dao.RequestDAO" %>
<%
    student student = (student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("student_login.jsp");
        return;
    }
    RequestDAO reqDAO = new RequestDAO();
    List<requests> studentRequests = reqDAO.getRequestsByStudentId(student.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Certificate Requests - GIET Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000000;
            min-height: 100vh;
            color: #ffffff;
            font-family: 'Segoe UI', 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 30px;
            width: 100%;
            max-width: 1100px;
            backdrop-filter: blur(0px);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.05);
            transition: transform 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .container:hover {
            transform: translateY(-5px) scale(1.02);
            border-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #ffffff;
            font-weight: bold;
        }
        .table {
            color: #d1d1d1;
            border-collapse: collapse;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.8);
        }
        .table th, .table td {
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 12px;
            text-align: center;
            vertical-align: middle;
        }
        .table th {
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            font-weight: bold;
        }
        .table td {
            color: #f1f1f1;
            background-color: rgba(0, 0, 0, 0.7);
        }
        .table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }
        .btn {
            border-radius: 5px;
            padding: 8px 16px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            text-decoration: none !important;
        }
        .btn-back {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #ffffff;
            margin-bottom: 20px;
        }
        .btn-back:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-start mb-3">
        <a href="student_dashboard.jsp" class="btn btn-back">Back to Dashboard</a>
    </div>

    <h2>My Certificate Requests</h2>

    <div class="table-responsive">
        <table class="table table-hover text-center">
            <thead>
                <tr>
                    <th>Request ID</th>
                    <th>Certificate Type</th>
                    <th>Status</th>
                    <th>Admin Comment</th>
                    <th>Requested At</th>
                    <th>Updated At</th>
                </tr>
            </thead>
            <tbody>
            <% for (requests req : studentRequests) { %>
                <tr>
                    <td><%= req.getRequest_id() %></td>
                    <td><%= req.getCertificate_type() %></td>
                    <td><%= req.getStatus() %></td>
                    <td><%= req.getAdmin_comment() %></td>
                    <td><%= req.getRequested_at() %></td>
                    <td><%= req.getUpdated_at() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
