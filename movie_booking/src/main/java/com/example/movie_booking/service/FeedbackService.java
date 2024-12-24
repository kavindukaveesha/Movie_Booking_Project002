package com.example.movie_booking.service;

import com.example.movie_booking.dao.FeedbackDAO;
import com.example.movie_booking.model.Feedback;

public class FeedbackService {
    private FeedbackDAO feedbackDAO;

    public FeedbackService() {
        this.feedbackDAO = new FeedbackDAO();
    }

    public void submitFeedback(Feedback feedback) throws Exception {
        try {
            validateFeedback(feedback);
            feedback.calculateTotalSelections();
            feedbackDAO.addFeedback(feedback);

            double overallAverage = calculateOverallAverage(feedback);
            System.out.println("Overall average rating: " + overallAverage);

        } catch (Exception e) {
            throw new Exception("Error submitting feedback: " + e.getMessage());
        }
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

    // Method to calculate overall average rating across all feedback categories
    public double calculateOverallAverage(Feedback feedback) {
        int totalSum = 0;
        int totalRatingsCount = 0;

        // Array of all rating categories
        int[][] allRatings = {
                feedback.getExperience(),
                feedback.getTicketEase(),
                feedback.getPayments(),
                feedback.getCleanliness(),
                feedback.getQuality(),
                feedback.getStaff()
        };

        // Loop through each category and calculate the sum and count of ratings
        for (int[] ratings : allRatings) {
            if (ratings != null) {
                for (int rating : ratings) {
                    totalSum += rating;
                    totalRatingsCount++;
                }
            }
        }

        // Return the average rating or 0 if no ratings were provided
        return totalRatingsCount > 0 ? (double) totalSum / totalRatingsCount : 0.0;
    }
}

