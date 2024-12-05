<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body style="margin: 0; padding: 0; font-family: Arial, sans-serif; background-color: #e0f7fa;">

    <!-- Centered Login Form -->
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div style="background-color: #ffffff; padding: 40px 50px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); text-align: center; max-width: 400px; width: 100%;">
            <h2 style="color: #00796b; margin-bottom: 30px; font-size: 24px;">Login to Your Account</h2>
            <form action="LoginServlet" method="post">
                <!-- Username Input -->
                <div style="margin-bottom: 20px;">
                    <input type="text" name="username" placeholder="Username" required 
                           style="width: 100%; padding: 12px; border: 1px solid #b2dfdb; border-radius: 8px; font-size: 16px; box-sizing: border-box;">
                </div>
                <!-- Password Input -->
                <div style="margin-bottom: 20px;">
                    <input type="password" name="password" placeholder="Password" required 
                           style="width: 100%; padding: 12px; border: 1px solid #b2dfdb; border-radius: 8px; font-size: 16px; box-sizing: border-box;">
                </div>
                <!-- Login Button -->
                <div style="margin-bottom: 20px;">
                    <button type="submit" 
                            style="width: 100%; padding: 12px; background-color: #00796b; color: white; border: none; border-radius: 8px; font-size: 16px; cursor: pointer;">
                        Login
                    </button>
                </div>
                <!-- Additional Links -->
                <div style="color: #00796b; font-size: 14px;">
                    <a href="register.jsp" style="text-decoration: none; color: #004d40;">Create an Account</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
