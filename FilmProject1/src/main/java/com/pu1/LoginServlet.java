package com.pu1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        PrintWriter out = response.getWriter();

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/film_review_db", "root", "root");
	            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
	            preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setString(1, username);
	            preparedStatement.setString(2, password);
	            resultSet = preparedStatement.executeQuery();

	            if (resultSet.next()) {
	                // Authentication successful
	                response.sendRedirect("dashboard.jsp");
	            } else {
	                // Authentication failed
	               // response.sendRedirect("login.jsp?error=1");
	                out.println("<html><body><h4><u>Since the username and password are invalid</u>, please proceed to register yourself and then attempt to log in again.</h4><p>Click on <a href='register.jsp'>Register</a> to register yourself</p></body></html>");
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            // Authentication failed due to an exception
	            response.sendRedirect("login.jsp?error=2");
	        } finally {
	            try {
	                if (resultSet != null) {
	                    resultSet.close();
	                }
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                    connection.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
}
}