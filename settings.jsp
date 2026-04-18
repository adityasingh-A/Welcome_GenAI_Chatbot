<%@ page import="java.sql.*" %>
<%@ page import="com.genai.DBConnection" %>

<%
String username = (String) session.getAttribute("username");

String name = "";
String email = "";

try {
    Connection con = DBConnection.getConnection();

    // 🔥 FIX: username se fetch karo
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM users WHERE username=?"
    );
    ps.setString(1, username);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("name");
        email = rs.getString("email");
        username = rs.getString("username"); // ensure correct value
    }

} catch(Exception e){
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
background: linear-gradient(135deg,#833AB4,#E1306C,#F77737,#FCAF45);
min-height:100vh;
font-family:'Segoe UI',sans-serif;
color:white;
}

.card-custom{
background:rgba(255,255,255,0.15);
backdrop-filter:blur(15px);
border-radius:20px;
padding:25px;
box-shadow:0px 10px 30px rgba(0,0,0,0.3);
}

.form-control{
border-radius:10px;
padding:8px;
font-size:14px;
}

.btn-insta{
background:linear-gradient(45deg,#833AB4,#E1306C,#F77737);
border:none;
color:white;
border-radius:30px;
padding:6px 18px;
}

.section-title{
font-weight:600;
margin-bottom:10px;
}

hr{
border-color:rgba(255,255,255,0.3);
}
</style>
</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">Account Settings</h2>

<div class="card-custom">

<!-- 🔹 PROFILE -->
<div class="mb-4">
<h5 class="section-title">Profile</h5>

<input type="text" class="form-control mb-2" value="<%= name %>" readonly>
<input type="email" class="form-control mb-2" value="<%= email %>" readonly>
<input type="text" class="form-control mb-2" value="<%= username %>" readonly>

</div>

<hr>

<!-- 🔹 CHANGE PASSWORD -->
<div class="mb-4">
<h5 class="section-title">Change Password</h5>

<form action="ChangePasswordServlet" method="post">

<input type="password" name="oldPass" class="form-control mb-2" placeholder="Current Password" required>
<input type="password" name="newPass" class="form-control mb-2" placeholder="New Password" required>

<button class="btn btn-insta btn-sm">Update Password</button>

</form>
</div>

<hr>

<!-- 🔹 ACTIONS -->
<div class="d-flex justify-content-between">
<a href="home.jsp" class="btn btn-light btn-sm">Back</a>
<a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
</div>

</div>
</div>

<!-- 🔥 SWEET ALERT POPUP -->
<%
String msg = (String) session.getAttribute("message");

if(msg != null){
%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
Swal.fire({
    title: 'Notification',
    text: '<%= msg %>',
    icon: '<%= msg.contains("Wrong") ? "error" : "success" %>',
    confirmButtonColor: '#E1306C'
}).then(() => {
    <% session.removeAttribute("message"); %>
});
</script>

<%
}
%>

</body>
</html>