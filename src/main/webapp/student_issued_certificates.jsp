<%@ page import="models.student, models.requests, java.util.List" %>
<%@ page import="dao.RequestDAO" %>
<%
    student student = (student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("student_login.jsp");
        return;
    }
    RequestDAO reqDAO = new RequestDAO();
    List<requests> approvedRequests = reqDAO.getApprovedRequestsByStudentId(student.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <title>Issued Certificates - GIET Portal</title>
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
            max-width: 1000px;
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
            color: #ffffff;
            border-collapse: collapse;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.8);
        }
        .table th, .table td {
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 12px;
            text-align: center;
            vertical-align: middle;
            background-color: rgba(0, 0, 0, 0.7);
        }
        .table th {
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            font-weight: bold;
        }
        .table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }
        .table td {
            color: #d1d1d1; /* Light grey text for rows */
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
        .btn-download {
            background-color: #28a745;
            border: none;
            color: #ffffff;
            padding: 6px 12px;
        }
        .btn-download:hover {
            background-color: #218838;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="d-flex justify-content-start mb-3">
        <a href="student_dashboard.jsp" class="btn btn-back">Back to Dashboard</a>
    </div>

    <h2>Issued Certificates</h2>

    <div class="table-responsive">
        <table class="table table-hover text-center">
            <thead>
                <tr>
                    <th>Certificate Type</th>
                    <th>Request ID</th>
                    <th>Issued Date</th>
                    <th>Download</th>
                </tr>
            </thead>
            <tbody>
            <% for (requests req : approvedRequests) { %>
                <tr>
                    <td><%= req.getCertificate_type() %></td>
                    <td><%= req.getRequest_id() %></td>
                    <td><%= req.getUpdated_at() %></td>
                    <td>
                        <a href="generateCertificate?requestId=<%= req.getRequest_id() %>" class="btn btn-download">Download PDF</a>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
