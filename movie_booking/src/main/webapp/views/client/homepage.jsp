<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ABC Cinema - Thor Love & Thunder</title>
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
            padding: 50px;
            background: linear-gradient(rgba(26, 9, 51, 0.8), rgba(26, 9, 51, 0.8)), url('https://i.ibb.co/0tHg0ST/image-1-1-2.png');
            background-size: cover;
        }
        .hero-content {
            display: flex;
            gap: 30px;
        }
        .movie-poster {
            width: 300px;
        }
        .movie-poster img {
            width: 100%;
            border-radius: 10px;
        }
        .movie-info {
            padding-top: 205px;
            flex: 1;
        }
        .movie-title {
            font-size: 48px;
            margin-bottom: 20px;
        }
        .movie-description {
            margin-bottom: 20px;
            line-height: 1.5;
        }
        .movie-meta {
            display: flex;
            gap: 20px;
            align-items: center;
            margin-bottom: 20px;
        }
        .age-rating {
            background-color: #ff0000;
            padding: 2px 8px;
            border-radius: 3px;
        }
        .rating {
            color: #ffd700;
        }
        .genre {
            color: #888;
        }
        .buttons {
            display: flex;
            gap: 20px;
        }
        .book-now, .watch-trailer {
            padding: 10px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        .book-now {
            background-color: #ff0000;
            color: white;
        }
        .watch-trailer {
            background-color: white;
            color: black;
        }
        .now-available {
            padding: 50px;
        }
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        .view-all {
            color: white;
            text-decoration: none;
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
        .about-section {
            padding: 50px;
            background: linear-gradient(rgba(26, 9, 51, 0.8), rgba(26, 9, 51, 0.8)), url('https://i.ibb.co/1qnwZGP/image-3.png');
            background-size: cover;
        }
        .about-content {
            max-width: 800px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
<div class="container">

    <!-- Navbar -->
    <nav>
        <jsp:include page="/components/client-navbar.jsp" />
    </nav>


    <!-- Hero Section -->
    <section>
        <jsp:include page="/components/homepage-hero-section.jsp" />
    </section>

    <!-- Now Available Section -->
    <section class="now-available">
        <div class="section-header">
            <h2>Now Available</h2>
            <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
        </div>
        <!-- Repeated movie cards can be added here -->

            <div class="movie-grid">
                <div class="movie-card">
                    <img src="https://i.ibb.co/kBLD9Jg/Rectangle-9-2.png" alt="Thor Love & Thunder"/>
                    <div class="movie-card-info">
                        <h3>Thor Love & Thunder</h3>
                        <div class="movie-meta">
                            <span>2021</span>
                            <span class="age-rating">18+</span>
                            <span class="rating">★ 7.9</span>
                        </div>
                        <div class="buttons">
                            <a href="#" class="book-now">Book now</a>
                            <a href="#" class="watch-trailer">Watch Trailer</a>
                        </div>
                    </div>
                </div>
                <div class="movie-card">
                    <img src="https://i.ibb.co/kBLD9Jg/Rectangle-9-2.png" alt="Thor Love & Thunder"/>
                    <div class="movie-card-info">
                        <h3>Thor Love & Thunder</h3>
                        <div class="movie-meta">
                            <span>2021</span>
                            <span class="age-rating">18+</span>
                            <span class="rating">★ 7.9</span>
                        </div>
                        <div class="buttons">
                            <a href="#" class="book-now">Book now</a>
                            <a href="#" class="watch-trailer">Watch Trailer</a>
                        </div>
                    </div>
                </div>
                <div class="movie-card">
                    <img src="https://i.ibb.co/kBLD9Jg/Rectangle-9-2.png" alt="Thor Love & Thunder"/>
                    <div class="movie-card-info">
                        <h3>Thor Love & Thunder</h3>
                        <div class="movie-meta">
                            <span>2021</span>
                            <span class="age-rating">18+</span>
                            <span class="rating">★ 7.9</span>
                        </div>
                        <div class="buttons">
                            <a href="#" class="book-now">Book now</a>
                            <a href="#" class="watch-trailer">Watch Trailer</a>
                        </div>
                    </div>
                </div>
            </div>





    </section>

    <!-- About Section -->
    <section class="about-section">
        <div class="about-content">
            <p>At <span style="color: #FFD700;">ABC Cinema</span>, we're dedicated to providing you with the ultimate cinematic experience. From world-class facilities to exceptional customer care, your comfort and enjoyment are always our top priorities. Let us take care of the details so you can sit back, relax, and immerse yourself in the magic of the movies.</p>
            <br/>
            <p>Experience the difference—only at <span style="color: #FFD700;">ABC Cinema</span></p>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <jsp:include page="/components/client-footer.jsp" />
    </footer>
</div>
</body>
</html>
