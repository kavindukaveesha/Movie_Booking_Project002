package com.example.movie_booking.controller.client;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.ServerException;


@WebServlet("/contact-submit")
public class ContactSubmitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServerException, IOException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Message: " + message);

        response.setContentType("text/html");
        response.getWriter().println("<h3>Thank you for contacting us, " + name + "!</h3>");
    }

}
