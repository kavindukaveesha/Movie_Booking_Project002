<%@ page import="com.example.movie_booking.model.User" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #000;
            color: white;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1e0635;
            padding: 10px 20px;
        }
        .logo {
            display: flex;
            align-items: center;
            color: #FFD700;
        }
        .logo img {
            margin-right: 10px;
        }
        nav ul {
            list-style-type: none;
            display: flex;
            padding: 0;
        }
        nav ul li {
            padding: 0 15px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }
        nav ul li a:hover {
            color: #FFD700;
        }
        .user-actions {
            display: flex;
            align-items: center;
        }
        .search, .booking, .fas {
            color: white;
            margin-right: 20px;
            cursor: pointer;
        }
        .sign-in-button {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .dropdown {
            position: relative;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        .cancel-booking-btn {
            display: inline-block;
            padding: 8px 12px;
            color: white;
            background-color: #ff4d4d; /* Red background for cancellation */
            border-radius: 5px;
            text-decoration: none; /* Remove underline */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
            font-size: 16px; /* Adjust font size as needed */
            align-items: center; /* Align icon and text */
            margin-right: 30px;
        }

        .cancel-booking-btn i {
            margin-right: 5px; /* Space between icon and text */
        }

        .cancel-booking-btn:hover {
            background-color: #cc0000; /* Darker red on hover */
        }
        .search-container form {
            display: flex;
        }

        .search-container input[type="text"] {
            padding: 8px;
            font-size: 16px;
            border: none;
            border-radius: 5px 0 0 5px;
            outline: none;
        }

        .search-container button {
            padding: 8px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 16px;
        }

        .search-container button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

<%
    // Attempt to retrieve user object from session
    User user = (User) session.getAttribute("user");
    if (user == null) {
        // Fall back to checking cookies if no user in session
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    // For simplicity, just grabbing the username
                    request.setAttribute("userName", cookie.getValue());
                    break;
                }
            }
        }
    }
%>
<header>
    <div class="logo">
        <img src="https://i.ibb.co/XDWNCbt/image.png" alt="ABC Cinema logo with a movie camera icon"/>
        <span>ABC</span> CINEMA
    </div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/movies">Movies</a></li>
            <li><a href="${pageContext.request.contextPath}/contact-us">Contact us</a></li>
            <li><a href="${pageContext.request.contextPath}/review-us">Review us</a></li>
            <li><a href="${pageContext.request.contextPath}/about-us">About us</a></li>
        </ul>
    </nav>

    <div class="search-container">
        <form action="<%= request.getContextPath() %>/movies" method="post">
            <input type="text" placeholder="Search movies..." name="movie">
            <button type="submit"><i class="fas fa-search"></i> Search</button>
        </form>
    </div>

        <% if (user != null) { %>

        <!-- Link with icon for Cancel Booking -->
        <a href="<%= request.getContextPath() %>/cancel-booking" class="cancel-booking-btn">
            <i class="fas fa-times-circle"></i> My Booking
        </a>


        <div class="dropdown">
            <span><%= user.getFullName() %></span>

            <div class="dropdown-content">
                <a href="<%= request.getContextPath() %>/logout">Sign Out</a>
            </div>
        </div>
        <% } else { %>
        <a class="sign-in-button" href="<%= request.getContextPath() %>/auth/login">Sign in</a>
        <% } %>
    </div>
</header>
</body>
</html>