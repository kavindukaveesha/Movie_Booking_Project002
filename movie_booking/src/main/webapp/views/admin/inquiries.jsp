<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ABC Cinema - Inquiries</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        .nav-link {
            border-radius: 10px;
        }
        .colorButton {
            cursor: pointer;
        }
        .colorButton:hover {
            background-color: #fbbf24;
            color: black;
        }
        .table-container {
            background-color: #e5e5e5;
            padding: 20px;
            border-radius: 10px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th, .table td {
            border: 1px solid #ccc;
            padding: 12px 16px;
            text-align: left;
        }
        .table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        .table td {
            background-color: white;
        }
    </style>
</head>
<body class="bg-gradient-to-b from-black to-purple-900 min-h-screen flex flex-col">
<header class="text-white items-center p-3">
    <img alt="logo.png" class="mr-2 h-20" src="./logo3.png"/>
</header>

<div class="flex flex-1">
    <!-- Include Navigation Bar -->

    <jsp:include page="/components/admin-navbar.jsp"/>


    <!-- Main Content -->
    <aside class="w-5/6 bg-gray-300 p-6">
        <main class="w-full">
            <h2 class="text-2xl font-bold mb-6">Inquiries</h2>
            <div class="table-container">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Example row -->
                    <tr>
                        <td>Manidu Maneesha</td>
                        <td>manidumaneeshawv@gmail.com</td>
                        <td>I tried booking tickets for the 7 PM show of Avengers on November 30, 2024, but the payment didn't go through even though the amount was deducted from my account. Please look into this and confirm my booking.</td>
                    </tr>
                    <tr>
                        <td>Manidu Maneesha</td>
                        <td>manidumaneeshawv@gmail.com</td>
                        <td>I tried booking tickets for the 7 PM show of Avengers on November 30, 2024, but the payment didn't go through even though the amount was deducted from my account. Please look into this and confirm my booking.</td>
                    </tr>
                    <tr>
                        <td>Manidu Maneesha</td>
                        <td>manidumaneeshawv@gmail.com</td>
                        <td>I tried booking tickets for the 7 PM show of Avengers on November 30, 2024, but the payment didn't go through even though the amount was deducted from my account. Please look into this and confirm my booking.</td>
                    </tr>
                    <tr>
                        <td>Manidu Maneesha</td>
                        <td>manidumaneeshawv@gmail.com</td>
                        <td>I tried booking tickets for the 7 PM show of Avengers on November 30, 2024, but the payment didn't go through even though the amount was deducted from my account. Please look into this and confirm my booking.</td>
                    </tr>
                    <!-- Add more rows dynamically as needed -->
                    </tbody>
                </table>
            </div>
        </main>
    </aside>
</div>
</body>
</html>

