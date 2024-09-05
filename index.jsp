<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="container">
		<form action="LoginServlet" method="post">
			<h2>Welcome to Company</h2>
			<h3>Login</h3>
			<label>Username</label><br>
			<input type="text" name="id" placeholder="Enter your username"></input><br>
			<label>Password</label><br>
			<input type="password" name="pass" placeholder="Enter your password"></input><br>
			<button type="submit">Login</button>
		</form>
		<a href="<%=application.getContextPath()%>/register.jsp">New user? Register now...</a>
		<%
			String status=request.getParameter("status");
			if(status!=null && status.equals("0"))
				%><p style="color:red">Invalid credentials!</p>
	</div>
</body>
</html>