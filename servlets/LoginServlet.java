package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;


public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		String username=request.getParameter("id").trim();
		String password=request.getParameter("pass").trim();
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection cnn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","usrnm","pswrd");
			
			String query = "SELECT * FROM reg_users WHERE name=? AND password=?";
            PreparedStatement pst = cnn.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet result=pst.executeQuery();
            if(result.next())
            {
            	HttpSession session=request.getSession();
            	session.setAttribute("user", username);
            	response.sendRedirect("Welcome.jsp");
            }
            else {
            	//System.out.println("Invalid credentials");
            	response.sendRedirect("index.jsp?status=0");
            }
            result.close();
            pst.close();
            cnn.close();			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
