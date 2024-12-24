<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #2e003e;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .contact-form {
            background-color: #3e005c;
            padding: 20px;
            border-radius: 8px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .contact-form h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .contact-form input,
        .contact-form textarea,
        .contact-form button {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
        }
        .contact-form input,
        .contact-form textarea {
            background-color: #fff;
            color: #333;
        }
        .contact-form button {
            background-color: #ffcc00;
            color: #3e003e;
            font-weight: bold;
            cursor: pointer;
        }
        .contact-form button:hover {
            background-color: #e6b800;
        }
    </style>
</head>
<body>
<div class="contact-form">
    <h1>Contact Us 📞</h1>
    <form action="/contact-submit" method="post" onsubmit="handleSubmit(event)">
        <input type="text" name="name" placeholder="Name" required minlength="3">
        <input type="email" name="email" placeholder="Email" required>
        <textarea name="message" placeholder="Message" required></textarea>
        <button type="submit">Submit</button>
    </form>
</div>

<script>
    function handleSubmit(event) {
        event.preventDefault(); // Prevent form submission
        alert('Thank you for contacting us!');
    }
</script>
</body>
</html>
