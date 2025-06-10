package com.wfm.model;

public class TechnicianStatistics {
    
    private int id;
    private String username;
    private String whatsapp;
    private String status;
    private int totalTicketsAssigned;
    private int ticketsInProgress;
    private int ticketsCompleted;
    private int ticketsApproved;
    
    // Constructors
    public TechnicianStatistics() {
    }
    
    public TechnicianStatistics(int id, String username, String whatsapp, String status, 
                               int totalTicketsAssigned, int ticketsInProgress, 
                               int ticketsCompleted, int ticketsApproved) {
        this.id = id;
        this.username = username;
        this.whatsapp = whatsapp;
        this.status = status;
        this.totalTicketsAssigned = totalTicketsAssigned;
        this.ticketsInProgress = ticketsInProgress;
        this.ticketsCompleted = ticketsCompleted;
        this.ticketsApproved = ticketsApproved;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getWhatsapp() {
        return whatsapp;
    }
    
    public void setWhatsapp(String whatsapp) {
        this.whatsapp = whatsapp;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getTotalTicketsAssigned() {
        return totalTicketsAssigned;
    }
    
    public void setTotalTicketsAssigned(int totalTicketsAssigned) {
        this.totalTicketsAssigned = totalTicketsAssigned;
    }
    
    public int getTicketsInProgress() {
        return ticketsInProgress;
    }
    
    public void setTicketsInProgress(int ticketsInProgress) {
        this.ticketsInProgress = ticketsInProgress;
    }
    
    public int getTicketsCompleted() {
        return ticketsCompleted;
    }
    
    public void setTicketsCompleted(int ticketsCompleted) {
        this.ticketsCompleted = ticketsCompleted;
    }
    
    public int getTicketsApproved() {
        return ticketsApproved;
    }
    
    public void setTicketsApproved(int ticketsApproved) {
        this.ticketsApproved = ticketsApproved;
    }
    
    // Helper method untuk menghitung completion rate
    public double getCompletionRate() {
        if (totalTicketsAssigned == 0) {
            return 0.0;
        }
        return (double) ticketsApproved / totalTicketsAssigned * 100;
    }
}