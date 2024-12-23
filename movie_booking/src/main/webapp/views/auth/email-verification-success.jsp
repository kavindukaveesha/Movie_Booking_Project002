<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification Successful - ABC Cinema</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #000000 0%, #4B0082 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .success-container {
            background: white;
            border-radius: 8px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #666;
            font-size: 16px;
            margin-bottom: 30px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #FF0000;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>
<div class="success-container">
    <h1>Email Verified Successfully!</h1>
    <p>Your email has been successfully verified. You can now log in and start using ABC Cinema.</p>
    <button onclick="window.location.href='<%= request.getContextPath() %>/auth/login'">Go to Sign In</button>
</div>
</body>
</html>
