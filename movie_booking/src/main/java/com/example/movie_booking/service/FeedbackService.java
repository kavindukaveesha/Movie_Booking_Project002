package com.example.movie_booking.service;

import com.example.movie_booking.dao.FeedbackDAO;
import com.example.movie_booking.model.Feedback;

import java.util.List;

public class FeedbackService {
    private FeedbackDAO feedbackDAO =new FeedbackDAO();

    public FeedbackService() throws Exception {
    }


    public void submitFeedback(Feedback feedback) throws Exception {
        try {
            validateFeedback(feedback);
            calculateTotalSelections(feedback);
            calculateTotalRate(feedback);
            feedbackDAO.addFeedback(feedback);
        } catch (Exception e) {
            throw new Exception("Error submitting feedback: " + e.getMessage());
        }
    }

    public List<Feedback> getAllFeedback() throws Exception {
        return feedbackDAO.getAllFeedback();
    }

    private void validateFeedback(Feedback feedback) throws Exception {
        if (feedback.getName() == null || feedback.getName().trim().isEmpty()) {
            throw new Exception("Name is required");
        }
        if (feedback.getEmail() == null || !feedback.getEmail().matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            throw new Exception("Invalid email format");
        }
        if (feedback.getSuggestions() == null || feedback.getSuggestions().trim().isEmpty()) {
            throw new Exception("Suggestions are required");
        }
    }
    private void calculateTotalSelections(Feedback feedback) {
        int totalSelections = 0;
        if (feedback.getExperience() != null) totalSelections += feedback.getExperience().length;
        if (feedback.getTicketEase() != null) totalSelections += feedback.getTicketEase().length;
        if (feedback.getPayments() != null) totalSelections += feedback.getPayments().length;
        if (feedback.getCleanliness() != null) totalSelections += feedback.getCleanliness().length;
        if (feedback.getQuality() != null) totalSelections += feedback.getQuality().length;
        if (feedback.getStaff() != null) totalSelections += feedback.getStaff().length;
        feedback.setTotalSelections(totalSelections);
    }
    public void calculateTotalRate(Feedback feedback) {
        int sum = 0;
        int count = 0;
        int[][] allRatings = {
                feedback.getExperience(),
                feedback.getTicketEase(),
                feedback.getPayments(),
                feedback.getCleanliness(),
                feedback.getQuality(),
                feedback.getStaff()
        };

        for (int[] ratings : allRatings) {
            if (ratings != null) {
                for (int rating : ratings) {
                    if(rating > 0){
                        sum += rating;
                        count++;
                    }
                }
            }

        }

        feedback.setTotalRate(count > 0 ? Math.round((float)sum / count) : 0);
    }
}