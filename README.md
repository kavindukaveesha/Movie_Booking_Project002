# 🎥 Java EE Movie Booking System

A comprehensive **Java EE-based movie booking system** designed to provide seamless ticket booking experiences for users and robust management capabilities for administrators.

---

## 📜 Table of Contents
- [✨ Features](#-features)
- [🛠️ Technologies Used](#️-technologies-used)
- [🚀 Getting Started](#-getting-started)
- [📖 User Flow](#-user-flow)
- [📷 Screenshots](#-screenshots)
- [🔒 Admin Panel](#-admin-panel)
- [⚙️ Setup Instructions](#️-setup-instructions)
- [🌟 Future Enhancements](#-future-enhancements)
- [👥 Contributors](#-contributors)

---

## ✨ Features

### 🚶 User Features
- **Home Page:** Displays currently showing movies.
- **Movies Page:** Browse all available movies.
- **Movie Details:** View details of individual movies, including trailers and descriptions.
- **Seat Booking:** Interactive seat selection system.
- **Checkout:** Review and confirm booking details.
- **Payment Gateway:** Integrated with PayPal for secure payments.
- **User Authentication:**
  - Sign up with email verification.
  - Login and password reset with email verification.
- **Feedback Page:** Provide feedback about the service.
- **Contact Us Page:** Contact form for user inquiries.
- **Email Notifications:**
  - Booking confirmation email.
  - Booking cancellation email.
  - Email verification during registration.

### 🔑 Admin Panel
- **Dashboard:** Overview of bookings, payments, and feedback.
- **Manage Movies:** Add, edit, or remove movies.
- **Manage Users:** View and manage registered users.
- **View Feedback:** Monitor user feedback for service improvements.

---

## 🛠️ Technologies Used

- **Backend:** Java EE (Servlets, JSP)
- **Frontend:** HTML, CSS, JavaScript, JSTL
- **Database:** MySQL
- **Authentication:** JavaMail API for email verification
- **Payment Gateway:** PayPal API
- **Build Tool:** Apache Maven
- **Server:** Apache Tomcat

---

## 🚀 Getting Started

### Prerequisites
- Java Development Kit (JDK) 8 or higher
- Apache Maven
- MySQL Database
- Apache Tomcat Server

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/kavindukaveesha/Movie_Booking_Project002.git
2. Import the project into your IDE.
3. Configure the database.properties file with your MySQL credentials.
4. Run the SQL scripts in the database/ folder to create necessary tables.
5. Build the project using Maven:
* bash
* Copy code
* mvn clean install
* Deploy the WAR file to Tomcat.

## 📖 User Flow
* Browse Movies: Home page lists featured movies.
* View Movie Details: Click on a movie to see its details.
* Book Tickets:
* Select a showtime, theater, and seats.
* Proceed to checkout.
* Complete payment via PayPal.
* Receive Confirmation: Booking confirmation email is sent.
* Manage Account: Reset password or update profile via email verification.
  
## 📷 Screenshots
* 🏠 Home Page


* 🎞️ Movie Details


* 🎟️ Seat Booking


* 🛒 Checkout
  

* 📊 Admin Dashboard


##🔒 Admin Panel
* Login: Secure admin login.
* Manage Movies: Add or update movie details with images.
* Monitor Bookings: View active and past bookings.
8 Manage Users: View and manage all registered users.
  
## ⚙️ Setup Instructions
* Configure Database:
* Import the database schema from the database/schema.sql file.

## Setup Email Service:
* Configure the mail.properties file with your SMTP credentials.

## Start the Server:
* Deploy the WAR file to Tomcat and access the application at:

*bash
*Copy code
*http://localhost:8080/movie-booking-system
*(Adjust port and context path if needed.)

## 🌟 Future Enhancements
* Mobile-friendly responsive design.
* Enhanced admin analytics dashboard.
* Support for additional payment gateways.
* Real-time notifications for booking updates.
  
## 👥 Contributors
* Pasith Nishshanka(https://github.com/pasithNishshanka)
* Dinesh Hashan(https://github.com/KDHBuddhika)
* Kavindu Kaveesha(https://github.com/kavindukaveesha)

