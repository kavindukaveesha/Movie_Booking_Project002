package com.example.movie_booking.controller.client;


import com.example.movie_booking.model.Feedback;
import com.example.movie_booking.service.FeedbackService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;


@WebServlet("/SubmitFeedbackServlet")
public class SubmitFeedbackServlet extends HttpServlet {
    private FeedbackService feedbackService;

    @Override
    public void init() {
        try {
            feedbackService = new FeedbackService();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("/views/client/feedback.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            handleError(request, response, "Error loading feedback form: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Feedback feedback = new Feedback();

            // Set basic information
            feedback.setName(sanitizeInput(request.getParameter("name")));
            feedback.setEmail(sanitizeInput(request.getParameter("email")));
            feedback.setSuggestions(sanitizeInput(request.getParameter("suggestions")));

            // Get all checkbox arrays (ratings)
            String[] experienceValues = request.getParameterValues("experience");
            String[] ticketEaseValues = request.getParameterValues("ticketEase");
            String[] paymentsValues = request.getParameterValues("payments");
            String[] cleanlinessValues = request.getParameterValues("cleanliness");
            String[] qualityValues = request.getParameterValues("quality");
            String[] staffValues = request.getParameterValues("staff");

            // Convert and set ratings
            feedback.setExperience(parseRating(experienceValues));
            feedback.setTicketEase(parseRating(ticketEaseValues));
            feedback.setPayments(parseRating(paymentsValues));
            feedback.setCleanliness(parseRating(cleanlinessValues));
            feedback.setQuality(parseRating(qualityValues));
            feedback.setStaff(parseRating(staffValues));

            // Get current timestamp
            feedback.setSubmissionDate(new Timestamp(System.currentTimeMillis()));


            // Submit feedback through service
            feedbackService.submitFeedback(feedback);

            // Set success attributes and redirect
            HttpSession session = request.getSession();
            session.setAttribute("message", "Thank you for your feedback!");


            request.getRequestDispatcher("/views/client/feedback.jsp").forward(request, response);


        } catch (Exception e) {
            handleError(request, response, "Error processing feedback: " + e.getMessage());
        }
    }
    private int[] parseRating(String[] values) {
        if (values == null) return new int[0];

        int[] ratings = new int[values.length];
        for(int i = 0; i< values.length; i++){
            try{
                ratings[i] = Integer.parseInt(values[i]);
            }catch (NumberFormatException e){
                ratings[i] = 0;
            }

        }
        return ratings;
    }

    private String sanitizeInput(String input) {
        if (input == null) {
            return null;
        }
        // Remove any HTML tags
        input = input.replaceAll("<[^>]*>", "");
        // Remove any special characters
        input = input.replaceAll("[^a-zA-Z0-9\\s@._-]", "");
        return input.trim();
    }
    private void handleError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.setAttribute("error", errorMessage);
        request.getRequestDispatcher("/views/client/feedback.jsp").forward(request, response);
    }
}