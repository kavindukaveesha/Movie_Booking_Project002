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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #000000, #4B0082);
            color: #FFFFFF;
        }
        .container {
            width: 100%;
            margin: 0 auto;
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
        .feedback-form {
            background: #2d135e;
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 600px;
            margin: 30px auto;
        }

        .header-inputs {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .input-group {
            position: relative;
        }

        .input-group input {
            width: 100%;
            padding: 10px 0;
            background: transparent;
            border: none;
            border-bottom: 1px solid #fff;
            color: #fff;
            outline: none;
        }

        .input-group label {
            position: absolute;
            left: 0;
            top: -20px;
            color: #fff;
            font-size: 14px;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 24px;
        }

        .question-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            cursor: pointer;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.2s;
        }

        .question-group:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .question {
            flex: 1;
            padding-right: 20px;
        }

        .rating {
            display: flex;
            gap: 15px;
        }

        .rating input[type="checkbox"] {
            appearance: none;
            width: 20px;
            height: 20px;
            border: 2px solid #fff;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.2s;
        }

        .rating input[type="checkbox"]:checked {
            background: #ffd700;
            border-color: #ffd700;
        }

        .rating input[type="checkbox"]:hover {
            transform: scale(1.1);
        }

        textarea {
            width: 100%;
            height: 100px;
            margin: 20px 0;
            padding: 15px;
            border-radius: 10px;
            border: none;
            resize: none;
            background: rgba(255, 255, 255, 0.9);
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: #ffd700;
            color: #1e0b47;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            display: block;
            margin: 20px auto 0;
        }

        button:hover {
            background: #f0c700;
        }

        .rating-label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-size: 12px;
            color: rgba(255, 255, 255, 0.7);
            width: 100%;
            padding: 0 10px;
        }

    </style>
</head>
<body>
<div class="container">

    <!-- Navbar -->
    <nav>
        <jsp:include page="/components/client-navbar.jsp" />
    </nav>

    <form class="feedback-form" action="SubmitFeedbackServlet" method="post">
        <div class="header-inputs">
            <div class="input-group">
                <label>Name</label>
                <input type="text" name="name" required>
            </div>
            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>
        </div>

        <h2>Send us your Feedback!</h2>

        <%--    <div class="rating-label">--%>
        <%--        <span>Poor</span>--%>
        <%--        <span>Excellent</span>--%>
        <%--    </div>--%>

        <div class="question-group">
            <div class="question">How would you rate your overall experience?</div>
            <div class="rating">
                <input type="checkbox" name="experience[]" value="1">
                <input type="checkbox" name="experience[]" value="2">
                <input type="checkbox" name="experience[]" value="3">
                <input type="checkbox" name="experience[]" value="4">
                <input type="checkbox" name="experience[]" value="5">
            </div>
        </div>

        <div class="question-group">
            <div class="question">Was the online ticket reservation process easy to use?</div>
            <div class="rating">
                <input type="checkbox" name="ticketEase[]" value="1">
                <input type="checkbox" name="ticketEase[]" value="2">
                <input type="checkbox" name="ticketEase[]" value="3">
                <input type="checkbox" name="ticketEase[]" value="4">
                <input type="checkbox" name="ticketEase[]" value="5">
            </div>
        </div>

        <div class="question-group">
            <div class="question">Did you encounter any issues with online payments?</div>
            <div class="rating">
                <input type="checkbox" name="payments[]" value="1">
                <input type="checkbox" name="payments[]" value="2">
                <input type="checkbox" name="payments[]" value="3">
                <input type="checkbox" name="payments[]" value="4">
                <input type="checkbox" name="payments[]" value="5">
            </div>
        </div>

        <div class="question-group">
            <div class="question">How satisfied were you with the cleanliness of the cinema?</div>
            <div class="rating">
                <input type="checkbox" name="cleanliness[]" value="1">
                <input type="checkbox" name="cleanliness[]" value="2">
                <input type="checkbox" name="cleanliness[]" value="3">
                <input type="checkbox" name="cleanliness[]" value="4">
                <input type="checkbox" name="cleanliness[]" value="5">
            </div>
        </div>

        <div class="question-group">
            <div class="question">How would you rate the sound and picture quality?</div>
            <div class="rating">
                <input type="checkbox" name="quality[]" value="1">
                <input type="checkbox" name="quality[]" value="2">
                <input type="checkbox" name="quality[]" value="3">
                <input type="checkbox" name="quality[]" value="4">
                <input type="checkbox" name="quality[]" value="5">
            </div>
        </div>

        <div class="question-group">
            <div class="question">How was your experience with the staff?</div>
            <div class="rating">
                <input type="checkbox" name="staff[]" value="1">
                <input type="checkbox" name="staff[]" value="2">
                <input type="checkbox" name="staff[]" value="3">
                <input type="checkbox" name="staff[]" value="4">
                <input type="checkbox" name="staff[]" value="5">
            </div>
        </div>

        <textarea name="suggestions" placeholder="Do you have any suggestions for us to improve your experience?" required></textarea>
        <button type="submit">Submit</button>
    </form>


    <!-- Navbar -->
    <footer>
        <jsp:include page="/components/client-footer.jsp" />
    </footer>
</div>
</body>
</html>


