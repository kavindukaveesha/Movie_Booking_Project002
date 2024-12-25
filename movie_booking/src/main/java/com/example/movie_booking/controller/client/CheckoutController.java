package com.example.movie_booking.controller.client;

import com.example.movie_booking.model.User;
import com.example.movie_booking.service.BookingService;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = {"/make-checkout", "/checkout-method"})
public class CheckoutController extends HttpServlet {
    private BookingService bookingService;
    private static final String STRIPE_SECRET_KEY = "sk_test_51QWv90HGW1CG3lRC61h8JAz0L2cuEYsEZKAEWM6lkhk5K3O6wyjPcuYoNxLkqm5LRAdg0GTmhhQVCTOpFQebSY5V00trOlUZyO";

    @Override
    public void init() {
        Stripe.apiKey = STRIPE_SECRET_KEY;
        bookingService = new BookingService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Action received: " + action); // Debugging output

        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
            return;
        }

        switch (action) {
            case "make-checkout":
                processMakeCheckout(request, response);
                break;
            case "checkout-method":
                processCheckoutMethod(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                break;
        }
    }

    private void processMakeCheckout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            System.out.println("No user in session, redirecting to login"); // Debugging output
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }
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

            // Add booking details to the request scope
            request.setAttribute("bookingDetails", bookingDetails);


            if (bookingDetails == null) {
                System.out.println("No booking details found, redirecting to movie selection"); // Debugging output
                response.sendRedirect(request.getContextPath() + "/select-movie");
                return;
            }

            // Debugging output of booking details
            System.out.println("Booking Details: " + bookingDetails);

            request.setAttribute("bookingDetails", bookingDetails);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/client/checkout.jsp");
            dispatcher.forward(request, response);

        } finally {

        }
    }

    private void processCheckoutMethod(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Map<String, Object> bookingDetails = (Map<String, Object>) session.getAttribute("bookingDetails");

        // Check if bookingDetails exists in the session
        if (bookingDetails == null) {
            System.out.println("No booking details found, redirecting to movie selection"); // Debugging output
            response.sendRedirect(request.getContextPath() + "/select-movie");
            return;
        }

        // Print the full booking details map for debugging
        System.out.println("Booking Details: " + bookingDetails);

        // Ensure all required keys are present and not null
        String movieId = bookingDetails.getOrDefault("movieId", "Unknown").toString();
        String showId = bookingDetails.getOrDefault("showId", "Unknown").toString();
        String showDate = bookingDetails.getOrDefault("showDate", "Unknown").toString();
        String showTime = bookingDetails.getOrDefault("showTime", "Unknown").toString();
        String selectedSeats = bookingDetails.getOrDefault("selectedSeats", "None").toString();
        String totalPriceStr = bookingDetails.getOrDefault("totalPrice", "0.0").toString();

        // Convert totalPrice to double safely
        double totalPrice = 0.0;
        try {
            totalPrice = Double.parseDouble(totalPriceStr);
        } catch (NumberFormatException e) {
            System.out.println("Invalid totalPrice value: " + totalPriceStr);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid total price in booking details.");
            return;
        }

        // Debugging outputs for individual values
        System.out.println("Movie ID: " + movieId);
        System.out.println("Show ID: " + showId);
        System.out.println("Show Date: " + showDate);
        System.out.println("Show Time: " + showTime);
        System.out.println("Selected Seats: " + selectedSeats);
        System.out.println("Total Price: " + totalPrice);

        // Validate user session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            System.out.println("No user found in session, redirecting to login"); // Debugging output
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        // Debugging output for user
        System.out.println("User: " + user.getFullName());

        // Proceed with Stripe session creation
        try {
            SessionCreateParams sessionParams = SessionCreateParams.builder()
                    .setMode(SessionCreateParams.Mode.PAYMENT)
                    .setSuccessUrl(String.format("%s://%s:%d%s/booking-success?session_id={CHECKOUT_SESSION_ID}", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath()))
                    .setCancelUrl(String.format("%s://%s:%d%s/booking-cancel", request.getScheme(), request.getServerName(), request.getServerPort(), request.getContextPath()))
                    .addLineItem(SessionCreateParams.LineItem.builder()
                            .setPriceData(SessionCreateParams.LineItem.PriceData.builder()
                                    .setCurrency("usd")
                                    .setUnitAmount((long) (totalPrice * 100))
                                    .setProductData(SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                            .setName(bookingDetails.getOrDefault("movieName", "Unknown Movie").toString())
                                            .setDescription("Booking for " + user.getFullName())
                                            .build())
                                    .build())
                            .setQuantity(1L)
                            .build())
                    .build();

            Session stripeSession = Session.create(sessionParams);
            bookingDetails.put("stripeSessionId", stripeSession.getId());

            session.setAttribute("bookingDetails", bookingDetails);
            response.sendRedirect(stripeSession.getUrl());
        } catch (StripeException e) {
            System.out.println("Stripe processing failed: " + e.getMessage()); // Debugging output
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Stripe processing failed: " + e.getMessage());
        }
    }

}
