<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>ABC Cinema - Movie Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>

    </style>
</head>
<body class="bg-gradient-to-b from-black to-purple-900 min-h-screen flex flex-col">
<header class="text-white items-center p-3">
    <img alt="logo.png" class="mr-2 h-20" src="logo/logo3.png"/>
</header>

<div class="flex flex-1">
    <!-- Include Navigation Bar -->
    <jsp:include page="/components/admin-navbar.jsp"/>

    <!-- Main Content -->
    <aside class="w-5/6 bg-gray-300 p-6">
        <main class="w-full">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-bold">Movie Details Management</h2>
                <div class="mt-6">
                    <a href="addmovie.jsp" class="btn-add-movie">
                        <i class="fas fa-plus"></i> Add Movie
                    </a>
                </div>
            </div>
            <div class="bg-gray-200 p-4 rounded">
                <table class="w-full text-left border-collapse">
                    <thead>
                    <tr>
                        <th class="border py-2 px-4">Image</th>
                        <th class="border py-2 px-4">Title</th>
                        <th class="border py-2 px-4">Genre</th>
                        <th class="border py-2 px-4">Language</th>
                        <th class="border py-2 px-4">Status</th>
                        <th class="border py-2 px-4">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Example rows (replace with dynamic data as needed) -->
                    <tr>
                        <td class="border py-2 px-4">
                            <img src="example.jpg" alt="Movie Image" class="h-10 w-10 rounded"/>
                        </td>
                        <td class="border py-2 px-4">Thor Love & Thunder</td>
                        <td class="border py-2 px-4">Action</td>
                        <td class="border py-2 px-4">English</td>
                        <td class="border py-2 px-4">
                            <span class="status-dot status-active"></span> Active
                        </td>
                        <td class="border py-2 px-4">
                            <button class="action-btn bg-yellow-400">
                                <i class="fas fa-calendar-plus"></i> Add Show
                            </button>
                            <button class="action-btn bg-blue-500 text-white">
                                <i class="fas fa-pen"></i>
                            </button>
                            <button class="action-btn bg-red-500 text-white">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>

                    <!-- Repeat for more rows -->
                    </tbody>
                </table>
            </div>
        </main>
    </aside>
</div>
</body>
</html>

