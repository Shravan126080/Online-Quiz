<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Invalidate session
   HttpSession session2 = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            background: linear-gradient(to right, #a8ff78, #78ffd6); /* Mint gradient */
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 100vh;
            overflow: hidden;
        }
        .container {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px 30px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1.5s;
        }
        .message {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .emoji {
            font-size: 50px;
            margin-bottom: 20px;
        }
        .link {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 18px;
            text-decoration: none;
            color: #fff;
            background-color: #34d399; /* Fresh green */
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .link:hover {
            background-color: #22c55e; /* Darker green on hover */
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="emoji">👋</div>
        <div class="message">You have been successfully logged out.</div>
        <a href="login.jsp" class="link">Go to Login</a>
    </div>
</body>
</html>
