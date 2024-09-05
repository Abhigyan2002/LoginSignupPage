<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%
		HttpSession currentSession=request.getSession(false);
		if(currentSession==null || currentSession.getAttribute("user")==null){
			response.sendRedirect("index.jsp");
		}
		
			
		
	%>
	
	
	<div class="container">
		
		<h1>Welcome <%=session.getAttribute("user") %></h1>
		<p>Welcome to our lovely community of passionate tech enthusiasts.</p>
		<p>Are you ready to dive deep and explore the world of Servlets?</p>
		<p>Technologies used: Java Servlet, HTML, CSS, JS, JDBC, Oracle 23ai</p>
		<a href="<%=application.getContextPath() %>/LogoutServlet">Logout</a>
	</div>
	
</body>
</html>