package com.example.movie_booking.controller.client;

import com.example.movie_booking.model.Booking;
import com.example.movie_booking.service.BookingService;
import com.example.movie_booking.service.EmailService;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/booking-success")
public class BookingSuccessController extends HttpServlet {
    private final BookingService bookingService = new BookingService();
    private final EmailService emailService = new EmailService();

    @Override
    public void init() {
        // Initialize Stripe with the secret key
        Stripe.apiKey = "sk_test_51QWv90HGW1CG3lRC61h8JAz0L2cuEYsEZKAEWM6lkhk5K3O6wyjPcuYoNxLkqm5LRAdg0GTmhhQVCTOpFQebSY5V00trOlUZyO";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sessionId = request.getParameter("session_id");
        try {
            Session session = Session.retrieve(sessionId);

            if ("paid".equals(session.getPaymentStatus())) {
                HttpSession httpSession = request.getSession();
                JSONObject user = (JSONObject) httpSession.getAttribute("user");
                int userId = user.getInt("userId");
                String email = user.getString("email");

                String bookingDetailsJson = (String) httpSession.getAttribute("pendingBookingDetails");
                JSONObject bookingDetails = new JSONObject(bookingDetailsJson);

                Booking booking = createBookingFromJson(bookingDetails, userId);

                if (bookingService.createBooking(booking)) {
                    // Assuming you have a method to send emails
                    emailService.sendBookingConfirmationEmail(email, bookingDetails);
                    response.sendRedirect("booking-success.jsp");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create booking.");
                }
            } else {
                response.sendRedirect("payment-failed.jsp");
            }
        } catch (StripeException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Payment verification failed: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private Booking createBookingFromJson(JSONObject details, int userId) {
        List<Integer> seatNumbers = Arrays.asList(details.getString("selectedSeats").split(",")).stream()
                .map(Integer::parseInt).toList();
        return new Booking(
                0, // Assuming the ID is auto-generated
                userId,
                details.getString("movieName"),
                details.getString("date"),
                details.getString("time"),
                seatNumbers,
                details.getDouble("totalPrice")
        );
    }


}
