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
 * Servlet implementation class AddReviewServlet
 */
public class AddReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve parameters from the request
        int filmId = Integer.parseInt(request.getParameter("filmId"));
        String reviewerName = request.getParameter("reviewerName");
        String reviewText = request.getParameter("reviewText");

        // JDBC URL, username, and password for MySQL connection
        String jdbcUrl = "jdbc:mysql://localhost:3306/film_review_db";
        String dbUsername = "root";
        String dbPassword = "root";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to MySQL database
            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
                // SQL query to insert a new review
                String sql = "INSERT INTO reviews (film_id, reviewer_name, review_text) VALUES (?, ?, ?)";

                // Create prepared statement
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, filmId);
                preparedStatement.setString(2, reviewerName);
                preparedStatement.setString(3, reviewText);

                // Execute the prepared statement to insert the review
                int rowsInserted = preparedStatement.executeUpdate();
                if (rowsInserted > 0) {
                	 response.sendRedirect("reviewList.jsp");
                } else {
                    out.println("<h2>Failed to add review.</h2>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<h2>An error occurred while adding the review.</h2>");
        }
    }
	}


