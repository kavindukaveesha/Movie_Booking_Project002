package com.example.movie_booking.service;

import com.example.movie_booking.dao.ContactMessageDAO;
import com.example.movie_booking.model.ContactMessage;

import java.sql.SQLException;

public class ContactMessageService {

    private ContactMessageDAO contactMessageDAO;

    public ContactMessageService() {
        this.contactMessageDAO = new ContactMessageDAO();
    }

    public void saveContactMessage(ContactMessage contactMessage) {
        try {
            validateContactMessage(contactMessage);
            this.contactMessageDAO.saveContactMessage(contactMessage);
        } catch (SQLException e) {
            System.err.println("Database error in service layer: " + e.getMessage());
            throw new RuntimeException("Failed to save contact message", e);
        } catch (Exception e) {
            System.err.println("Unexpected error in service layer: " + e.getMessage());
            throw new RuntimeException("Service error occurred", e);
        }
    }

    private void validateContactMessage(ContactMessage message) {
        if (message == null) {
            throw new IllegalArgumentException("Contact message cannot be null");
        }
        if (message.getName() == null || message.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Name is required");
        }
        if (message.getEmail() == null || message.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required");
        }
        if (message.getMessage() == null || message.getMessage().trim().isEmpty()) {
            throw new IllegalArgumentException("Message is required");
        }
    }
}