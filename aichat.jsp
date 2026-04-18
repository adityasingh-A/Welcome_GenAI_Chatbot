<%@ page session="true" %>
<%
String reply = (String) request.getAttribute("reply");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AI Assistant</title>

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
padding:30px;
box-shadow:0px 10px 30px rgba(0,0,0,0.3);
}
</style>

</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">AI Assistant</h2>

<div class="card-custom">

<form action="AIChatServlet" method="post">

<input type="text" name="message"
class="form-control mb-3"
placeholder="Ask something..."
required>

<button class="btn btn-dark">Send</button>

</form>

<% if(reply != null){ %>

<hr>

<h5>AI Reply:</h5>
<p><%= reply %></p>

<% } %>

<br>

<a href="home.jsp" class="btn btn-light">Back</a>

</div>

</div>

</body>
</html>