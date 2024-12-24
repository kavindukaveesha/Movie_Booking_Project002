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

    public void saveContactMessage(ContactMessage contactMessage) throws SQLException{
        String query = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
        System.out.println("Connecting to database...");

        try(Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            System.out.println("Database connected");

            preparedStatement.setString(1, contactMessage.getName());
            preparedStatement.setString(2,contactMessage.getEmail());
            preparedStatement.setString(3,contactMessage.getMessage());

            System.out.println("Executing query: " + query);
            preparedStatement.executeUpdate();

            System.out.println("Contact message saved successfully");
        } catch (SQLException e) {
            System.err.println("Error while saving contact message: " + e.getMessage());
            throw new RuntimeException("Failed to save contact message", e);
        }

    }
}
