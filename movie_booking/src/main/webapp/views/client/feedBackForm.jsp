<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #1e0b47;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .feedback-form {
            background: #2d135e;
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 600px;
        }

        .header-inputs {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .input-group {
            position: relative;
        }

        .input-group input {
            width: 100%;
            padding: 10px 0;
            background: transparent;
            border: none;
            border-bottom: 1px solid #fff;
            color: #fff;
            outline: none;
        }

        .input-group label {
            position: absolute;
            left: 0;
            top: -20px;
            color: #fff;
            font-size: 14px;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 24px;
        }

        .question-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            cursor: pointer;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.2s;
        }

        .question-group:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .question {
            flex: 1;
            padding-right: 20px;
        }

        .rating {
            display: flex;
            gap: 15px;
        }

        .rating input[type="checkbox"] {
            appearance: none;
            width: 20px;
            height: 20px;
            border: 2px solid #fff;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.2s;
        }

        .rating input[type="checkbox"]:checked {
            background: #ffd700;
            border-color: #ffd700;
        }

        .rating input[type="checkbox"]:hover {
            transform: scale(1.1);
        }

        textarea {
            width: 100%;
            height: 100px;
            margin: 20px 0;
            padding: 15px;
            border-radius: 10px;
            border: none;
            resize: none;
            background: rgba(255, 255, 255, 0.9);
        }

        button {
            width: 200px;
            padding: 12px;
            border: none;
            border-radius: 25px;
            background: #ffd700;
            color: #1e0b47;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            display: block;
            margin: 20px auto 0;
        }

        button:hover {
            background: #f0c700;
        }

        .rating-label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-size: 12px;
            color: rgba(255, 255, 255, 0.7);
            width: 100%;
            padding: 0 10px;
        }
    </style>
</head>
<body>
<form class="feedback-form" action="SubmitFeedbackServlet" method="post">
    <div class="header-inputs">
        <div class="input-group">
            <label>Name</label>
            <input type="text" name="name" required>
        </div>
        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>
    </div>

    <h2>Send us your Feedback!</h2>

<%--    <div class="rating-label">--%>
<%--        <span>Poor</span>--%>
<%--        <span>Excellent</span>--%>
<%--    </div>--%>

    <div class="question-group">
        <div class="question">How would you rate your overall experience?</div>
        <div class="rating">
            <input type="checkbox" name="experience[]" value="1">
            <input type="checkbox" name="experience[]" value="2">
            <input type="checkbox" name="experience[]" value="3">
            <input type="checkbox" name="experience[]" value="4">
            <input type="checkbox" name="experience[]" value="5">
        </div>
    </div>

    <div class="question-group">
        <div class="question">Was the online ticket reservation process easy to use?</div>
        <div class="rating">
            <input type="checkbox" name="ticketEase[]" value="1">
            <input type="checkbox" name="ticketEase[]" value="2">
            <input type="checkbox" name="ticketEase[]" value="3">
            <input type="checkbox" name="ticketEase[]" value="4">
            <input type="checkbox" name="ticketEase[]" value="5">
        </div>
    </div>

    <div class="question-group">
        <div class="question">Did you encounter any issues with online payments?</div>
        <div class="rating">
            <input type="checkbox" name="payments[]" value="1">
            <input type="checkbox" name="payments[]" value="2">
            <input type="checkbox" name="payments[]" value="3">
            <input type="checkbox" name="payments[]" value="4">
            <input type="checkbox" name="payments[]" value="5">
        </div>
    </div>

    <div class="question-group">
        <div class="question">How satisfied were you with the cleanliness of the cinema?</div>
        <div class="rating">
            <input type="checkbox" name="cleanliness[]" value="1">
            <input type="checkbox" name="cleanliness[]" value="2">
            <input type="checkbox" name="cleanliness[]" value="3">
            <input type="checkbox" name="cleanliness[]" value="4">
            <input type="checkbox" name="cleanliness[]" value="5">
        </div>
    </div>

    <div class="question-group">
        <div class="question">How would you rate the sound and picture quality?</div>
        <div class="rating">
            <input type="checkbox" name="quality[]" value="1">
            <input type="checkbox" name="quality[]" value="2">
            <input type="checkbox" name="quality[]" value="3">
            <input type="checkbox" name="quality[]" value="4">
            <input type="checkbox" name="quality[]" value="5">
        </div>
    </div>

    <div class="question-group">
        <div class="question">How was your experience with the staff?</div>
        <div class="rating">
            <input type="checkbox" name="staff[]" value="1">
            <input type="checkbox" name="staff[]" value="2">
            <input type="checkbox" name="staff[]" value="3">
            <input type="checkbox" name="staff[]" value="4">
            <input type="checkbox" name="staff[]" value="5">
        </div>
    </div>

    <textarea name="suggestions" placeholder="Do you have any suggestions for us to improve your experience?" required></textarea>
    <button type="submit">Submit</button>
</form>
</body>
</html>