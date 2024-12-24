package com.example.movie_booking.controller.client;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/review-us")
public class ReviewUsController extends HttpServlet {

    // Handles displaying the Review Us form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the review-us.jsp page where the review form is presented
        request.getRequestDispatcher("/views/client/feedback.jsp").forward(request, response);
    }

    // Placeholder for handling form submissions
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Placeholder: process the review submission
        // This needs implementation to actually process the submitted review
        throw new ServletException("POST method is not yet implemented");
    }
}
