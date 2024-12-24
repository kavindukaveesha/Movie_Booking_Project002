<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Feedback Success</title>
    <link href="styles.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <nav>
        <jsp:include page="/components/client-navbar.jsp" />
    </nav>

    <div class="feedback-success">
        <h1>Feedback Submitted Successfully!</h1>
        <p>Your overall average rating is: ${overallAverage}</p>
<%--        <p><%= session.getAttribute("message") != null ? session.getAttribute("message") : "" %></p>--%>
        <a href="home.jsp" class="btn">Go to Home</a>
    </div>

    <footer>
        <jsp:include page="/components/client-footer.jsp" />
    </footer>
</div>
</body>
</html>
