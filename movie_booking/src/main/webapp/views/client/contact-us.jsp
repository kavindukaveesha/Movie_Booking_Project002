<%--
  Created by IntelliJ IDEA.
  User: I Pasith
  Date: 12/23/2024
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #2c003e;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .contact-card {
            background: #3b0142;
            color: white;
            border-radius: 15px;
            padding: 30px;
            width: 400px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .contact-card h2 {
            font-size: 24px;
            margin-bottom: 20px;
            position: relative;
        }

        .contact-card h2::after {
            content: '\260E'; /* Telephone emoji */
            font-size: 18px;
            margin-left: 10px;
        }

        .contact-card input,
        .contact-card textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .contact-card textarea {
            resize: none;
            height: 80px;
        }

        .contact-card button {
            background: #ffd700;
            color: black;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }

        .contact-card button:hover {
            background: #e5b800;
        }
    </style>
</head>
<body>
<div class="contact-card">
    <h2>Contact Us</h2>
    <form action="contact-submit" method="post">
        <input type="text" name="name" placeholder="Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <textarea name="message" placeholder="Message" required></textarea>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
