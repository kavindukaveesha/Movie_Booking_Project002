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

@WebServlet("/SubmitFeedbackServlet")
public class SubmitFeedbackServlet extends HttpServlet {
    private FeedbackService feedbackService;

    @Override
    public void init() {
        feedbackService = new FeedbackService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("/views/client/feedback.jsp").forward(request, response);  // /views/client/contact-us.jsp
        } catch (ServletException | IOException e) {
            handleError(request, response, "Error loading feedback form: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Create new feedback object
            Feedback feedback = new Feedback();

            // Set basic information
            feedback.setName(sanitizeInput(request.getParameter("name")));
            feedback.setEmail(sanitizeInput(request.getParameter("email")));
            feedback.setSuggestions(sanitizeInput(request.getParameter("suggestions")));

            // Get all checkbox arrays (ratings)
            String[] experienceValues = request.getParameterValues("experience[]");
            String[] ticketEaseValues = request.getParameterValues("ticketEase[]");
            String[] paymentsValues = request.getParameterValues("payments[]");
            String[] cleanlinessValues = request.getParameterValues("cleanliness[]");
            String[] qualityValues = request.getParameterValues("quality[]");
            String[] staffValues = request.getParameterValues("staff[]");

            // Convert and set ratings
            feedback.setExperience(convertStringArrayToIntArray(experienceValues));
            feedback.setTicketEase(convertStringArrayToIntArray(ticketEaseValues));
            feedback.setPayments(convertStringArrayToIntArray(paymentsValues));
            feedback.setCleanliness(convertStringArrayToIntArray(cleanlinessValues));
            feedback.setQuality(convertStringArrayToIntArray(qualityValues));
            feedback.setStaff(convertStringArrayToIntArray(staffValues));

            // Calculate total selections
            feedback.calculateTotalSelections();

            // Submit feedback through service
            feedbackService.submitFeedback(feedback);

            // Set success attributes and redirect
            HttpSession session = request.getSession();
            session.setAttribute("totalSelections", feedback.getTotalSelections());
            session.setAttribute("message",
                    String.format("Thank you for your feedback! You made %d selections.",
                            feedback.getTotalSelections()));

            double overallAverage = feedbackService.calculateOverallAverage(feedback);
            request.setAttribute("overallAverage", overallAverage);
            // Redirect to success page
            request.getRequestDispatcher("/views/client/feedback-success.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid rating value provided: " + e.getMessage());
        } catch (Exception e) {
            handleError(request, response, "Error processing feedback: " + e.getMessage());
        }
    }





    private int[] convertStringArrayToIntArray(String[] stringArray) throws NumberFormatException {
        int[] intArray = new int[stringArray.length];
        for (int i = 0; i < stringArray.length; i++) {
            intArray[i] = Integer.parseInt(stringArray[i].trim());
            // Validate rating value (1-5)
            if (intArray[i] < 1 || intArray[i] > 5) {
                throw new NumberFormatException("Rating must be between 1 and 5");
            }
        }
        return intArray;
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
        request.getRequestDispatcher("/feedback.jsp").forward(request, response);
    }
}