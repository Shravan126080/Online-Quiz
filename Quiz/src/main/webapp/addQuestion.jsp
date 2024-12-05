<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Question to Quiz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #66b3b7, #ff6f61); /* Light Teal to Coral Gradient */
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 700px;
            margin: 80px auto;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-label {
            font-size: 18px;
            margin-bottom: 10px;
            color: #555;
        }

        .input-field, select, textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
        }

        textarea {
            height: 100px;
            resize: none;
        }

        .input-field:focus, select:focus, textarea:focus {
            border-color: #ff6f61; /* Coral border on focus */
            outline: none;
        }

        .submit-btn {
            background-color: #66b3b7; /* Light Teal button */
            color: white;
            padding: 14px 20px;
            border-radius: 6px;
            border: none;
            width: 100%;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #ff6f61; /* Coral on hover */
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
            color: #66b3b7;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Container for the form -->
    <div class="container">
        <div class="header">
            <h2>Add Question to Quiz</h2>
        </div>

        <!-- Form to add a question -->
        <form action="AddQuestionServlet" method="POST">
            <label for="quizId" class="form-label">Select Quiz:</label><br>
            <select id="quizId" name="quizId" required class="input-field">
                <% 
                    // Fetch list of quizzes from the database
                    Connection con = null;
                    try {
                        con = DBConnection.getConnection(); // DBConnection is a utility class to get the database connection
                        String query = "SELECT id, title FROM Quizzes";
                        PreparedStatement stmt = con.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();
                        
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt("id") %>"><%= rs.getString("title") %></option>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (con != null) con.close();
                    }
                %>
            </select><br><br>

            <label for="questionText" class="form-label">Question:</label><br>
            <textarea id="questionText" name="questionText" required class="input-field"></textarea><br><br>

            <label for="option1" class="form-label">Option 1:</label><br>
            <input type="text" id="option1" name="option1" class="input-field" required><br><br>

            <label for="option2" class="form-label">Option 2:</label><br>
            <input type="text" id="option2" name="option2" class="input-field" required><br><br>

            <label for="option3" class="form-label">Option 3:</label><br>
            <input type="text" id="option3" name="option3" class="input-field" required><br><br>

            <label for="option4" class="form-label">Option 4:</label><br>
            <input type="text" id="option4" name="option4" class="input-field" required><br><br>

            <label for="correctOption" class="form-label">Correct Option:</label><br>
            <select id="correctOption" name="correctOption" required class="input-field">
                <option value="option1">Option 1</option>
                <option value="option2">Option 2</option>
                <option value="option3">Option 3</option>
                <option value="option4">Option 4</option>
            </select><br><br>

            <button type="submit" class="submit-btn">Add Question</button>
        </form>

        <!-- Back to Dashboard Link -->
        <a href="adminDashboard.jsp" class="back-link">Back to Admin Home</a>
    </div>

</body>
</html>
