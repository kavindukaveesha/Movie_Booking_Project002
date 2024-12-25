package com.example.movie_booking.dao;


import com.example.movie_booking.model.Booking;
import com.example.movie_booking.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    public boolean addBooking(Booking booking) {
        String query = "INSERT INTO bookings (userId, movieName, date, time, seatNumbers, totalPrice) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, booking.getUserId());
            stmt.setString(2, booking.getMovieName());
            stmt.setString(3, booking.getDate());
            stmt.setString(4, booking.getTime());
            stmt.setArray(5, conn.createArrayOf("INTEGER", booking.getSeatNumbers().toArray()));
            stmt.setDouble(6, booking.getTotalPrice());
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
