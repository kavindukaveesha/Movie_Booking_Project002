<style>
    footer {
        background-color: rgba(14, 1, 97, 0.65);
        color: #FFFFFF;

    }
    .footer-content {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        padding: 30px;
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
    .social-icons-container {
        display: flex;
    }
    .social-icons a {
        color: #FFFFFF;
        margin-right: 15px;
        font-size: 20px;
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
    .social-icons-container {
        display: flex;
    }
    .social-icons a {
        color: #FFFFFF;
        margin-right: 15px;
        font-size: 20px;
    }

    hr {
        border: 0;
        height: 1px;
        background-color: rgba(255, 255, 255, 0.2);
        margin: 30px 0;
    }
    .copyright{
        text-align: center;
        padding: 20px 10px;
    }
</style>
<footer>
    <div class="footer-content">
        <div class="footer-logo">
            <img src="https://i.ibb.co/XDWNCbt/image.png" alt="ABC Cinema logo"/>
            <span>ABC</span> CINEMA
        </div>
        <div class="footer-links">
            <a href="<c:url value='/about-us'/>">About us</a>
            <a href="<c:url value='/contact-us'/>">Contact us</a>
            <a href="<c:url value='/privacy-policy'/>">Privacy Policy</a>
        </div>
        <div class="social-icons">
            <span>Follow us:</span>
            <div class="social-icons-container">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
    <hr>
    <div class="copyright">
        © 2024 ABC Cinema. All rights reserved.
    </div>
</footer>
