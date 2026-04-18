<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");

    if (user == null) {
        response.sendRedirect("signin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>GenAI Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #833AB4, #E1306C, #F77737, #FCAF45);
        min-height: 100vh;
        font-family: 'Segoe UI', sans-serif;
        color: white;
    }

    .navbar-custom {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
    }

    .card-custom {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(15px);
        border-radius: 20px;
        padding: 30px;
        box-shadow: 0px 10px 30px rgba(0,0,0,0.3);
        transition: 0.3s;
        color: white;
    }

    .card-custom:hover {
        transform: translateY(-8px);
    }

    .welcome-text {
        animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .btn-logout {
        border-radius: 30px;
        background: white;
        color: #E1306C;
        border: none;
    }

    .btn-insta {
        background: linear-gradient(45deg, #833AB4, #E1306C, #F77737);
        border: none;
        color: white;
        border-radius: 30px;
    }
</style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom px-4">
    <a class="navbar-brand fw-bold text-white" href="#">GenAI Dashboard</a>

    <div class="ms-auto">
        <a href="LogoutServlet" class="btn btn-logout">Logout</a>
    </div>
</nav>

<!-- Welcome Section -->
<div class="container mt-5">
    <div class="text-center mb-5 welcome-text">
        <h1>Welcome, <%= user %></h1>
        <p class="lead">Explore the Power of Artificial Intelligence</p>
    </div>

    <!-- Cards Section -->
    <div class="row g-4">

<div class="col-md-4">
<div class="card-custom text-center">
<h3>AI Chat</h3>
<p>Interact with AI powered assistant.</p>

<a href="aichat.jsp" class="btn btn-insta">
Explore
</a>

</div>
</div>

<div class="col-md-4">
<div class="card-custom text-center">
<h3>Analytics</h3>
<p>View AI insights and statistics.</p>

<a href="analytics.jsp" class="btn btn-insta">
View
</a>

</div>
</div>

<div class="col-md-4">
<div class="card-custom text-center">
<h3>Settings</h3>
<p>Manage your account preferences.</p>

<a href="settings.jsp" class="btn btn-insta">
Manage
</a>

</div>
</div>

</div>
</div>

</body>
</html>
