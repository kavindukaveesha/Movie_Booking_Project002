<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        body {
            background: linear-gradient(45deg, #1e0635, #2b0855);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        .contact-container {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background-color: rgba(45, 8, 95, 0.5);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
        }

        .contact-header {
            text-align: center;
            margin-bottom: 30px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .contact-header h2 {
            margin: 0;
            font-size: 24px;
        }

        .contact-header img {
            width: 20px;
            height: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 12px;
            background: white;
            border: none;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        textarea {
            height: 120px;
            resize: none;
        }

        button {
            width: 80%;
            background-color: #FFD700;
            color: #000;
            padding: 15px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: transform 0.2s;
        }

        button:hover {
            transform: scale(1.02);
            background-color: #FFE44D;
        }

        .error {
            color: #ff6b6b;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .success {
            color: #00ff88;
            font-size: 14px;
            text-align: center;
            margin-top: 15px;
            display: none;
        }
    </style>
</head>
<body>
<div class="contact-container">
    <div class="contact-header">
        <h2>Contact Us</h2>
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
        </svg>
    </div>
    <form id="contactForm" novalidate>
        <div class="form-group">
            <input type="text" id="name" name="name" placeholder="Name" required>
            <div class="error" id="nameError">Please enter your name</div>
        </div>

        <div class="form-group">
            <input type="email" id="email" name="email" placeholder="Email" required>
            <div class="error" id="emailError">Please enter a valid email address</div>
        </div>

        <div class="form-group">
            <textarea id="message" name="message" placeholder="Message" required></textarea>
            <div class="error" id="messageError">Please enter your message</div>
        </div>

        <button type="submit">Submit</button>
    </form>
    <div class="success" id="successMessage"></div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('contactForm');
        const successMessage = document.getElementById('successMessage');

        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId + 'Error');
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        }

        function clearErrors() {
            const errors = document.querySelectorAll('.error');
            errors.forEach(error => error.style.display = 'none');
        }

        function validateEmail(email) {
            return email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/);
        }

        form.addEventListener('submit', function(e) {
            e.preventDefault();
            clearErrors();

            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const message = document.getElementById('message').value.trim();

            let isValid = true;

            if (!name) {
                showError('name', 'Please enter your name');
                isValid = false;
            }

            if (!email) {
                showError('email', 'Please enter your email');
                isValid = false;
            } else if (!validateEmail(email)) {
                showError('email', 'Please enter a valid email address');
                isValid = false;
            }

            if (!message) {
                showError('message', 'Please enter your message');
                isValid = false;
            }

            if (isValid) {
                form.reset();
                successMessage.textContent = 'Thank you for your message!';
                successMessage.style.display = 'block';

                setTimeout(() => {
                    successMessage.style.display = 'none';
                }, 5000);
            }
        });

        const inputs = form.querySelectorAll('input, textarea');
        inputs.forEach(input => {
            input.addEventListener('input', function() {
                const errorElement = document.getElementById(this.id + 'Error');
                if (errorElement) {
                    errorElement.style.display = 'none';
                }
            });
        });
    });
</script>
</body>
</html>