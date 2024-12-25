package com.example.movie_booking.controller.client;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/seat-booking")
public class SeatBookingController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        try {
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            String showId = request.getParameter("showId");
            String showDate = request.getParameter("showDate");
            String showTime = request.getParameter("showTime");
            String selectedSeats = request.getParameter("selectedSeats");
            double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
            String movieName = request.getParameter("movieName");

            Map<String, Object> bookingDetails = new HashMap<>();
            bookingDetails.put("movieId", movieId);
            bookingDetails.put("showId", showId);
            bookingDetails.put("showDate", showDate);
            bookingDetails.put("showTime", showTime);
            bookingDetails.put("selectedSeats", selectedSeats);
            bookingDetails.put("totalPrice", totalPrice);

            request.setAttribute("bookingDetails", bookingDetails);
            RequestDispatcher dispatcher = request.getRequestDispatcher( request.getContextPath()+"/make-checkout");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.sendRedirect("error.jsp");
        }
    }
}

