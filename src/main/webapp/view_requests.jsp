<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="models.requests" %>
<%@ page import="models.admin" %>
<%@ page import="dao.RequestDAO" %>
<%
    admin admin = (admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
    RequestDAO dao = new RequestDAO();
    List<requests> pending = dao.getRequestsByStatus("Pending");
    List<requests> approved = dao.getRequestsByStatus("Approved");
    List<requests> rejected = dao.getRequestsByStatus("Rejected");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Certificate Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000;
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
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
            position: relative;
        }

        .top-right {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        h3 {
            text-align: center;
            color: #fff;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .nav-tabs .nav-link {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.1);
            margin-right: 5px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }

        .nav-tabs .nav-link.active {
            background-color: #fff;
            color: #000;
            border-color: #fff;
        }

		.search-bar {
            margin: 20px 0;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff !important;
            border: 1px solid #000 !important;
        }

        .search-bar::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .search-bar:focus {
            background-color: rgba(255, 255, 255, 0.15);
            border-color: #000 !important;
            box-shadow: 0 0 5px rgba(255, 255, 255, 0.3);
            color: #fff;
            outline: none;
        }

        table {
            margin-top: 15px;
            width: 100%;
            color: #fff;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: rgba(44, 83, 100, 0.9);
            color: #fff;
        }

        .table tbody tr {
            background-color: #000 !important;
            color: #fff !important;
        }

        .table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.05) !important;
        }

        .btn-secondary {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            font-weight: 600;
        }

        .btn-secondary:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            color: #fff;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 0.85rem;
            border-radius: 5px;
            font-weight: 600;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            color: #fff;
        }

        .btn-outline-primary {
            border: 2px solid #000 !important;
            color: #000 !important;
            background-color: transparent;
            transition: background-color 0.3s ease, color 0.3s ease;
            font-weight: 600;
        }

        .btn-outline-primary:hover {
            background-color: #000 !important;
            color: #fff !important;
            border-color: #000 !important;
        }

        .form-select, .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            color: #000;
            border: 1px solid #000 !important;
        }

        .form-select:focus, .form-control:focus {
            background-color: rgba(255, 255, 255, 0.15);
            color: #000;
            box-shadow: 0 0 5px rgba(255, 255, 255, 0.3);
            border-color: #000 !important;
            outline: none;
        }

        .status-select option {
            background-color: #fff;
            color: #000;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="top-right">
        <a href="admin_dashboard.jsp" class="btn btn-secondary">← Back to Dashboard</a>
    </div>

    <h3>Manage Certificate Requests</h3>
    <input type="text" id="searchInput" class="form-control search-bar" placeholder="Search by PIN, Certificate Type..." onkeyup="filterRequests()">

    <ul class="nav nav-tabs" id="requestTabs">
        <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="tab" href="#pending">Pending</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#approved">Approved</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#rejected">Rejected</a>
        </li>
    </ul>

    <div class="tab-content mt-3">
        <div class="tab-pane fade show active" id="pending">
            <%= renderTable(pending) %>
        </div>
        <div class="tab-pane fade" id="approved">
            <%= renderTable(approved) %>
        </div>
        <div class="tab-pane fade" id="rejected">
            <%= renderTable(rejected) %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function filterRequests() {
        let input = document.getElementById("searchInput").value.toLowerCase();
        document.querySelectorAll(".tab-pane.active tbody tr").forEach(row => {
            let show = Array.from(row.cells).some(cell => cell.textContent.toLowerCase().includes(input));
            row.style.display = show ? "" : "none";
        });
    }

    document.addEventListener("DOMContentLoaded", function () {
        const hash = window.location.hash;
        if (hash) {
            const triggerTab = document.querySelector(`a[href="${hash}"]`);
            if (triggerTab) {
                new bootstrap.Tab(triggerTab).show();
            }
        }
    });
</script>

<%!
    public String renderTable(List<requests> list) {
        StringBuilder html = new StringBuilder();
        html.append("<table class='table'>");
        html.append("<thead><tr>")
            .append("<th>Request ID</th>")
            .append("<th>Student ID</th>")
            .append("<th>PIN</th>")
            .append("<th>Certificate</th>")
            .append("<th>Status</th>")
            .append("<th>Comment</th>")
            .append("<th>Requested At</th>")
            .append("<th>Action</th>")
            .append("</tr></thead><tbody>");
        for (requests r : list) {
            html.append("<tr>")
                .append("<td>").append(r.getRequest_id()).append("</td>")
                .append("<td>").append(r.getStudent_id()).append("</td>")
                .append("<td>").append(r.getStudent_pin_no()).append("</td>")
                .append("<td>").append(r.getCertificate_type()).append("</td>")
                .append("<td>").append(r.getStatus()).append("</td>")
                .append("<td>").append(r.getAdmin_comment()).append("</td>")
                .append("<td>").append(r.getRequested_at()).append("</td>")
                .append("<td>")
                .append("<form action='admin/update-request' method='post' class='mb-2'>")
                .append("<input type='hidden' name='request_id' value='").append(r.getRequest_id()).append("'/>")
                .append("<select name='status' class='form-select form-select-sm mb-1 status-select' required>")
                .append("<option value='Pending' ").append(r.getStatus().equals("Pending") ? "selected" : "").append(">Pending</option>")
                .append("<option value='Approved' ").append(r.getStatus().equals("Approved") ? "selected" : "").append(">Approved</option>")
                .append("<option value='Rejected' ").append(r.getStatus().equals("Rejected") ? "selected" : "").append(">Rejected</option>")
                .append("</select>")
                .append("<input type='text' name='comment' class='form-control form-control-sm mb-1' value='").append(r.getAdmin_comment()).append("' required/>")
                .append("<button type='submit' class='btn btn-sm btn-success w-100'>Update</button>")
                .append("</form>")
                .append("<a href='view_documents?id=").append(r.getRequest_id()).append("' class='btn btn-sm btn-outline-primary w-100'>View Documents</a>")
                .append("</td>")
                .append("</tr>");
        }
        html.append("</tbody></table>");
        return html.toString();
    }
%>
</body>
</html>
