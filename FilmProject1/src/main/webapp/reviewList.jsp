<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review List</title>
    <style>
        /* CSS styles can go here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://media.istockphoto.com/id/997176552/photo/hand-choosing-4-stars-on-blue-background-good-feedback-concept.jpg?s=612x612&w=0&k=20&c=TkdiPsL78TGmn2alS3s-D40s6S7jLzGv_-XuDvvnzik='); /* Add your image path here */
            background-size: 500px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        .action-links {
            display: inline-block;
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Review List</h2>
        <table>
            <thead>
                <tr>
                    <th>Review ID</th>
                    <th>Film ID</th>
                    <th>Reviewer Name</th>
                    <th>Review Text</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // JDBC URL, username, and password for MySQL connection
                    String jdbcUrl = "jdbc:mysql://localhost:3306/film_review_db";
                    String dbUsername = "root";
                    String dbPassword = "root";

                    try {
                        // Load the MySQL JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish connection to MySQL database
                        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
                            // SQL query to fetch all reviews
                            String sql = "SELECT * FROM reviews";

                            // Create statement
                            Statement statement = connection.createStatement();

                            // Execute the SQL query and get the result set
                            ResultSet resultSet = statement.executeQuery(sql);

                            // Iterate through the result set and display review data
                            while (resultSet.next()) {
                                int reviewId = resultSet.getInt("review_id");
                                int filmId = resultSet.getInt("film_id");
                                String reviewerName = resultSet.getString("reviewer_name");
                                String reviewText = resultSet.getString("review_text");

                                out.println("<tr>");
                                out.println("<td>" + reviewId + "</td>");
                                out.println("<td>" + filmId + "</td>");
                                out.println("<td>" + reviewerName + "</td>");
                                out.println("<td>" + reviewText + "</td>");
                                out.println("<td>");
                                out.println("<span class='action-links'><a href='editReview.jsp?reviewId=" + reviewId + "'>Edit</a></span>");
                                out.println("<span class='action-links'><a href='deleteReview.jsp?reviewId=" + reviewId + "'>Delete</a></span>");
                                out.println("</td>");
                                out.println("</tr>");
                            }

                            // Close resources
                            resultSet.close();
                            statement.close();
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        out.println("<p>An error occurred while fetching review data.</p>");
                    }
                %>
            </tbody>
        </table>
        <div>
            <a href="addReview.jsp">Add New Review</a>
        </div>
    </div>
</body>
</html>
