package com.example.movie_booking.controller.client;

import com.example.movie_booking.service.BookingService;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

import org.json.JSONObject;

@WebServlet("/make-checkout")
public class CheckoutController extends HttpServlet {
    private BookingService bookingService;
    private static final String STRIPE_SECRET_KEY = "sk_test_51QWv90HGW1CG3lRC61h8JAz0L2cuEYsEZKAEWM6lkhk5K3O6wyjPcuYoNxLkqm5LRAdg0GTmhhQVCTOpFQebSY5V00trOlUZyO";

    @Override
    public void init() {
        Stripe.apiKey = STRIPE_SECRET_KEY;
        bookingService = new BookingService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, Object> bookingDetails = (Map<String, Object>) session.getAttribute("bookingDetails");
        if (bookingDetails != null) {
            // Process the booking details
            request.setAttribute("bookingDetails", bookingDetails);
        }
        request.getRequestDispatcher("/views/client/checkout.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        int amount;

        try {
            amount = (int)(Double.parseDouble(request.getParameter("totalAmount")) * 100); // Convert to cents

            // Create Stripe Checkout Session
            SessionCreateParams sessionParams = SessionCreateParams.builder()
                    .setMode(SessionCreateParams.Mode.PAYMENT)
                    .setSuccessUrl(request.getScheme() + "://" + request.getServerName() + ":" +
                            request.getServerPort() + request.getContextPath() + "/booking-success?session_id={CHECKOUT_SESSION_ID}")
                    .setCancelUrl(request.getScheme() + "://" + request.getServerName() + ":" +
                            request.getServerPort() + request.getContextPath() + "/booking-cancel")
                    .addLineItem(
                            SessionCreateParams.LineItem.builder()
                                    .setPriceData(
                                            SessionCreateParams.LineItem.PriceData.builder()
                                                    .setCurrency("usd")
                                                    .setUnitAmount((long) amount)
                                                    .setProductData(
                                                            SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                                                    .setName("Movie Tickets for " + fullName)
                                                                    .setDescription("Booking for " + fullName)
                                                                    .build())
                                                    .build())
                                    .setQuantity(1L)
                                    .build())
                    .build();

            Session session = Session.create(sessionParams);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("bookingDetails", new JSONObject()
                    .put("fullName", fullName)
                    .put("email", email)
                    .put("mobile", mobile)
                    .put("amount", amount / 100) // Store in standard currency format
                    .put("stripeSessionId", session.getId())
                    .toString());

            // Redirect to Stripe Checkout
            response.sendRedirect(session.getUrl());

        } catch (NumberFormatException | StripeException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Failed to process payment: " + e.getMessage());
        }
    }}
