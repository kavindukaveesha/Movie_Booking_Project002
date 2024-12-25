package com.example.movie_booking.model;


import java.util.Date;
import java.util.List;

public class Booking {
    private int id;
    private int userId;
    private String movieName;
    private String date;
    private String time;
    private List<Integer> seatNumbers;
    private double totalPrice;

    public Booking(int id, int userId, String movieName, String date, String time, List<Integer> seatNumbers, double totalPrice) {
        this.id = id;
        this.userId = userId;
        this.movieName = movieName;
        this.date = date;
        this.time = time;
        this.seatNumbers = seatNumbers;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getMovieName() { return movieName; }
    public void setMovieName(String movieName) { this.movieName = movieName; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public List<Integer> getSeatNumbers() { return seatNumbers; }
    public void setSeatNumbers(List<Integer> seatNumbers) { this.seatNumbers = seatNumbers; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
}
