package com.example.movie_booking.service;

import com.example.movie_booking.dao.FeedbackDAO;
import com.example.movie_booking.model.Feedback;

public class FeedbackService {
    private FeedbackDAO feedbackDAO;

    public FeedbackService() {
        this.feedbackDAO = new FeedbackDAO();
    }

    public void processFeedback(Feedback feedback) {
        // Business logic, if any
        feedbackDAO.saveFeedback(feedback);
    }
}
