package com.example.movie_booking.service;


import com.example.movie_booking.dao.BookingDAO;
import com.example.movie_booking.model.Booking;

public class BookingService {

    private BookingDAO bookingDAO;

    public BookingService() {
        this.bookingDAO = new BookingDAO();
    }

    public boolean createBooking(Booking booking) {
        // Here you would integrate with Stripe to process the payment
        // If payment is successful:
        return bookingDAO.addBooking(booking);
        // Else, return false or throw an exception
    }
}

