<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation - ABC Cinema</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background: linear-gradient(to bottom, #000000, #120458);
            color: white;
            text-align: center;
        }
        .container {
            padding: 50px;
            text-align: center;
        }
        h1 {
            color: #FFD700;
        }
        p {
            font-size: 18px;
            line-height: 1.6;
        }
        .button {
            background-color: #fcd34d;
            color: #000;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #ecc94b;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Booking Confirmed!</h1>
    <p>Thank you for your booking, <c:out value="${sessionScope.username}"/>.</p>
    <p>Your booking details are as follows:</p>
    <p>Movie: <c:out value="${sessionScope.booking.movieName}"/></p>
    <p>Date: <c:out value="${sessionScope.booking.date}"/></p>
    <p>Time: <c:out value="${sessionScope.booking.time}"/></p>
    <p>Seats: <c:out value="${sessionScope.booking.seatNumbers}"/></p>
    <p>Total Price: Rs. <c:out value="${sessionScope.booking.totalPrice}"/></p>
    <p>An email with your booking details has been sent to your registered email address.</p>
    <a href="index.jsp" class="button">Return to Home</a>
</div>
</body>
</html>
