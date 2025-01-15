# Film Review and Tracking App

The Film Review and Tracking App is a web-based application that enables users to manage and share reviews of films. It supports features like adding new films, editing and deleting films, managing user accounts, and viewing and posting reviews.

## Features

- **User Authentication**: Login and registration functionality for secure access.
- **Film Management**:
  - Add new films to the database.
  - Edit existing film details.
  - Delete films.
- **Review Management**:
  - Add reviews for films.
  - Edit or delete reviews.
- **Interactive Dashboard**: Navigate to different sections like film lists, reviews, and profile.
- **Responsive Design**: Optimized for desktop and mobile devices.

## Technology Stack

- **Frontend**: HTML, CSS
- **Backend**: Java (Servlets)
- **Database**: MySQL

## Setup Instructions

### Prerequisites

1. Java Development Kit (JDK) 8 or higher.
2. Apache Tomcat Server.
3. MySQL Database.
4. IDE such as IntelliJ IDEA, Eclipse, or NetBeans.

### Installation Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/film-review-tracking-app.git
   ```
2. Open the project in your preferred IDE.
3. Set up the MySQL database:
   - Create a database named `film_review_db`.
   - Execute the following SQL script to create necessary tables:
     ```sql
     CREATE TABLE films (
         film_id INT AUTO_INCREMENT PRIMARY KEY,
         title VARCHAR(255),
         director VARCHAR(255),
         year INT
     );

     CREATE TABLE reviews (
         review_id INT AUTO_INCREMENT PRIMARY KEY,
         film_id INT,
         reviewer_name VARCHAR(255),
         review_text TEXT,
         FOREIGN KEY (film_id) REFERENCES films(film_id)
     );

     CREATE TABLE users (
         user_id INT AUTO_INCREMENT PRIMARY KEY,
         username VARCHAR(255),
         password VARCHAR(255)
     );
     ```
4. Update database connection settings in the Java files (e.g., `AddFilmServlet`, `AddReviewServlet`, etc.) with your MySQL credentials.
5. Deploy the project on Apache Tomcat:
   - Build the project as a WAR file.
   - Deploy the WAR file to the Tomcat webapps directory.
6. Start the server and access the application at `http://localhost:8080/film-review-tracking-app`.

## Directory Structure

```
film-review-tracking-app/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/pu1/
│   │   │       ├── AddFilmServlet.java
│   │   │       ├── AddReviewServlet.java
│   │   │       ├── EditFilmServlet1.java
│   │   │       ├── EditReviewServlet.java
│   │   │       ├── LoginServlet.java
│   │   │       ├── RegisterServlet.java
│   │   │       └── UpdateProfileServlet.java
│   │   └── webapp/
│   │       ├── jsp/
│   │       │   ├── addFilm.jsp
│   │       │   ├── addReview.jsp
│   │       │   ├── editFilm.jsp
│   │       │   ├── editReview.jsp
│   │       │   ├── filmList.jsp
│   │       │   ├── reviewList.jsp
│   │       │   ├── login.jsp
│   │       │   ├── register.jsp
│   │       │   ├── dashboard.jsp
│   │       │   └── about.jsp
└── README.md
```

## Screenshots

### Dashboard
![Dashboard](https://via.placeholder.com/800x400)

### Add Film Page
![Add Film](https://via.placeholder.com/800x400)

### Review List Page
![Review List](https://via.placeholder.com/800x400)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

**Developer**: Sagar Biradar  
**Email**: biradarsagar2004@gmail.com

---

Thank you for using the Film Review and Tracking App! 🔥

