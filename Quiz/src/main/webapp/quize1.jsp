<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Take the Quiz!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e6f7ff; /* Light blue background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .quiz-container {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 30px;
            width: 80%;
            max-width: 800px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #1e90ff; /* Vibrant blue color */
            text-align: center;
            margin-bottom: 20px;
        }

        .question {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #dbe9f4;
            border-radius: 8px;
            background-color: #f9fbfd;
        }

        .question p {
            font-size: 18px;
            margin: 0 0 10px;
        }

        .question input[type="radio"] {
            margin-right: 10px;
        }

        .question label {
            font-size: 16px;
        }

        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #1e90ff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #4682b4; /* Darker blue on hover */
        }

        .footer {
            text-align: center;
            margin-top: 20px;
        }

        .footer a {
            text-decoration: none;
            color: #1e90ff;
            font-size: 16px;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="quiz-container">
        <h1>Welcome to the Quiz!</h1>
        <h2>Quiz: <%= session.getAttribute("quizTitle") %></h2>

        <%
            // Get quizId from the session
            Integer quizId = (Integer) session.getAttribute("quizId");
            if (quizId == null) {
                out.println("<p>Error: No quiz selected. Please go back and choose a quiz.</p>");
        %>
                <a href="dashboard.jsp">Back to Dashboard</a>
        <%
                return;
            }

            Connection con = null;

            try {
                con = DBConnection.getConnection(); // Utility method to get DB connection
                String query = "SELECT id, question_text, option1, option2, option3, option4 " +
                               "FROM Questions WHERE quiz_id = ?";
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setInt(1, quizId);
                ResultSet rs = stmt.executeQuery();

                // Check if there are questions for this quiz
                if (!rs.isBeforeFirst()) {
                    out.println("<p>No questions available for this quiz. Please try another quiz.</p>");
        %>
        <%
                } else {
        %>
        <form action="SubmitQuizServlet" method="POST">
            <%
                int questionNumber = 1; // Counter for question numbers
                while (rs.next()) {
                    int questionId = rs.getInt("id");
            %>
            <div class="question">
                <p>Question <%= questionNumber++ %>: <%= rs.getString("question_text") %></p>
                <input type="radio" name="question<%= questionId %>" value="option1" required> <%= rs.getString("option1") %><br>
                <input type="radio" name="question<%= questionId %>" value="option2"> <%= rs.getString("option2") %><br>
                <input type="radio" name="question<%= questionId %>" value="option3"> <%= rs.getString("option3") %><br>
                <input type="radio" name="question<%= questionId %>" value="option4"> <%= rs.getString("option4") %><br>
            </div>
            <%
                }
            %>
            <button type="submit">Submit Quiz</button>
        </form>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error loading questions. Please try again later.</p>");
            } finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
        <div class="footer">
            <a href="dashboard.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>
