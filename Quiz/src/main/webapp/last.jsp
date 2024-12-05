<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Data Submission Successful</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa; /* Light Teal Background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 80%;
            max-width: 500px;
        }
        h1 {
            color: #d81b60; /* Vibrant Pink */
            font-size: 30px;
            margin-bottom: 20px;
        }
        .message {
            color: #555555; /* Dark Gray */
            font-size: 18px;
            margin-bottom: 30px;
        }
        .btn {
            background-color: #00897b; /* Teal Button */
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s ease, box-shadow 0.3s;
        }
        .btn:hover {
            background-color: #004d40; /* Darker Teal on Hover */
            transform: translateY(-4px);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1); /* Slight shadow for depth */
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Data Added Successfully</h1>
        <p class="message">Your data has been successfully added to the system. You can now return to the Admin Dashboard to continue managing your quizzes or other data.</p>
        <a href="adminDashboard.jsp" class="btn">Back to Dashboard</a>
    </div>

</body>
</html>
