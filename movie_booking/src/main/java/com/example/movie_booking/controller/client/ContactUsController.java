package com.example.movie_booking.controller.client;

import com.example.movie_booking.model.ContactMessage;
import com.example.movie_booking.service.ContactMessageService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

import java.io.IOException;

@WebServlet("/contact-us")
public class ContactUsController extends HttpServlet {
    private ContactMessageService contactMessageService;

    @Override
    public void init() {
        this.contactMessageService = new ContactMessageService();
    }

    // Display the contact form using doGet
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the contact-us.jsp page
        request.getRequestDispatcher("/views/client/contact-us.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");

        try {
            String name = validateInput(request.getParameter("name"), "Name");
            String email = validateInput(request.getParameter("email"), "Email");
            String message = validateInput(request.getParameter("message"), "Message");

            if (!isValidEmail(email)) {
                throw new IllegalArgumentException("Invalid email format");
            }

            ContactMessage contactMessage = new ContactMessage();
            contactMessage.setName(name);
            contactMessage.setEmail(email);
            contactMessage.setMessage(message);

            if(contactMessageService.saveContactMessage(contactMessage))
            {
                response.getWriter().write("{\"status\":\"success\",\"message\":\"Thank you for contacting us!\"}");
            }else {
                response.getWriter().write("{\"status\":\"Error\",\"message\":\"Error\"}");

            }

        } catch (IllegalArgumentException e) {
            response.setStatus(400); // Bad Request
            response.getWriter().write("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        } catch (Exception e) {
            System.err.println("Error in ContactSubmitServlet: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(500);
            response.getWriter().write("{\"status\":\"error\",\"message\":\"Server error occurred\"}");
        }
    }

    private String validateInput(String input, String fieldName) {
        if (input == null || input.trim().isEmpty()) {
            throw new IllegalArgumentException(fieldName + " is required");
        }
        return input.trim();
    }

    private boolean isValidEmail(String email) {
        return email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
    }
}
