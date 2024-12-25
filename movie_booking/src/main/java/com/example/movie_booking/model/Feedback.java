package com.example.movie_booking.model;

import java.sql.Timestamp;

public class Feedback {

    private int id;
    private String name;
    private String email;
    private int[] experience;
    private int[] ticketEase;
    private int[] payments;
    private int[] cleanliness;
    private int[] quality;
    private int[] staff;
    private String suggestions;
    private int totalSelections;
    private int totalRate;
    private Timestamp submissionDate;


    // ID
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Experience
    public int[] getExperience() {
        return experience;
    }

    public void setExperience(int[] experience) {
        this.experience = experience;
    }

    // Ticket Ease
    public int[] getTicketEase() {
        return ticketEase;
    }

    public void setTicketEase(int[] ticketEase) {
        this.ticketEase = ticketEase;
    }

    // Payments
    public int[] getPayments() {
        return payments;
    }

    public void setPayments(int[] payments) {
        this.payments = payments;
    }

    // Cleanliness
    public int[] getCleanliness() {
        return cleanliness;
    }

    public void setCleanliness(int[] cleanliness) {
        this.cleanliness = cleanliness;
    }

    // Quality
    public int[] getQuality() {
        return quality;
    }

    public void setQuality(int[] quality) {
        this.quality = quality;
    }

    // Staff
    public int[] getStaff() {
        return staff;
    }

    public void setStaff(int[] staff) {
        this.staff = staff;
    }

    // Suggestions
    public String getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(String suggestions) {
        this.suggestions = suggestions;
    }


    // Total Selections
    public int getTotalSelections() {
        return totalSelections;
    }

    public void setTotalSelections(int totalSelections) {
        this.totalSelections = totalSelections;
    }

    public int getTotalRate() {
        return totalRate;
    }

    public void setTotalRate(int totalRate) {
        this.totalRate = totalRate;
    }

    public Timestamp getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Timestamp submissionDate){
        this.submissionDate = submissionDate;
    }
}