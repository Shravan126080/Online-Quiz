<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #eaf7f9; /* Light teal background */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header */
        .header {
            background-color: #00a896; /* Teal green header */
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        /* Logout Button on the Right */
        .logout-btn {
            background-color: #f94144; /* Vibrant red */
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            border: none;
            font-size: 16px;
        }

        .logout-btn:hover {
            background-color: #f3722c; /* Lighter red on hover */
        }

        /* Main content area */
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1; /* Pushes footer to the bottom */
            padding: 20px;
        }

        /* Buttons Container (Horizontally Aligned) */
        .button-container {
            display: flex;
            gap: 20px; /* Space between buttons */
        }

        .dashboard-button {
            background-color: #028090; /* Rich teal */
            color: white;
            padding: 15px 30px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s ease;
            width: 200px;
            text-decoration: none;
        }

        .dashboard-button:hover {
            background-color: #00a896; /* Brighter teal on hover */
        }

        /* Footer */
        .footer {
            background-color: #00a896; /* Matches header color */
            color: white;
            text-align: center;
            padding: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <h1>Education is the most powerful weapon which you can use to change the world.  
        </h1>
        <a href="logout.jsp" class="logout-btn">Logout</a>
        
    </div>

    <!-- Main Content Area -->
    <div class="content">
        <div class="button-container">
            <a href="Tasklist.jsp" class="dashboard-button">Take a Quiz</a>
            <a href="leaderboard.jsp" class="dashboard-button">Leaderboard</a>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        &copy; 2024 <a href="Adminlogin.jsp">Admin</a> | All rights reserved.
    </div>

</body>
</html>
