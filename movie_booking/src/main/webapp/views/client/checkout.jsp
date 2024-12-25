

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.movie_booking.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - ABC Cinema</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <script src="https://js.stripe.com/v3/"></script>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background: linear-gradient(to bottom, black, rgba(75, 0, 130, 1));
            color: white;
        }
        header {
            background-color: black;
            color: white;
            height: 69px;
            padding-left: 23px;
            padding-right: 45px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            color: #FFD700;
        }
        .logo img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }
        header nav a {
            color: white;
            text-decoration: none;
        }
        header nav a:hover {
            color: yellow;
        }
        header .actions button {
            background-color: red;
            border: none;
            border-radius: 5px;
            color: white;
            padding: 0.5rem 1rem;
            cursor: pointer;
        }
        main {
            padding: 2rem;
        }
        h1 {
            font-size: 2rem;
        }
        .grid-container {
            display: grid;
            grid-template-columns: 1fr;
        }
        @media (min-width: 1024px) {
            .grid-container {
                grid-template-columns: 2fr 1fr;
            }
        }
        .form-section {
            padding: 0 69px;
        }
        .form-section h2 {
            font-size: 1.5rem;
        }
        .form-section .input-group {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #6b7280;
            margin-bottom: 1rem;
        }
        .form-section .input-group input {
            background: transparent;
            color: white;
            border: none;
            outline: none;
        }
        .form-section .input-group i {
            margin-right: 0.5rem;
        }
        .payment-options {
            display: flex;
            gap: 1rem;
        }
        .payment-option {
            flex: 1;
            padding: 0.75rem;
            border: 1px solid #ccc;
            border-radius: 0.25rem;
            cursor: pointer;
            background-color: #ffffff;
            color: black;
        }
        .payment-option.selected {
            background-color: yellow;
            color: black;
        }
        aside {
            background-color: #7b00a843;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            border-radius: 0.25rem;
        }
        aside h2 {
            font-size: 1.25rem;
        }
        aside .details .row {
            display: flex;
            justify-content: space-between;
        }
        aside .total {
            font-weight: bold;
            font-size: 1.25rem;
        }
        aside button {
            width: 100%;
            background-color: #fcd34d;
            color: black;
            border: none;
            padding: 0.75rem;
            border-radius: 0.25rem;
            cursor: pointer;
            font-size: 1rem;
            margin-top: 50px;
        }
        footer {
            background-color: rgba(24, 1, 97, 0.65);
            color: white;
            padding: 30px 0;
            position: absolute;
            width: 100%;
            height: 246px;
        }
        footer .logo {
            padding-left: 23px;
            gap: 7rem;
            margin-right: 146px;
        }
        footer .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto 100px;
        }
        footer nav {
            display: flex;
            gap: 7rem;
            margin-left: 93px;
        }
        footer nav a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
        }
        footer nav a:hover {
            color: #FFD700;
        }
        footer .socials {
            text-align: right;
            margin-top: 10px;
            margin-left: 322px;
        }
        footer .socials-header p {
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }
        footer .socials-links {
            display: flex;
            gap: 1rem;
        }
        footer .socials-links a {
            color: white;
            font-size: 1.5rem;
            text-decoration: none;
        }
        footer .socials-links a:hover {
            color: #FFD700;
        }
        footer hr {
            border-top: 1px solid white;
            margin-top: 89px;
        }
        footer .footer-bottom {
            text-align: center;
            font-size: 0.9rem;
        }
    </style>
</head>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login");
        return;
    }
    User user = (User) session.getAttribute("user");
    Map<String, Object> bookingDetails = (Map<String, Object>) request.getAttribute("bookingDetails");
    if (bookingDetails == null) {
        response.sendRedirect(request.getContextPath() + "/select-movie");
        return;
    }
    // Store bookingDetails in session
    session.setAttribute("bookingDetails", bookingDetails);




%>
<body>

<jsp:include page="/components/client-navbar.jsp"/>

<main>
    <h1>Checkout <i class="fas fa-shopping-cart"></i></h1>
    <div class="grid-container">
        <section class="form-section">
            <h2>Contact information</h2>
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" id="fullName" name="fullName" placeholder="Full Name" value="<%= user.getFullName()%>" required>
            </div>
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" id="email" name="email" placeholder="Email" value="<%= user.getEmail()%>" required>
            </div>
            <div class="input-group">
                <i class="fas fa-phone"></i>
                <input type="text" id="mobile" name="mobile" placeholder="Mobile Number" value="<%= user.getMobile() %>" required>
            </div>
        </section>
        <aside id="checkout-summary">
            <h2>Order Summary</h2>
            <form id="bookingForm" action="${pageContext.request.contextPath}/checkout-method" method="post">
                <input type="hidden" name="action" value="checkout-method">
                <div class="details">
                    <div class="row">
                        <span>Total</span>
                        <span id="total">Rs."/></span>
                    </div>
                    <button type="submit" id="submit-button">Proceed to Payment</button>
                </div>
            </form>

        </aside>
    </div>
</main>

<jsp:include page="/components/client-footer.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize Stripe
        var stripe = Stripe('pk_test_51QWv90HGW1CG3lRCYRH81MFVkKaSwGGgopT17X0UWq7v9EegdfEv8LZxlEigsBPF2ou0RpSZKgVjsWY32pcHuAw000WJ3UrPcg');

        // Update totals
        updateTotals();

        // Handle form submission
        var form = document.getElementById('payment-form');
        form.addEventListener('submit', function(event) {
            event.preventDefault();

            // Update hidden form fields
            document.getElementById('form-fullName').value = document.getElementById('fullName').value;
            document.getElementById('form-email').value = document.getElementById('email').value;
            document.getElementById('form-mobile').value = document.getElementById('mobile').value;

            // Disable submit button
            document.getElementById('submit-button').disabled = true;

            // Submit form to create checkout session
            fetch('<%=request.getContextPath()%>/checkout-method', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams(new FormData(form))
            })
                .then(function(response) {
                    return response.json();
                })
                .then(function(session) {
                    return stripe.redirectToCheckout({ sessionId: session.id });
                })
                .then(function(result) {
                    if (result.error) {
                        alert(result.error.message);
                        document.getElementById('submit-button').disabled = false;
                    }
                })
                .catch(function(error) {
                    console.error('Error:', error);
                    alert('There was an error processing your payment. Please try again.');
                    document.getElementById('submit-button').disabled = false;
                });
        });
    });

    function updateTotals() {
        var totalElement = document.getElementById('total');
        var subtotal =<%= bookingDetails.get("totalPrice") %>
        var bookingFee = 20;
        var total = subtotal + bookingFee;
        totalElement.innerHTML = 'Rs. ' + total;
        document.getElementById('form-total').value = total;
    }
</script>

</body>
</html>