<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ABC Cinema - Users</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="styles.css">
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
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const editButtons = document.querySelectorAll('.edit-btn');
            editButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const row = this.closest('tr');
                    const id = row.cells[0].innerText;
                    const name = row.cells[1].innerText;
                    const email = row.cells[2].innerText;
                    const phone = row.cells[3].innerText;

                    document.getElementById('edit-id').value = id;
                    document.getElementById('edit-name').value = name;
                    document.getElementById('edit-email').value = email;
                    document.getElementById('edit-phone').value = phone;

                    document.getElementById('edit-modal').classList.remove('hidden');
                });
            });

            document.getElementById('save-changes').addEventListener('click', function () {
                document.getElementById('edit-modal').classList.add('hidden');
            });

            document.getElementById('close-modal').addEventListener('click', function () {
                document.getElementById('edit-modal').classList.add('hidden');
            });
 
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
    });
    </script>
</head>
<body class="bg-gradient-to-b from-black to-purple-900 min-h-screen flex flex-col">
    <header class="text-white items-center p-3">
        <img alt="ABC Cinema Logo" class="mr-2 h-20" src="logo/logo3.png"/>
    </header>

    <div class="flex flex-1">
        <nav class="w-1/7 p-1">
            <ul>
                <li class="mb-4">
                    <a href="movies.jsp" class="nav-link block py-4 px-7 bg-gray-200 colorButton" align="center">Movies</a>
                </li>
                <li class="mb-4">
                    <a href="reservation.jsp" class="nav-link block py-4 px-9 bg-gray-200 colorButton" align="center">Reservations</a>
                </li>
                <li class="mb-4">
                    <a href="feedback.jsp" class="nav-link block py-4 px-9 bg-gray-200 colorButton" align="center">Feedbacks</a>
                </li>
                <li class="mb-4">
                    <a href="usermanage.jsp" class="nav-link block py-4 px-9 bg-gray-200 colorButton" align="center">Users</a>
                </li>
                <li class="mb-4">
                    <a href="inquiries.jsp" class="nav-link block py-4 px-9 bg-gray-200 colorButton" align="center">Inquiries</a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <aside class="w-5/6 bg-gray-300 p-2">
            <main class="w-7/8 p-3">
                <h2 class="text-2xl font-bold mb-12">Users</h2>
                <div class="bg-gray-200 p-6 py-4">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr>
                                <th class="border py-2 px-4">ID</th>
                                <th class="border py-2 px-4">Full Name</th>
                                <th class="border py-2 px-4">Email</th>
                                <th class="border py-2 px-4">Mobile Number</th>
                                <th class="border py-2 px-4">Action</th>
                            </tr>
                        </thead>
                        <tbody>

                                <tr class="border-t">
                                    <!-- Format User ID to display as 3 digits -->
                                    <td class="py-2 px-4"></td>
                                    <td class="py-2 px-4"></td>
                                    <td class="py-2 px-4"></td>
                                    <td class="py-2 px-4"></td>
                                    <td class="py-2 px-4">
                                        <button class="edit-btn bg-yellow-500 text-white px-2 py-1 rounded">Edit</button>
                                        <form action="usermanage.jsp" method="post" style="display:inline;">
                                            <input type="hidden" name="delete-user" value="1" />
                                            <input type="hidden" name="id" value="" />
                                            <button type="submit" class="bg-red-500 text-white px-2 py-1 rounded">Delete</button>
                                        </form>
                                    </td>
                                </tr>

                        </tbody>
                    </table>
                </div>
            </main>
        </aside>
    </div>

    <!-- Edit Modal -->
    <div id="edit-modal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
        <div class="bg-white p-8 rounded shadow-lg">
            <h3 class="text-xl mb-4">Edit User</h3>
            <form action="usermanage.jsp" method="post">
                <input type="hidden" name="save-changes" value="1" />
                
                <label class="block text-gray-700">ID:</label>
                <input id="edit-id" name="id" class="w-full border p-2 rounded" type="text" readonly />
                
                <label class="block text-gray-700">Full Name:</label>
                <input id="edit-name" name="fullname" class="w-full border p-2 rounded" type="text" />
                
                <label class="block text-gray-700">Email:</label>
                <input id="edit-email" name="email" class="w-full border p-2 rounded" type="email" />
                
                <label class="block text-gray-700">Mobile Number:</label>
                <input id="edit-phone" name="mobilenumber" class="w-full border p-2 rounded" type="text" />
                
                <button type="submit" id="save-changes" class="bg-yellow-400 text-white px-4 py-2 rounded">Save</button>
                <button type="button" id="close-modal" class="bg-red-400 text-white px-4 py-2 rounded mr-2">Cancel</button>
            </form>
        </div>
    </div>
</body>
</html>
