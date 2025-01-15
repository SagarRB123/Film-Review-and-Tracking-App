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
 * Servlet implementation class AddFilmServlet
 */
public class AddFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFilmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String title = request.getParameter("title");
	        String director = request.getParameter("director");
	        int year = Integer.parseInt(request.getParameter("year"));

	        try {
	            // Load the MySQL JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish connection to MySQL database
	            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/film_review_db","root","root")) {
	                // SQL query to insert new film into the database
	                String sql = "INSERT INTO films (title, director, year) VALUES (?, ?, ?)";

	                // Create prepared statement with the SQL query
	                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	                    // Set parameters for the prepared statement
	                    preparedStatement.setString(1, title);
	                    preparedStatement.setString(2, director);
	                    preparedStatement.setInt(3, year);

	                    // Execute the SQL query to insert new film
	                    int rowsAffected = preparedStatement.executeUpdate();

	                    if (rowsAffected > 0) {
	                        // Film added successfully
	                        response.sendRedirect("filmList.jsp");
	                    } else {
	                        // Film adding failed
	                        response.sendRedirect("addFilm.jsp");
	                    }
	                }
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("addFilm.jsp");
	        }
	    }
	}


