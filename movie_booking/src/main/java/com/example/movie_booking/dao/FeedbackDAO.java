package com.example.movie_booking.dao;

import com.example.movie_booking.model.Feedback;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FeedbackDAO {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/moviedb";
    private static final String DB_USERNAME = "postgres";
    private static final String DB_PASSWORD = "mysql";

    public void saveFeedback(Feedback feedback) {
        String sql = "INSERT INTO feedback (name, email, experience, ticket_ease, payment_ease, cleanliness, sound_quality, staff_experience, suggestions) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, feedback.getName());
            stmt.setString(2, feedback.getEmail());
            stmt.setInt(3, feedback.getExperience());
            stmt.setInt(4, feedback.getTicketEase());
            stmt.setInt(5, feedback.getPaymentEase());
            stmt.setInt(6, feedback.getCleanliness());
            stmt.setInt(7, feedback.getSoundQuality());
            stmt.setInt(8, feedback.getStaffExperience());
            stmt.setString(9, feedback.getSuggestions());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
