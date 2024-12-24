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


      String name = request.getParameter("name");
      String email = request.getParameter("email");
      String message = request.getParameter("message");

      System.out.println("Name: " + name + ", Email: " + email + ", Message: " + message);

      // Create ContactMessage object
      ContactMessage contactMessage = new ContactMessage();
      contactMessage.setName(name);
      contactMessage.setEmail(email);
      contactMessage.setMessage(message);

      try {
          contactMessageService.saveContactMessage(contactMessage);
          response.getWriter().write("{\"status\":\"success\",\"message\":\"Thank you for contacting us!\"}");
      } catch (Exception e) {
          response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
          response.getWriter().write("{\"status\":\"error\",\"message\":\"Something went wrong. Please try again later.\"}");
      }
  }
}
