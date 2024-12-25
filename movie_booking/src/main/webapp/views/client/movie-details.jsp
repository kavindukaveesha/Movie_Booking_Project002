<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 12/24/2024
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ABC Cinema - Thor Love & Thunder</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #0f0f0f;
            color: white;

        }
        .container {
            width: 100%;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: rgba(0, 0, 0, 0.3);
        }
        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
        }
        .logo img {
            width: 40px;
            margin-right: 10px;
        }
        .logo span {
            color: #FFD700;
        }
        nav ul {
            display: flex;
            list-style-type: none;
        }
        nav ul li {
            margin-right: 20px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
        }
        .user-actions {
            display: flex;
            align-items: center;
        }
        .user-actions .search, .user-actions .notifications {
            margin-right: 20px;
            font-size: 20px;
        }
        .sign-in {
            background-color: #FF0000;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
        }
        .hero {
            position: relative;
            height: 500px;
            background-image: url('${pageContext.request.contextPath}/DBImages/${movie.imageUrl}');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: flex-end;
            padding: 40px;
        }
        .hero-content {
            max-width: 50%;
        }
        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        .hero-buttons {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .hero-buttons a {
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        .book-now {
            background-color: #FF0000;
            color: white;
        }
        .watch-trailer {
            background-color: white;
            color: black;
        }
        .movie-info {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        .movie-info span {
            display: flex;
            align-items: center;
        }
        .movie-info .rating {
            color: #FFD700;
        }
        .movie-info .age-rating {
            background-color: #FF0000;
            padding: 2px 5px;
            border-radius: 3px;
        }
        .movie-description {
            margin-bottom: 20px;
        }
        .recommendations {
            padding: 40px;
        }
        .recommendations-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .recommendations h2 {
            font-size: 24px;
        }
        .view-all a {
            color: white;
            text-decoration: none;
        }
        .recommendations-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .recommendation-item {
            position: relative;
        }
        .recommendation-item img {
            width: 100%;
            border-radius: 5px;
        }
        .recommendation-item .title {
            position: absolute;
            bottom: 10px;
            left: 10px;
            color: white;
            font-weight: bold;
        }
        .recommendation-item .episode {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 5px;
            border-radius: 3px;
        }
    </style>
</head>
<body>
<div class="container">

    <nav>
        <jsp:include page="/components/client-navbar.jsp" />
    </nav>

    <main>
        <section class="hero">
            <div class="hero-content">
                <!-- Movie Title -->
                <h1>${movie.title}</h1>

                <!-- Buttons for Booking and Watching Trailer -->
                <div class="hero-buttons">
                    <a href="${pageContext.request.contextPath}/book-now?id=${movie.id}" class="book-now">Book now</a>
                    <a href="${movie.trailarUrl}" class="watch-trailer" target="_blank">Watch Trailer</a>
                </div>

                <!-- Movie Metadata -->
                <div class="movie-info">
                    <span>${movie.language}</span>
                    <span class="age-rating">${movie.ageRange}</span>
                    <span class="rating"><i class="fas fa-star"></i> ${movie.rating}</span>
                    <c:forEach var="genre" items="${movie.genre}">
                        <span>${genre}</span>
                    </c:forEach>
                </div>

                <!-- Movie Description -->
                <p class="movie-description">
                    ${movie.description}
                </p>
            </div>
        </section>
    </main>

    <footer>
        <jsp:include page="/components/client-footer.jsp" />
    </footer>

</div>
</body>
</html>
