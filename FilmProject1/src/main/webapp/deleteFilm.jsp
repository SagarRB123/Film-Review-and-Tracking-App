<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Film</title>
    <style>
        /* CSS styles can go here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://www.bhmpics.com/downloads/filming-background/4.kinofilm-streift-blauen-hintergrund-ab_1017-23456.jpg'); /* Add your image path here */
            background-size: cover;
            background-position: center;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
             background-color: rgba(255, 255, 255, 0.5);
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            margin-top: 20px;
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: auto;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Film</h2>
        
        <% 
            // Check if the form is submitted
            if (request.getMethod().equals("POST")) {
                // Get the film ID from the form submission
                int filmId = Integer.parseInt(request.getParameter("filmId"));
                
                // JDBC URL, username, and password for MySQL connection
                String jdbcUrl = "jdbc:mysql://localhost:3306/film_review_db";
                String dbUsername = "root";
                String dbPassword = "root";

                try {
                    // Load the MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection to MySQL database
                    try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
                        // SQL query to delete film from the database
                        String sql = "DELETE FROM films WHERE film_id = ?";

                        // Create prepared statement with the SQL query
                        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                            // Set the film ID parameter
                            preparedStatement.setInt(1, filmId);

                            // Execute the SQL query to delete film
                            int rowsAffected = preparedStatement.executeUpdate();

                            // Check if deletion was successful
                            if (rowsAffected > 0) {
                                // Film deleted successfully, redirect to filmList.jsp
                                response.sendRedirect("filmList.jsp");
                            } else {
        %>
                                <p>No film found with ID : <%= filmId %></p>
        <%
                            }
                        }
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
        %>
                    <p>An error occurred while deleting the film. Please try again later.</p>
        <%
                }
            }
        %>
        
        <!-- Delete Film Form -->
        <form action="" method="post">
            <label for="filmId">Enter Film ID to Delete:</label>
            <input type="number" id="filmId" name="filmId" required>
            <input type="submit" value="Delete">
        </form>
    </div>
</body>
</html>
