package com.example.movie_booking.service;

import com.example.movie_booking.dao.ContactMessageDAO;
import com.example.movie_booking.model.ContactMessage;

import java.sql.SQLException;

public class ContactMessageService {

    private ContactMessageDAO contactMessageDAO;

    public ContactMessageService() {
        this.contactMessageDAO = new ContactMessageDAO();
    }

    public  void saveContactMessage(ContactMessage contactMessage){
        try {
            contactMessageDAO.saveContactMessage(contactMessage);
        } catch (SQLException e) {
            e.printStackTrace();
            throw  new RuntimeException("Failed to save contact message");
        }
    }


}
