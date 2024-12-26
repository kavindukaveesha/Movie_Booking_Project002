<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ABC Cinema - Thor Love & Thunder|| Movies</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="styles.css" rel="stylesheet"/> <!-- Link to external CSS file -->

    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #000000, #4B0082); /* Background gradient */
            color: #FFFFFF; /* White text color for whole body */
        }
        .container {
            width: 100%;
            margin: 0 auto; /* Centering the container */
        }

        /* Navbar Styles */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: rgba(0, 0, 0, 0.9); /* Dark background with opacity */
        }
        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
        }
        .logo img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }
        .logo span {
            color: #FFD700; /* Golden color for "ABC" */
        }
        nav ul {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            margin: 0 20px;
        }
        nav ul li a {
            color: #FFFFFF;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
        }

        /* User Actions Styles */
        .user-actions {
            display: flex;
            align-items: center;
        }
        .user-actions .search, .user-actions .notifications {
            margin-right: 20px;
            font-size: 20px;
            color: white;
            cursor: pointer;
        }
        .user-profile {
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        .user-profile img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            margin-right: 10px;
            background-color: #ccc; /* Fallback color for the profile icon */
        }
        .user-profile span {
            font-size: 14px;
            color: #FFFFFF;
            font-weight: 500;
        }

        /* Dropdown Menu Styles */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            color: #000;
            min-width: 100px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            text-align: center;
            border-radius: 5px;
        }
        .dropdown-content a {
            text-decoration: none;
            color: #000;
            padding: 8px 10px;
            display: block;
            font-size: 14px;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block; /* Show dropdown content on hover */
        }

        /* Footer Styles */
        footer {
            background-color: rgba(0, 0, 0, 0.3);
            padding: 20px 40px;
        }
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .footer-logo {
            display: flex;
            align-items: center;
        }
        .footer-logo img {
            width: 30px;
            margin-right: 10px;
        }
        .footer-logo span {
            color: #FFD700;
            font-weight: bold;
        }
        .footer-links a {
            color: #FFFFFF;
            text-decoration: none;
            margin-right: 20px;
        }
        .social-icons {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .social-icons span {
            margin-bottom: 10px;
        }
        .social-icons-container {
            display: flex;
        }
        .social-icons a {
            color: #FFFFFF;
            margin-right: 15px;
            font-size: 20px;
        }
        .copyright {
            text-align: center;
            padding-top: 30px;
            color: #B8B8B8;
            font-size: 14px;
        }
        hr {
            border: 0;
            height: 1px;
            background-color: rgba(255, 255, 255, 0.2);
            margin: 30px 0;
        }

        .hero {
            position: relative;
            padding: 80px 50px;
            min-height: 80vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(26, 9, 51, 0.9)),
            url('${pageContext.request.contextPath}/DBImages/${heroMovie.imageUrl}');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            box-shadow: inset 0 -100px 100px -100px rgba(0, 0, 0, 0.9);
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at center, transparent, rgba(0, 0, 0, 0.8));
            pointer-events: none;
        }
        .hero-content {
            position: relative;
            z-index: 1;
            display: flex;
            gap: 50px;
            align-items: center;
            max-width: 1400px;
            margin: 0 auto;
        }

        .movie-poster {
            flex: 0 0 400px;
            transform: perspective(1000px) rotateY(5deg);
            transition: transform 0.3s ease;
        }

        .movie-poster:hover {
            transform: perspective(1000px) rotateY(0deg);
        }
        .movie-poster img {
            width: 100%;
            height: 600px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }

        .movie-info {
            flex: 1;
            padding: 30px 0;
        }

        .movie-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 25px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            background: linear-gradient(45deg, #fff, #ffd700);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .movie-description {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #e0e0e0;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }

        .movie-meta {
            display: flex;
            gap: 20px;
            align-items: center;
            margin-bottom: 30px;
            margin-top: 10px;
        }
        .movie-meta span {
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            backdrop-filter: blur(5px);
            background: rgba(255, 255, 255, 0.1);
        }

        .age-rating {
            background: linear-gradient(45deg, #ff4444, #ff0000) !important;
            color: white;
        }

        .rating {
            color: #ffd700 !important;
        }

        .genre {
            color: #fff !important;
        }
        .buttons {
            display: flex;
            gap: 20px;
        }

        .book-now, .watch-trailer {
            padding: 15px 35px;
            border-radius: 30px;
            font-size: 1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .book-now {
            background: linear-gradient(45deg, #ff4444, #ff0000);
            color: white;
            border: none;
            font-size: .8rem;
        }
        .book-now:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .watch-trailer {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: 2px solid white;
            backdrop-filter: blur(5px);
            font-size: .8rem;
        }

        .watch-trailer:hover {
            background: white;
            color: black;
            transform: translateY(-2px);
        }
        .movie-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }
        .movie-card img {
            width: 100%;
            border-radius: 10px;
        }
        .movie-card-info {
            margin-top: 10px;
        }
        a{
            text-decoration: none;
        }

    </style>
</head>
<body>
<div class="container">

    <!-- Navbar -->
    <nav>
        <jsp:include page="/components/client-navbar.jsp" />
    </nav>

    <h1 style="padding: 40px">Your Search Result</h1>


    <!-- Now Available Section -->
    <section class="now-available" style="padding: 5rem 8rem">
        <div class="movie-grid">
            <c:forEach var="movie" items="${movies}" >
                <div class="movie-card">
                    <img src="${pageContext.request.contextPath}/DBImages/${movie.imageUrl}" style="height: 60vh" alt="${movie.title}"/>
                    <div class="movie-card-info">
                        <h3>${movie.title}</h3>
                        <div class="movie-meta">
                            <span>${movie.status}</span>
                            <span class="age-rating">${movie.ageRange}</span>
                            <span class="rating">★ ${movie.rating}</span>
                        </div>
                        <div class="buttons">
                            <a href="${pageContext.request.contextPath}/moviedetails?movieId=${movie.id}" class="book-now">Movie Details</a>
                            <a href="${movie.trailarUrl}" class="watch-trailer">Watch Trailer</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>




    <!-- Footer -->
    <footer>
        <jsp:include page="/components/client-footer.jsp" />
    </footer>
</div>
</body>
</html>
