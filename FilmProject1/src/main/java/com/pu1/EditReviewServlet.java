package com.pu1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class EditReviewServlet
 */
public class EditReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 int reviewId = Integer.parseInt(request.getParameter("review_id"));
	        String reviewerName = request.getParameter("reviewer_name");
	        String reviewText = request.getParameter("review_text");

	        // Database connection parameters
	        String jdbcUrl = "jdbc:mysql://localhost:3306/film_review_db";
	        String dbUsername = "root";
	        String dbPassword = "root";

	        try {
	            // Load MySQL JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish connection to MySQL database
	            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
	                // SQL query to update review details
	                String sql = "UPDATE reviews SET reviewer_name = ?, review_text = ? WHERE review_id = ?";

	                // Create prepared statement
	                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	                    // Set parameters for the prepared statement
	                    preparedStatement.setString(1, reviewerName);
	                    preparedStatement.setString(2, reviewText);
	                    preparedStatement.setInt(3, reviewId);

	                    // Execute the SQL query to update review details
	                    int rowsAffected = preparedStatement.executeUpdate();

	                    if (rowsAffected > 0) {
	                        // Review details updated successfully
	                        response.sendRedirect("reviewList.jsp");
	                    } else {
	                        // Review details updating failed
	                        response.getWriter().println("Failed to update review details.");
	                    }
	                }
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            response.getWriter().println("An error occurred while updating review details.");
	        }
	    }
	}


