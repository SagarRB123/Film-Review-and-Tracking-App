<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        /* CSS styles can go here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://img.freepik.com/free-photo/movie-background-collage_23-2149876028.jpg'); /* Add your image path here */
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
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        a {
            display: block;
            padding: 10px;
            background-color: #f4f4f4;
            text-decoration: none;
            color: #333;
            border-radius: 5px;
        }
        a:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Your Dashboard</h2>
        <ul>
            <li><a href="filmList.jsp">View Film List</a></li>
            <li><a href="reviewList.jsp">View Review List</a></li>
            <li><a href="addFilm.jsp">Add New Film</a></li>
            <li><a href="addReview.jsp">Add New Review</a></li>
            <!-- Add more navigation links as needed -->
        </ul>
    </div>
</body>
</html>
