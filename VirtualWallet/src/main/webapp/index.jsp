<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VirtualPay - Your Smart Financial Companion</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        :root {
            --primary-color: #6366F1;
            --secondary-color: #4F46E5;
            --text-color: #1F2937;
            --bg-color: #F3F4F6;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            color: var(--primary-color);
        }

        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 60px 0;
        }

        .hero-content {
            flex: 1;
            padding-right: 40px;
        }

        h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 20px;
            color: var(--secondary-color);
        }

        .hero p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .cta-buttons {
            display: flex;
            gap: 20px;
        }

        .button {
            display: inline-block;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .button-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .button-primary:hover {
            background-color: var(--secondary-color);
        }

        .button-secondary {
            background-color: white;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
        }

        .button-secondary:hover {
            background-color: var(--primary-color);
            color: white;
        }

        .hero-image {
            flex: 1;
            text-align: center;
        }

        .hero-image img {
            max-width: 100%;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .features {
            background-color: white;
            padding: 60px 0;
            margin-top: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .features h2 {
            font-size: 36px;
            text-align: center;
            margin-bottom: 40px;
            color: var(--secondary-color);
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .feature-item {
            text-align: center;
            padding: 20px;
        }

        .feature-icon {
            font-size: 48px;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .feature-item h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        @media (max-width: 768px) {
            .hero {
                flex-direction: column;
                text-align: center;
            }

            .hero-content {
                padding-right: 0;
                margin-bottom: 40px;
            }

            .cta-buttons {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <div class="logo">VirtualPay</div>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h1>Your Smart Financial Companion</h1>
            <p>Experience seamless transactions, intelligent budgeting, and secure payments all in one place.</p>
            <div class="cta-buttons">
                <a href="login.jsp" class="button button-primary">Log In</a>
                <a href="register.jsp" class="button button-secondary">Sign Up</a>
            </div>
        </div>
        <div class="hero-image">
            <img src="https://cdn.pixabay.com/photo/2017/12/26/09/15/woman-3040029_1280.jpg" alt="Person using a smartphone">
        </div>
    </section>

    <section class="features">
        <h2>Why Choose VirtualPay?</h2>
        <div class="feature-grid">
            <div class="feature-item">
                <div class="feature-icon">💸</div>
                <h3>Instant Transfers</h3>
                <p>Send and receive money in seconds, anytime, anywhere.</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">📊</div>
                <h3>Smart Budgeting</h3>
                <p>Track expenses and set financial goals with ease.</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">🔒</div>
                <h3>Bank-Grade Security</h3>
                <p>Your money and data are protected with advanced encryption.</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">🌐</div>
                <h3>Global Payments</h3>
                <p>Make international transfers at competitive rates.</p>
            </div>
        </div>
    </section>
</div>
</body>
</html>