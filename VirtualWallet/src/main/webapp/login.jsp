<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login to VirtualPay</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        :root {
            --primary-color: #5851DB;
            --secondary-color: #4834d4;
            --background-color: #F0F2F5;
            --text-color: #333;
            --input-bg: #FFFFFF;
            --input-border: #E4E7EB;
            --input-focus: #3498db;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
            height: 100%;
        }

        .header {
            background-color: var(--primary-color);
            padding: 15px 0;
            text-align: center;
        }

        .header a {
            display: inline-block;
        }

        .header img {
            height: 40px;
            width: auto;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 70px); /* Adjust for header height */
            padding: 20px;
        }

        .login-form {
            background-color: var(--input-bg);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        h2 {
            font-size: 28px;
            font-weight: 700;
            color: var(--primary-color);
        }

        .input-group {
            margin-bottom: 24px;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-color);
        }

        .input-group input {
            width: 100%;
            padding: 14px;
            border: 2px solid var(--input-border);
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .input-group input:focus {
            outline: none;
            border-color: var(--input-focus);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 24px;
        }

        .checkbox-group input {
            margin-right: 10px;
            width: 18px;
            height: 18px;
        }

        .submit-btn {
            width: 100%;
            padding: 14px;
            background-color: var(--primary-color);
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: var(--secondary-color);
        }

        .register-link {
            text-align: center;
            margin-top: 24px;
        }

        .register-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .register-link a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        .header {
            background-color: var(--primary-color);
            padding: 15px 20px;
            text-align: left;
        }

        .header a {
            text-decoration: none;
        }

        .header h2 {
            color: white;
            font-size: 24px;
            margin: 0;
        }
    </style>
</head>
<body>
<header class="header">
    <a href="index.jsp">
        <h2>VirtualPay</h2>
    </a>
</header>
<div class="container">
    <form class="login-form" action="login">
        <div class="form-header">
            <h2>Login to VirtualPay</h2>
        </div>
        <div class="input-group">
            <label for="usernameOrPhone">Username or Phone Number</label>
            <input id="usernameOrPhone" name="usernameOrPhone" type="text" autocomplete="usernameOrPhone" required placeholder="Enter username or phone number">
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input id="password" name="password" type="password" autocomplete="current-password" required placeholder="Enter your password">
        </div>
        <div class="checkbox-group">
            <input id="terms" name="terms" type="checkbox" required>
            <label for="terms">I agree to the Terms and Conditions</label>
        </div>
        <button type="submit" class="submit-btn">Login</button>
        <div class="register-link">
            <a href="register.jsp">Don't have an account? Register</a>
        </div>
    </form>
</div>
</body>
</html>