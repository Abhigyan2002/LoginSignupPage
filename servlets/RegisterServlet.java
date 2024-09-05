package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String mob=request.getParameter("mob");
		String pass=request.getParameter("pass");
		String cnfpass=request.getParameter("repass");
		
		if(!pass.equals(cnfpass))
			response.sendRedirect("register.jsp?status=0&error=1");
		else if(mob.length()!=10){
			response.sendRedirect("register.jsp?status=0&error=2");
		}
		else {
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection cnn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521", "usrnm", "pswrd");
	        System.out.println("Connection established!");
	        
	        PreparedStatement pst=cnn.prepareStatement("insert into reg_users(name,mob,password) values(?,?,?)");
	        pst.setString(1, name);
	        pst.setString(2,mob);
	        pst.setString(3, pass);
	        pst.executeUpdate();
	        pst.close();
	        cnn.close();
	        response.sendRedirect("register.jsp?status=1");
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		}
	}

}
