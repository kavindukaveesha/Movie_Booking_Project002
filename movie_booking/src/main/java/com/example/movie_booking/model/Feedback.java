package com.example.movie_booking.model;

public class Feedback {

    private String name;
    private String email;
    private int experience;
    private int ticketEase;
    private int paymentEase;
    private int cleanliness;
    private int soundQuality;
    private int staffExperience;
    private String suggestions;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public int getTicketEase() {
        return ticketEase;
    }

    public void setTicketEase(int ticketEase) {
        this.ticketEase = ticketEase;
    }

    public int getPaymentEase() {
        return paymentEase;
    }

    public void setPaymentEase(int paymentEase) {
        this.paymentEase = paymentEase;
    }

    public int getCleanliness() {
        return cleanliness;
    }

    public void setCleanliness(int cleanliness) {
        this.cleanliness = cleanliness;
    }

    public int getSoundQuality() {
        return soundQuality;
    }

    public void setSoundQuality(int soundQuality) {
        this.soundQuality = soundQuality;
    }

    public int getStaffExperience() {
        return staffExperience;
    }

    public void setStaffExperience(int staffExperience) {
        this.staffExperience = staffExperience;
    }

    public String getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(String suggestions) {
        this.suggestions = suggestions;
    }
}
