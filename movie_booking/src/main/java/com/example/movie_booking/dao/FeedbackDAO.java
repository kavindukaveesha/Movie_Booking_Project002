package com.example.movie_booking.dao;

import com.example.movie_booking.model.Feedback;
import com.example.movie_booking.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private Connection connection;

    public FeedbackDAO() throws Exception {
        connection = DBConnection.getConnection();
    }

    public void addFeedback(Feedback feedback) throws SQLException {
        String sql = "INSERT INTO feedback (name, email, experience_rating, ticket_ease_rating, " +
                "payment_rating, cleanliness_rating, quality_rating, staff_rating, " +
                "suggestions, total_selections, total_rate, date) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
            ps.setInt(11, feedback.getTotalRate());
            ps.setTimestamp(12, feedback.getSubmissionDate());

            System.out.println("Executing SQL: " + sql);
            ps.executeUpdate();
        }
    }

    public List<Feedback> getAllFeedback() throws SQLException {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM feedback ORDER BY date DESC";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setName(rs.getString("name"));
                feedback.setEmail(rs.getString("email"));
                feedback.setSuggestions(rs.getString("suggestions"));
                feedback.setTotalSelections(rs.getInt("total_selections"));
                feedback.setTotalRate(rs.getInt("total_rate"));
                feedback.setSubmissionDate(rs.getTimestamp("date"));
                feedback.setExperience(new int[]{rs.getInt("experience_rating")});
                feedback.setTicketEase(new int[]{rs.getInt("ticket_ease_rating")});
                feedback.setPayments(new int[]{rs.getInt("payment_rating")});
                feedback.setCleanliness(new int[]{rs.getInt("cleanliness_rating")});
                feedback.setQuality(new int[]{rs.getInt("quality_rating")});
                feedback.setStaff(new int[]{rs.getInt("staff_rating")});
                feedbackList.add(feedback);
            }
        }
        return feedbackList;
    }

    private int calculateAverage(int[] ratings) {
        if(ratings == null || ratings.length == 0) return 0;
        int sum = 0;
        for(int rating : ratings){
            sum +=rating;
        }
        return (int) Math.round((double) sum / ratings.length);
    }
}