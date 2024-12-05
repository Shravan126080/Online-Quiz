<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2; /* Light gray background */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-container {
            background-color: #ffffff; /* White background for form */
            width: 400px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .register-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .register-container input {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .register-container input:focus {
            border-color: #4CAF50;
            outline: none;
        }

        .register-container button {
            width: 100%;
            padding: 15px;
            background-color: #4CAF50; /* Green color */
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .register-container button:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        .register-container .redirect-link {
            margin-top: 10px;
            font-size: 14px;
        }

        .register-container .redirect-link a {
            color: #4CAF50;
            text-decoration: none;
        }

        .register-container .redirect-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Create an Account</h2>
        <form action="RegisterServlet" method="post">
            <!-- Username Field -->
            <input type="text" name="username" placeholder="Enter Username" required>

            <!-- Password Field -->
            <input type="password" name="password" placeholder="Enter Password" required>

            <!-- Confirm Password Field -->
            <input type="password" name="confirmPassword" placeholder="Confirm Password" required>

            <!-- Register Button -->
            <button type="submit">Register</button>
        </form>

        <!-- Redirect to Login Page -->
        <div class="redirect-link">
            Already have an account? <a href="login.jsp">Login here</a>.
        </div>
    </div>
</body>
</html>
