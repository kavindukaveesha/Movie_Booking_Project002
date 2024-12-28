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


        .booking-container {
            display: flex;
            gap: 2rem;
            padding: 1.5rem;
        }

        .seat-summary {
            width: 25%;
            background-color: #2D1B69;
            border-radius: 0.5rem;
            padding: 1.5rem;
            color: white;
        }

        .seat-summary h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .selected-seats-list {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .selected-seat-tag {
            background-color: #3D2B79;
            padding: 0.25rem 0.75rem;
            border-radius: 0.25rem;
        }

        .price-breakdown {
            margin-bottom: 1.5rem;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }

        .total-row {
            border-top: 1px solid rgba(255,255,255,0.2);
            padding-top: 0.5rem;
            margin-top: 1rem;
        }

        .purchase-button {
            width: 100%;
            background-color: #FFD700;
            color: black;
            padding: 0.75rem;
            border-radius: 0.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
            border: none;
            cursor: pointer;
        }

        .add-foods-button {
            width: 100%;
            background-color: #3D2B79;
            color: white;
            padding: 0.75rem;
            border-radius: 0.25rem;
            border: 1px solid #4D3B89;
            cursor: pointer;
        }

        .seat-map-container {
            flex: 1;
            background-color: rgba(45,27,105,0.5);
            border-radius: 0.5rem;
            padding: 2rem;
        }

        .seat-legend {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: white;
        }

        .seat-demo {
            width: 1rem;
            height: 1rem;
            border-radius: 0.25rem;
        }

        .screen-line {
            background-color: #FFD700;
            height: 0.25rem;
            width: 100%;
            margin-bottom: 3rem;
            border-radius: 0.25rem;
        }

        .seats-grid {
            display: grid;
            gap: 1rem;
        }

        .seat-row {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .row-label {
            color: white;
            width: 1.5rem;
        }

        .seats {
            display: flex;
            gap: 0.5rem;
        }

        .seat {
            width: 2rem;
            height: 2rem;
            border-radius: 0.25rem;
            border: none;
            cursor: pointer;
        }

        .seat.normal { background-color: #BAE6FD; }
        .seat.deluxe { background-color: #FED7AA; }
        .seat.super { background-color: #FBCFE8; }
        .seat.sold {
            background-color: #EF4444;
            cursor: not-allowed;
        }
        .seat.selected { background-color: #FFD700; }

    </style>
</head>
<body>
<nav>
    <jsp:include page="/components/client-navbar.jsp" />
</nav>
<div class="container">



    <!-- Movie Info -->
    <div class="movie-info">
        <img src="${pageContext.request.contextPath}/DBImages/${movie.imageUrl}" alt="${movie.title}">
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
    <!-- Replace the existing seat-map div with this code -->
    <div class="booking-container">
        <div class="seat-summary">
            <h2>Your selected seats</h2>
            <p class="seat-count">0 seats</p>
            <div class="selected-seats-list"></div>

            <div class="price-breakdown">
                <div class="price-row normal-row">
                    <span>Normal</span>
                    <span class="count">-</span>
                    <span class="price">-</span>
                </div>
                <div class="price-row deluxe-row">
                    <span>Deluxe</span>
                    <span class="count">-</span>
                    <span class="price">-</span>
                </div>
                <div class="price-row super-row">
                    <span>Super</span>
                    <span class="count">-</span>
                    <span class="price">-</span>
                </div>
                <div class="price-row total-row">
                    <span>Total</span>
                    <span class="total-price">Rs.0</span>
                </div>
            </div>

            <button class="purchase-button" type="submit" form="bookingForm">Purchase</button>
            <button class="add-foods-button">+ Add Foods</button>
        </div>

        <div class="seat-map-container">
            <div class="seat-legend">
                <div class="legend-item">
                    <span class="seat-demo normal"></span>
                    <span>Normal</span>
                </div>
                <div class="legend-item">
                    <span class="seat-demo deluxe"></span>
                    <span>Deluxe</span>
                </div>
                <div class="legend-item">
                    <span class="seat-demo super"></span>
                    <span>Super</span>
                </div>
                <div class="legend-item">
                    <span class="seat-demo sold"></span>
                    <span>Sold</span>
                </div>
            </div>

            <div class="screen-line"></div>

            <div class="seats-grid">
                <!-- Seats will be generated by JavaScript -->
            </div>
        </div>
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
        const seatsGrid = document.querySelector('.seats-grid');
        const selectedSeatsList = document.querySelector('.selected-seats-list');
        const seatCount = document.querySelector('.seat-count');
        const normalRow = document.querySelector('.normal-row');
        const deluxeRow = document.querySelector('.deluxe-row');
        const superRow = document.querySelector('.super-row');
        const totalPrice = document.querySelector('.total-price');
        const seatMap = document.querySelector('.booking-container');
        const nextButton = document.querySelector('.next-button');



        seatMap.style.display = 'none';

        // Show seats when Next is clicked
        nextButton.addEventListener('click', () => {
            seatMap.style.display = 'flex';

            // Scroll to seat map
            seatMap.scrollIntoView({ behavior: 'smooth' });

            // Update form fields with selected date/time/theater
            const dateField = document.getElementById('showDateField');
            const timeField = document.getElementById('showTimeField');
            const theaterField = document.getElementById('showIdField');

            dateField.value = document.getElementById('date').value;
            timeField.value = document.getElementById('time').value;
            theaterField.value = document.getElementById('theater').value;
        });

        const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
        const seatsPerRow = 12;
        const selectedSeats = new Set();

        const prices = {
            normal: 100,
            deluxe: 150,
            super: 200
        };




        function getSeatCategory(row) {
            if (row === 'A' || row === 'B') return 'normal';
            if (row === 'C' || row === 'D' || row === 'E') return 'deluxe';
            return 'super';
        }

        // Generate seats
        rows.forEach(row => {
            const rowDiv = document.createElement('div');
            rowDiv.className = 'seat-row';

            const label = document.createElement('span');
            label.className = 'row-label';
            label.textContent = row;
            rowDiv.appendChild(label);

            const seatsDiv = document.createElement('div');
            seatsDiv.className = 'seats';

            for (let i = 1; i <= seatsPerRow; i++) {
                const seatId = `${row}${i}`;
                const seat = document.createElement('button');
                seat.className = `seat ${getSeatCategory(row)}`;

                // Mark sold seats
                if ((row === 'A' && i === 2) ||
                    (row === 'B' && i === 3) ||
                    (row === 'C' && i === 4)) {
                    seat.className = 'seat sold';
                    seat.disabled = true;
                }

                seat.dataset.seatId = seatId;
                seatsDiv.appendChild(seat);
            }

            rowDiv.appendChild(seatsDiv);
            seatsGrid.appendChild(rowDiv);
        });

        // Handle seat selection
        seatsGrid.addEventListener('click', (e) => {
            if (!e.target.classList.contains('seat') || e.target.classList.contains('sold')) return;

            const seatId = e.target.dataset.seatId;
            e.target.classList.toggle('selected');

            if (selectedSeats.has(seatId)) {
                selectedSeats.delete(seatId);
            } else {
                selectedSeats.add(seatId);
            }

            updateSummary();
        });

        function updateSummary() {
            // Update seat count
            seatCount.textContent = `${selectedSeats.size} seats`;

            // Update selected seats list
            selectedSeatsList.innerHTML = Array.from(selectedSeats)
                .map(seat => `<span class="selected-seat-tag">${seat}</span>`)
                .join('');

            // Calculate prices by category
            const counts = { normal: 0, deluxe: 0, super: 0 };
            selectedSeats.forEach(seatId => {
                const category = getSeatCategory(seatId[0]);
                counts[category]++;
            });

            // Update price breakdown
            function updateCategoryRow(row, count, category) {
                if (count > 0) {
                    row.querySelector('.count').textContent = count;
                    row.querySelector('.price').textContent = `Rs.${count * prices[category]}`;
                    row.style.display = 'flex';
                } else {
                    row.style.display = 'none';
                }
            }

            updateCategoryRow(normalRow, counts.normal, 'normal');
            updateCategoryRow(deluxeRow, counts.deluxe, 'deluxe');
            updateCategoryRow(superRow, counts.super, 'super');

            // Update total
            const total = Object.entries(counts)
                .reduce((sum, [category, count]) => sum + count * prices[category], 0);
            totalPrice.textContent = `Rs.${total}`;

            // Update form fields
            document.getElementById('selectedSeatsField').value = Array.from(selectedSeats).join(',');
            document.getElementById('totalPriceField').value = total;
        }
    });
</script>
</body>
</html>