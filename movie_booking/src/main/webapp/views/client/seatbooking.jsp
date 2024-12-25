<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Booking - ${movie.title}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom, #2a0a4a, #1a0632);
            color: white;
            margin: 0;
            padding: 0px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .movie-info {
            display: flex;
            margin-bottom: 30px;
            gap: 20px;
            margin-top: 12px;
        }

        .movie-info img {
            width: 200px;
            border-radius: 10px;
        }

        .movie-details {
            flex: 1;
        }

        .movie-details h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .movie-details p {
            margin: 5px 0;
            margin-bottom: 12px;
        }

        .dropdowns {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
        }

        .dropdowns select {
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #6a0dad;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        .dropdowns .next-button {
            padding: 10px 20px;
            background-color: #FFD700;
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .seat-map {
            display: none;
            flex-direction: column;
            align-items: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .column-labels {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
        }

        .column-label {
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            margin: 0 5px;
            font-weight: bold;
        }

        .seat-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .row-label {
            width: 30px;
            text-align: center;
            margin-right: 15px;
            font-size: 16px;
        }

        .seat {
            width: 30px;
            height: 30px;
            margin: 0 5px;
            border-radius: 5px;
            background-color: #87CEEB;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .seat.selected {
            background-color: #FFD700;
        }

        .seat.sold {
            background-color: red;
            cursor: not-allowed;
        }

        .selected-info {
            margin-top: 20px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
        }

        .selected-info p {
            margin: 5px 0;
        }

        .purchase-button {
            background-color: #FFD700;
            color: black;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 10px;
            display: block;
            width: 100%;
        }

        /* Navbar Styles */
        header {
            margin-top: 0;
            display: flex;
            justify-content: space-between;

            align-items: center;
            padding: 20px 40px;
            background-color: rgba(0, 0, 0, 0.9); /* Dark background with opacity */
        }
        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
        }
        .logo img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }
        .logo span {
            color: #FFD700; /* Golden color for "ABC" */
        }
        nav ul {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            margin: 0 20px;
        }
        nav ul li a {
            color: #FFFFFF;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
        }


        /* Footer Styles */
        footer {
            margin-top: 12px;
            background-color: rgba(0, 0, 0, 0.3);
            padding: 20px 40px;
        }
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .footer-logo {
            display: flex;
            align-items: center;
        }
        .footer-logo img {
            width: 30px;
            margin-right: 10px;
        }
        .footer-logo span {
            color: #FFD700;
            font-weight: bold;
        }
        .footer-links a {
            color: #FFFFFF;
            text-decoration: none;
            margin-right: 20px;
        }
        .social-icons {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .social-icons span {
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<nav>
    <jsp:include page="/components/client-navbar.jsp" />
</nav>
<div class="container">



    <!-- Movie Info -->
    <div class="movie-info">
        <img src="${movie.imageUrl}" alt="${movie.title}">
        <div class="movie-details">
            <h1>${movie.title}</h1>
            <p><strong style="color:#FFD700">Description:</strong> ${movie.description}</p>
            <p><strong style="color:#FFD700">Language:</strong> ${movie.language}</p>
            <p><strong style="color:#FFD700">Age Range:</strong> ${movie.ageRange}</p>
            <p><strong style="color:#FFD700">Rating:</strong> ★ ${movie.rating}</p>
            <p><strong style="color:#FFD700">Price:</strong> Rs. ${movie.price}</p>
        </div>
    </div>

    <!-- Dropdowns -->
    <div class="dropdowns">
        <select id="date">
            <c:forEach var="showtime" items="${showtimes}">
                <option value="${showtime.date}">${showtime.date}</option>
            </c:forEach>
        </select>
        <select id="time">
            <c:forEach var="showtime" items="${showtimes}">
                <option value="${showtime.time}">${showtime.time}</option>
            </c:forEach>
        </select>
        <select id="theater">
            <c:forEach var="showtime" items="${showtimes}">
                <option value="${showtime.theater}">${showtime.theater}</option>
            </c:forEach>
        </select>
        <button class="next-button" id="nextButton">Next</button>
    </div>

    <!-- Seat Map -->
    <div class="seat-map" id="seatMap">
        <h2>Select Your Seats</h2>

        <!-- Column Labels -->
        <div class="column-labels">
            <span class="row-label"></span>
            <c:forEach begin="1" end="10" var="col">
                <span class="column-label">${col}</span>
            </c:forEach>
        </div>

        <!-- Rows -->
        <c:forEach var="row" items="${['A', 'B', 'C', 'D', 'E']}">
            <div class="seat-row">
                <span class="row-label">${row}</span>
                <c:forEach begin="1" end="10" var="col">
                    <div class="seat ${row == 'A' && col == 2 || row == 'B' && col == 3 || row == 'C' && col == 4 ? 'sold' : ''}"
                         data-seat-number="${row}${col}"></div>
                </c:forEach>
            </div>
        </c:forEach>
    </div>

    <!-- Selected Info -->
    <div class="selected-info" id="selectedInfo">
        <h3>Your Selection</h3>
        <p>Selected Seats: <span id="selected-seats">None</span></p>
        <p>Total Price: Rs. <span id="total-price">0</span></p>
        <button class="purchase-button" type="submit" form="bookingForm">Purchase</button>
    </div>

    <!-- Form for Submission -->
    <form id="bookingForm" action="${pageContext.request.contextPath}/make-checkout" method="POST">
        <input type="hidden" name="action" value="make-checkout">
        <input type="hidden" name="movieName" value="${movie.title}">
        <input type="hidden" name="movieId" value="${movie.id}">
        <input type="hidden" name="showId" id="showIdField">
        <input type="hidden" name="showDate" id="showDateField">
        <input type="hidden" name="showTime" id="showTimeField">
        <input type="hidden" name="selectedSeats" id="selectedSeatsField">
        <input type="hidden" name="totalPrice" id="totalPriceField">
    </form>
</div>

<footer>
    <jsp:include page="/components/client-footer.jsp" />
</footer>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const nextButton = document.getElementById('nextButton');
        const seatMap = document.getElementById('seatMap');
        const selectedInfo = document.getElementById('selectedInfo');
        const seats = document.querySelectorAll('.seat:not(.sold)');
        const selectedSeatsElement = document.getElementById('selected-seats');
        const totalPriceElement = document.getElementById('total-price');
        const form = document.getElementById('bookingForm');

        const dateDropdown = document.getElementById('date');
        const timeDropdown = document.getElementById('time');
        const theaterDropdown = document.getElementById('theater');

        const showIdField = document.getElementById('showIdField');
        const showDateField = document.getElementById('showDateField');
        const showTimeField = document.getElementById('showTimeField');
        const selectedSeatsField = document.getElementById('selectedSeatsField');
        const totalPriceField = document.getElementById('totalPriceField');

        const pricePerSeat = ${movie.price}; // Price per seat
        let selectedSeats = new Set();

        // Show seat map and selected info on "Next" button click
        nextButton.addEventListener('click', () => {
            seatMap.style.display = 'flex';
            selectedInfo.style.display = 'block';

            showIdField.value = theaterDropdown.value;
            showDateField.value = dateDropdown.value;
            showTimeField.value = timeDropdown.value;

            window.scrollTo({ top: seatMap.offsetTop, behavior: 'smooth' });
        });

        // Handle seat selection
        seats.forEach(seat => {
            seat.addEventListener('click', () => {
                const seatNumber = seat.dataset.seatNumber;

                if (seat.classList.contains('selected')) {
                    seat.classList.remove('selected');
                    selectedSeats.delete(seatNumber);
                } else {
                    seat.classList.add('selected');
                    selectedSeats.add(seatNumber);
                }

                const selectedSeatsArray = Array.from(selectedSeats);
                selectedSeatsElement.textContent = selectedSeatsArray.join(', ') || 'None';
                totalPriceElement.textContent = selectedSeats.size * pricePerSeat;

                selectedSeatsField.value = selectedSeatsArray.join(',');
                totalPriceField.value = selectedSeats.size * pricePerSeat;
            });
        });
    });
</script>
</body>
</html>