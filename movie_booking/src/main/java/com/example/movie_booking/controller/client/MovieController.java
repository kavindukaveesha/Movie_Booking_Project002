package com.example.movie_booking.controller.client;



import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/movies")
public class MovieController extends HttpServlet {

    // Handles displaying the Review Us form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the review-us.jsp page where the review form is presented
        request.getRequestDispatcher("/views/client/all-movies.jsp").forward(request, response);
    }


}
