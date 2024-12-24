package com.example.movie_booking.service;

import com.example.movie_booking.dao.MovieDAO;
import com.example.movie_booking.model.Movie;

import java.util.List;

public class MovieService {
    private final MovieDAO movieDAO =new MovieDAO();

    public int addMovie(Movie movie) {

        return movieDAO.insertMovie(movie);
    }



    public List<Movie> getAllMovies() throws Exception {
        return movieDAO.fetchAllMovies();
    }


    public Movie getMovieById(int movieId) {
        return movieDAO.getMovieById(movieId);
    }

    public boolean updateMovie(Movie movie) {
        return movieDAO.updateMovie(movie);
    }


    //--------------get movies for home page active ---------

    public List<Movie> getAllActiveMovies() {
        return movieDAO.getMoviesByStatus("Active");
    }


}
