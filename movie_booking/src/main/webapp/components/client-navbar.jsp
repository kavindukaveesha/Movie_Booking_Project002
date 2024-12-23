<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Assuming the user's name is stored in a cookie named 'username' -->
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
<!-- Navigation Bar -->
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
                <a href="logout.jsp">Sign Out</a>
            </div>
        </div>
        <% } else { %>
        <button style="background-color: red; color: white; border: none; padding: 10px 20px;margin-left: 10px; border-radius: 5px;">
            <a href="login.jsp" style="text-decoration: none; color: white;">Sign in</a>
        </button>
        <% } %>
    </div>
</header>
