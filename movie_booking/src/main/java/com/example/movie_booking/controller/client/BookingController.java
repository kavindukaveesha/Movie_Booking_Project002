package com.example.movie_booking.controller.client;

import com.example.movie_booking.model.Booking;
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
import java.util.ArrayList;
import org.json.JSONObject;

@WebServlet("/make-booking")
public class BookingController extends HttpServlet {
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
        request.getRequestDispatcher("/views/client/booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form data
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            int amount = (int)(Double.parseDouble(request.getParameter("totalAmount")));

            // Create Stripe Checkout Session
            SessionCreateParams.Builder builder = SessionCreateParams.builder()
                    .setMode(SessionCreateParams.Mode.PAYMENT)
                    .setSuccessUrl(request.getScheme() + "://" +
                            request.getServerName() + ":" +
                            request.getServerPort() +
                            request.getContextPath() + "/booking-success")
                    .setCancelUrl(request.getScheme() + "://" +
                            request.getServerName() + ":" +
                            request.getServerPort() +
                            request.getContextPath() + "/booking-cancel")
                    .addLineItem(SessionCreateParams.LineItem.builder()
                            .setPriceData(SessionCreateParams.LineItem.PriceData.builder()
                                    .setCurrency("inr")
                                    .setUnitAmount((long) amount * 100) // Convert to cents
                                    .setProductData(SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                            .setName("Movie Tickets")
                                            .setDescription("Booking for " + fullName)
                                            .build())
                                    .build())
                            .setQuantity(1L)
                            .build());

            // Create the Checkout Session
            Session session = Session.create(builder.build());

            // Store booking details in session for later
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("pendingBookingDetails", new JSONObject()
                    .put("fullName", fullName)
                    .put("email", email)
                    .put("mobile", mobile)
                    .put("amount", amount)
                    .put("stripeSessionId", session.getId())
                    .toString());

            // Return session ID to client
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new JSONObject()
                    .put("id", session.getId())
                    .toString());

        } catch (NumberFormatException | NullPointerException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid amount or missing information.");
        } catch (StripeException e) {
            throw new ServletException("Payment processing error", e);
        }
    }
}