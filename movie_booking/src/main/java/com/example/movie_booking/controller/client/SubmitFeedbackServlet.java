package com.example.movie_booking.controller.client;

import com.example.movie_booking.model.Feedback;
import com.example.movie_booking.service.FeedbackService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class SubmitFeedbackServlet extends HttpServlet {
    private FeedbackService feedbackService;

    @Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Feedback feedback = new Feedback();

        feedback.setName(request.getParameter("name"));
        feedback.setEmail(request.getParameter("email"));
        feedback.setExperience(Integer.parseInt(request.getParameter("experience")));
        feedback.setTicketEase(Integer.parseInt(request.getParameter("ticketEase")));
        feedback.setPaymentEase(Integer.parseInt(request.getParameter("paymentEase")));
        feedback.setCleanliness(Integer.parseInt(request.getParameter("cleanliness")));
        feedback.setSoundQuality(Integer.parseInt(request.getParameter("soundQuality")));
        feedback.setStaffExperience(Integer.parseInt(request.getParameter("staffExperience")));
        feedback.setSuggestions(request.getParameter("suggestions"));

        feedbackService.processFeedback(feedback);

        response.getWriter().write("Thank you for your feedback!");
    }


}
