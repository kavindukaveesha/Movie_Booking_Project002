package com.example.movie_booking.dao;

import com.example.movie_booking.model.ContactMessage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactMessageDAO {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/moviedb";
    private static final String DB_USERNAME = "postgres";
    private static final String DB_PASSWORD = "mysql";


    public ContactMessageDAO() {
        // Load the PostgreSQL driver
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL JDBC Driver not found", e);
        }
    }

    public void saveContactMessage(ContactMessage contactMessage) throws SQLException {
        String query = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";

        try (Connection connection = createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            System.out.println("Preparing to save message from: " + contactMessage.getName());

            preparedStatement.setString(1, contactMessage.getName());
            preparedStatement.setString(2, contactMessage.getEmail());
            preparedStatement.setString(3, contactMessage.getMessage());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Contact message saved successfully");
            } else {
                throw new SQLException("Failed to insert contact message");
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            throw new SQLException("Failed to save contact message: " + e.getMessage(), e);
        }
    }


    private Connection createConnection() throws SQLException {
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            conn.setAutoCommit(true);
            return conn;
        } catch (SQLException e) {
            System.err.println("Failed to connect to database: " + e.getMessage());
            throw e;
        }
    }
}