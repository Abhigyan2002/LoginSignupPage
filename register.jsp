<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="container">
		<form action="RegisterServlet" method="post">
			<h2>Be a part of our community</h2>
			<h3>Register</h3>
			<label>Name</label><br>
			<input type="text" name="name" placeholder="Enter your  full name"></input><br>
			<label>Mob No.</label><br>
			<input type="text" name="mob" placeholder="Enter valid 10 digit no."></input><br>
			<label>Password</label><br>
			<input type="password" name="pass" placeholder="Enter strong password"></input><br>
			<label>Re-type Password</label><br>
			<input type="password" name="repass" placeholder=""></input><br>
			<button type="submit">Register</button>
			<button type="reset">Reset</button>
		</form>
		<a href="<%=application.getContextPath()%>/index.jsp">Already registered? Login...</a>
		
		<%
			String status=request.getParameter("status");
			if(status!=null && status.equals("1")){
				%><p style="color:green">Registration successful! Please login.</p>
			<%}
			else{
				String errCode=request.getParameter("error");
				if(errCode!=null && errCode.equals("1")){
					%><p style="color:red">Passwords don't match! Please recheck.</p><%
				}
				else if(errCode!=null && errCode.equals("2")){
					%><p style="color:red">Please Enter a valid 10 digit mobile number.</p><%
				}
			}
		%>
	</div>
</body>
</html>