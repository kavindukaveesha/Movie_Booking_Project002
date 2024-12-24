package com.example.movie_booking.controller.client;



import com.example.movie_booking.model.Movie;
import com.example.movie_booking.service.MovieService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@WebServlet("/movies")
public class MovieController extends HttpServlet {
    MovieService movieService = new MovieService();
    // Handles displaying the Review Us form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the review-us.jsp page where the review form is presented


        List<Movie> activeMovies = movieService.getAllActiveMovies();

        // Set the movies as a request attribute
        System.out.println(activeMovies.isEmpty());

        request.setAttribute("movies", activeMovies);

       request.getRequestDispatcher("/views/client/all-movies.jsp").forward(request, response);
    }


}
