<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sign Up - GenAI</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    body {
        background: linear-gradient(135deg, #FC8019, #E65C00);
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
        animation: slideIn 0.8s ease;
        color: #333333;
    }

    .form-control {
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    .form-control:focus {
        border-color: #FC8019;
        box-shadow: 0 0 5px rgba(252,128,25,0.5);
    }

    .btn-custom {
        border-radius: 8px;
        font-weight: 600;
        background-color: #FC8019;
        border: none;
        color: white;
        padding: 10px;
    }

    .btn-custom:hover {
        background-color: #E65C00;
    }

    @keyframes slideIn {
        from { opacity: 0; transform: translateY(25px); }
        to { opacity: 1; transform: translateY(0); }
    }

    a {
        color: #FC8019;
        text-decoration: none;
        font-weight: 500;
    }

    h2 {
        color: #FC8019;
        font-weight: bold;
    }
</style>
</head>

<body>

<div class="form-card">
    <h2 class="text-center mb-4">Create Account</h2>

    <form action="SignupServlet" method="post">

        <div class="mb-3">
            <input type="text" class="form-control" name="name" placeholder="Full Name" required>
        </div>

        <div class="mb-3">
            <input type="email" class="form-control" name="email" placeholder="Email Address" required>
        </div>

        <div class="mb-3">
            <input type="text" class="form-control" name="username" placeholder="Username" required>
        </div>

        <div class="mb-3">
            <input type="password" class="form-control" name="password" placeholder="Password" required>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-custom">Register</button>
        </div>

        <div class="text-center mt-3">
            Already have an account? 
            <a href="signin.jsp">Sign In</a>
        </div>

    </form>
</div>

<%
String msg = (String) request.getAttribute("message");
String redirect = (String) request.getAttribute("redirectPage");

if(msg != null){
%>

<script>
console.log("Message: <%= msg %>"); // debug

Swal.fire({
    title: 'Success!',
    text: '<%= msg %>',
    icon: 'success'
}).then(() => {
    window.location.href = '<%= redirect %>';
});
</script>

<%
}
%>
</body>
</html>