<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Review</title>
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
            max-width: 400px;
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
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Review</h2>
        <form action="" method="post">
            <label for="review_id">Review ID:</label>
            <input type="text" id="review_id" name="review_id" required>

            <input type="submit" value="Delete Review">
        </form>
    </div>
</body>
</html>

<%
    if (request.getMethod().equals("POST")) {
        // Process form submission
        int reviewId = Integer.parseInt(request.getParameter("review_id"));

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/film_review_db";
        String dbUsername = "root";
        String dbPassword = "root";

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to MySQL database
            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
                // SQL query to delete review by review ID
                String sql = "DELETE FROM reviews WHERE review_id = ?";

                // Create prepared statement
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    // Set parameter for the prepared statement
                    preparedStatement.setInt(1, reviewId);

                    // Execute the SQL query to delete review
                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        // Review deleted successfully
                        response.sendRedirect("reviewList.jsp");
                    } else {
                        // Review deletion failed
                        out.println("<p>No review found with ID " + reviewId + ".</p>");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>An error occurred while deleting the review.</p>");
        }
    }
%>
