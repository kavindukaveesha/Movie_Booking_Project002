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
    </style>
</head>
<body>
<%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("username".equals(cookie.getName())) {
                userName = cookie.getValue();
                break;
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
    <div class="user-actions">
        <div class="search">
            <i class="fas fa-search"></i>
        </div>
        <div class="booking">
            <i class="fas fa-ticket-alt"></i>
        </div>
        <% if (userName != null) { %>
        <div class="dropdown">
            <span><%= userName %></span>
            <i class="fas fa-chevron-down"></i>
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
