<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ABC Cinema - Feedbacks</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        
        /* CSS to handle feedback text wrapping */
        .feedback-text {
            white-space: pre-wrap; /* Allows feedback to wrap to new lines */
            word-wrap: break-word; /* Break long words if necessary */
            max-width: 300px; /* Adjust this width as needed */
        }
        
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
    </style>
    <script>
        // Select all buttons with the 'colorButton' class
        const buttons = document.querySelectorAll('.colorButton');

        // Add a click event listener to each button
        buttons.forEach(button => {
            button.addEventListener('click', () => {
                // Reset the background color of all buttons
                buttons.forEach(btn => {
                    btn.style.backgroundColor = '#E5E7EB';
                });
                // Set the background color of the clicked button to yellow
                button.style.backgroundColor = '#fbbf24';
            });
        });
    </script>
</head>
<body class="bg-gradient-to-b from-black to-purple-900 min-h-screen flex flex-col">
    <header class="text-white items-center p-3">
        <img alt="logo.png" class="mr-2 h-20" src="logo/logo3.png"/>
    </header>
    
    <div class="flex flex-1">
        <!-- Sidebar Navigation -->
        <jsp:include page="/components/admin-navbar.jsp"/>

        <!-- Main Content -->
        <aside class="w-5/6 bg-gray-300 p-2">
            <main class="w-7/8 p-3">
                <h2 class="text-2xl font-bold mb-12">Feedbacks</h2>
                <div class="bg-gray-200 p-6 py-4">
                    <table class="w-full text-left" border-collapse>
                        <thead>
                            <tr>
                                <th class="border py-2 px-4">User ID</th>
                                <th class="border py-2 px-4">Email</th>
                                <th class="border py-2 px-4">Date</th>
                                <th class="border py-2 px-4">Rate</th>
                                <th class="border py-2 px-4">Feedback</th>
                            </tr>
                        </thead>
                        <tbody>


                        </tbody>
                    </table>
                </div>
            </main>
        </aside>
    </div>
</body>
</html>
