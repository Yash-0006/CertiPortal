<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Request Certificate - GIET Portal</title>
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
        .card {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            color: #ffffff;
            padding: 30px;
            width: 100%;
            max-width: 600px;
            backdrop-filter: blur(0px);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.05);
            transition: transform 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px) scale(1.02);
            border-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }
        .header {
            color: #ffffff;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-select, .form-control {
            border-radius: 5px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            background-color: rgba(0, 0, 0, 0.6);
            color: #ffffff;
            backdrop-filter: blur(0px);
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .form-select:focus, .form-control:focus {
            border-color: rgba(255, 255, 255, 0.6);
            box-shadow: 0 0 0 0.25rem rgba(255, 255, 255, 0.3);
            background-color: rgba(0, 0, 0, 0.8);
            color: #ffffff;
        }
        option {
            background-color: #000000;
            color: #ffffff;
        }
        .btn {
            border-radius: 5px;
            padding: 10px 20px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease, border-color 0.3s ease;
            text-decoration: none !important;
        }
        .btn-primary {
            background-color: transparent;
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #ffffff;
        }
        .btn-primary:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
        }
        .btn-outline-light {
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #ffffff;
        }
        .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
        }
        ol, ul {
            padding-left: 1.2rem;
        }
        ol li, ul li {
            margin-bottom: 8px;
        }
        h5 {
            margin-top: 20px;
            color: #ffffff;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="card shadow-lg">
    <h2 class="header">Request a Certificate</h2>
    <form action="request" method="post" enctype="multipart/form-data" class="mt-4">
        <div class="mb-3">
            <label for="certificate" class="form-label">Select Certificate Type</label>
            <select class="form-select" id="certificate" name="certificate_type" onchange="showDetails()" required>
                <option value="" disabled selected>Select</option>
                <option value="TC">Transfer Certificate (TC)</option>
                <option value="Conduct">Conduct Certificate</option>
                <option value="Bonafide">Bonafide Certificate</option>
            </select>
        </div>
        <div id="procedure" class="mb-3" style="display: none;">
            <h5>Procedure</h5>
            <ol id="procedure-list" class="text-light"></ol>
        </div>
        <div id="requirements" class="mb-3" style="display: none;">
            <h5>Required Documents</h5>
            <ol id="requirements-list" class="text-light"></ol>
        </div>
        <div class="mb-3">
            <label for="files" class="form-label">Upload Documents</label>
            <input class="form-control" type="file" name="documents" id="files" multiple required>
        </div>
        <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn btn-primary">Finish</button>
            <a href="student_dashboard.jsp" class="btn btn-outline-light">Cancel</a>
        </div>
    </form>
</div>

<script>
    function showDetails() {
        const cert = document.getElementById("certificate").value;
        const procList = document.getElementById("procedure-list");
        const reqList = document.getElementById("requirements-list");
        document.getElementById("procedure").style.display = 'block';
        document.getElementById("requirements").style.display = 'block';
        procList.innerHTML = '';
        reqList.innerHTML = '';
        
        let procSteps = [];
        let reqs = [];
        
        if (cert === 'TC') {
            procSteps = ["Clear all pending dues.", "Ensure conduct certificate is ready.", "Submit necessary documents online."];
            reqs = ["Fee Receipt", "Conduct Certificate"];
        } else if (cert === 'Conduct') {
            procSteps = ["Must have Transfer Certificate ready.", "Submit request with required documents."];
            reqs = ["Transfer Certificate"];
        } else if (cert === 'Bonafide') {
            procSteps = ["Used for verification/study purposes.", "Submit valid ID and payment proof."];
            reqs = ["Student ID", "Fee Receipt"];
        }
        
        procSteps.forEach(step => {
            const li = document.createElement('li');
            li.innerText = step;
            procList.appendChild(li);
        });
        
        reqs.forEach(doc => {
            const li = document.createElement('li');
            li.innerText = doc;
            reqList.appendChild(li);
        });
    }
</script>
</body>
</html>
