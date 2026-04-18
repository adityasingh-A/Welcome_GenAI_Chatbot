<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sign In - GenAI</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #8E44AD, #E1306C);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI', sans-serif;
    }

    .form-card {
        background: #ffffff;
        padding: 40px;
        border-radius: 20px;
        width: 400px;
        box-shadow: 0px 15px 35px rgba(0,0,0,0.2);
        animation: fadeIn 1s ease;
        color: #333333;
    }

    .form-control {
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    .form-control:focus {
        border-color: #E1306C;
        box-shadow: 0 0 5px rgba(225,48,108,0.5);
    }

    .btn-custom {
        border-radius: 8px;
        font-weight: 600;
        background-color: #E1306C;
        border: none;
        color: white;
        padding: 10px;
        transition: 0.3s ease;
    }

    .btn-custom:hover {
        background-color: #8E44AD;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.9); }
        to { opacity: 1; transform: scale(1); }
    }

    a {
        color: #E1306C;
        text-decoration: none;
        font-weight: 500;
    }

    a:hover {
        color: #8E44AD;
    }

    h2 {
        color: #E1306C;
        font-weight: bold;
    }
</style>
</head>

<body>

<div class="form-card">
    <h2 class="text-center mb-4">Login to GenAI</h2>

    <form action="SigninServlet" method="post">

        <div class="mb-3">
            <input type="text" class="form-control" name="username" placeholder="Username" required>
        </div>

        <div class="mb-3">
            <input type="password" class="form-control" name="password" placeholder="Password" required>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-custom">Login</button>
        </div>

        <div class="text-center mt-3">
            Don't have an account? 
            <a href="signup.jsp">Sign Up</a>
        </div>

    </form>
</div>

<%
String msg = (String) session.getAttribute("message");

if(msg != null){
    session.removeAttribute("message"); // 🔥 pehle remove
%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
Swal.fire({
    title: 'Success!',
    text: '<%= msg %>',
    icon: '<%= msg.contains("Wrong") ? "error" : "success" %>',
    confirmButtonColor: '#E1306C'
});
</script>

<%
}
%>

</body>
</html>