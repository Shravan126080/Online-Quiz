<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #2575fc;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .content {
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        .menu {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 20px;
            width: 80%;
        }

        .menu-item {
            background-color: #fff;
            padding: 30px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .menu-item:hover {
            transform: scale(1.05);
        }

        .menu-item h3 {
            margin-bottom: 10px;
        }

        .footer {
            background-color: #2575fc;
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        .footer a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Welcome  Admin </h1>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="menu">
            <!-- Take a Quiz -->
            <div class="menu-item" onclick="location.href='addquize.jsp'">
                <h3>Take a Quiz</h3>
                <p>View and participate in quiz sessions.</p>
            </div>

            <!-- Add Question -->
            <div class="menu-item" onclick="location.href='addQuestion.jsp'">
                <h3>Add Question</h3>
                <p>Manage quiz questions by adding new ones.</p>
            </div>

            <!-- Leaderboard -->
            <div class="menu-item" onclick="location.href='leaderboard.jsp'">
                <h3>Leaderboard</h3>
                <p>See the top scorers on the quiz leaderboard.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Admin Dashboard. <a href="logout.jsp">Logout</a></p>

    </div>

</body>
</html>
