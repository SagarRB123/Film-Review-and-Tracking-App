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
import java.sql.SQLException;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
	        PrintWriter out = response.getWriter();

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/film_review_db", "root", "root");
	            String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
	            preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setString(1, username);
	            preparedStatement.setString(2, password);
	            int rowsAffected = preparedStatement.executeUpdate();

	            if (rowsAffected > 0) {
	                out.println("<html><body><h3>Registration Successful!</h3><p>You can now <a href='login.jsp'>login</a> with your credentials.</p></body></html>");
	            } else {
	                out.println("<html><body><h3>Registration Failed!</h3><p>Please try again later.</p></body></html>");
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            out.println("<html><body><h3>Registration Failed!</h3><p>An error occurred. Please try again later.</p></body></html>");
	        } finally {
	            try {
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
