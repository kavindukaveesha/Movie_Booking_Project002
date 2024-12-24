<%@ page import="com.example.movie_booking.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Retrieve user object from session -->
<%
    User user = null;
    String userName = null;
    session = request.getSession(false); // get existing session without creating a new one
    if (session != null) {
        user = (User) session.getAttribute("user");
        if (user != null) {
            userName = user.getFullName(); // Assuming User object has a getFullName() method
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Additional CSS for the button if needed */
        .sign-in-button {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 15px;
        }

        .sign-in-button a {
            text-decoration: none;
            color: white;
        }

        .dropdown{
            margin-left: 15px;
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

        .dropdown-content a:hover {background-color: #f1f1f1}
    </style>
</head>
<body>
<header>
    <div class="logo">
        <img src="https://i.ibb.co/XDWNCbt/image.png" alt="ABC Cinema logo with a movie camera icon"/>
        <span>ABC</span> CINEMA
    </div>
    <nav>
        <ul>
            <li><a href="#">Movies</a></li>
            <li><a href="contactus.jsp">Contact us</a></li>
            <li><a href="review.jsp">Review us</a></li>
            <li><a href="aboutus.jsp">About us</a></li>
        </ul>
    </nav>
    <div class="user-actions">
        <div class="search">
            <i class="fas fa-search"></i>
        </div>
        <div class="booking">
            <i class="fas fa-ticket-alt"></i> <!-- Changed from bell to ticket icon -->
        </div>
        <% if (userName != null) { %>
        <div class="dropdown">
            <span><%= userName %></span> <!-- Display username if logged in -->
            <i class="fas fa-chevron-down"></i>
            <div class="dropdown-content">
                <a href="<%= request.getContextPath() %>/logout">Sign Out</a>
            </div>
        </div>
        <% } else { %>
        <button class="sign-in-button">
            <a href="<%= request.getContextPath() %>/auth/login">Sign in</a>
        </button>
        <% } %>
    </div>
</header>
</body>
</html>
