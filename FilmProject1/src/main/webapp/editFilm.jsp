<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Film</title>
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
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
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
        <h2>Edit Film</h2>
        <form action="EditFilmServlet1" method="post">
            <label for="id">Film ID:</label>
            <input type="text" id="id" name="id" required>

            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="<%= request.getParameter("title") %>" required>

            <label for="director">Director:</label>
            <input type="text" id="director" name="director" value="<%= request.getParameter("director") %>" required>

            <label for="year">Year:</label>
            <input type="number" id="year" name="year" value="<%= request.getParameter("year") %>" required>

            <input type="submit" value="Save Changes">
        </form>
    </div>
</body>
</html>
