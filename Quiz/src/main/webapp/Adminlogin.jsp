<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Gradient background */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Login Form Container */
        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        /* Input Fields */
        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .input-field:focus {
            border-color: #2575fc; /* Focus effect */
            outline: none;
        }

        /* Submit Button */
        .login-btn {
            background-color: #2575fc; /* Vibrant blue button */
            color: white;
            padding: 12px 20px;
            border-radius: 4px;
            width: 100%;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-btn:hover {
            background-color: #6a11cb; /* Darker blue on hover */
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }

        /* Responsive Design */
        @media (max-width: 500px) {
            .login-container {
                padding: 20px;
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <!-- Login Form -->
    <div class="login-container">
        <h2>Admin Login</h2>
        
        <!-- Form Tag with Action pointing to the Servlet -->
        <form action="adminLoginServlet" method="POST">
        
            <!-- Email Field -->
            <input type="email" id="email" class="input-field" placeholder="Email" name="email" required><br>
            
            <!-- Password Field -->
            <input type="password" id="password" class="input-field" placeholder="Password" name="password" required><br>
            
            <!-- Login Button -->
            <button type="submit" class="login-btn">Login</button>
        
        </form>
        
        <!-- Error Message -->
        <div class="error-message" id="error-message"></div>
    </div>

</body>
</html>
