package com.example.movie_booking.dao;

import com.example.movie_booking.model.Feedback;
import com.example.movie_booking.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FeedbackDAO {
    private Connection connection;

    public FeedbackDAO() {
        connection = DBUtil.getConnection();
    }

    public void addFeedback(Feedback feedback) throws SQLException {
        String sql = "INSERT INTO feedback (name, email, experience_rating, ticket_ease_rating, " +
                "payment_rating, cleanliness_rating, quality_rating, staff_rating, " +
                "suggestions, total_selections) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, feedback.getName());
            ps.setString(2, feedback.getEmail());
            ps.setInt(3, calculateAverage(feedback.getExperience()));
            ps.setInt(4, calculateAverage(feedback.getTicketEase()));
            ps.setInt(5, calculateAverage(feedback.getPayments()));
            ps.setInt(6, calculateAverage(feedback.getCleanliness()));
            ps.setInt(7, calculateAverage(feedback.getQuality()));
            ps.setInt(8, calculateAverage(feedback.getStaff()));
            ps.setString(9, feedback.getSuggestions());
            ps.setInt(10, feedback.getTotalSelections());

            ps.executeUpdate();
        }
    }

    private int calculateAverage(int[] ratings) {
        if (ratings == null || ratings.length == 0) {
            return 0;
        }
        int sum = 0;
        for (int rating : ratings) {
            sum += rating;
        }
        return sum / ratings.length;
    }
}
