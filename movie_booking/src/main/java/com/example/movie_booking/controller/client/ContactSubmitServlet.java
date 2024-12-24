package com.example.movie_booking.controller.client;

import com.example.movie_booking.model.ContactMessage;
import com.example.movie_booking.service.ContactMessageService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.ServerException;


@WebServlet("/contact-submit")
public class ContactSubmitServlet extends HttpServlet {
  private ContactMessageService contactMessageService;

  @Override
    public void init(){
      this.contactMessageService = new ContactMessageService();
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
      System.out.println("Servlet triggered");
      response.setContentType("application/json");

      try {
          String name = request.getParameter("name");
          String email = request.getParameter("email");
          String message = request.getParameter("message");

          // Validate email format
          if (!isValidEmail(email)) {
              throw new IllegalArgumentException("Invalid email format");
          }

          System.out.println("Validated input - Name: " + name + ", Email: " + email);

          ContactMessage contactMessage = new ContactMessage();
          contactMessage.setName(name);
          contactMessage.setEmail(email);
          contactMessage.setMessage(message);

          this.contactMessageService.saveContactMessage(contactMessage);
          response.getWriter().write("{\"status\":\"success\",\"message\":\"Thank you for contacting us!\"}");
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