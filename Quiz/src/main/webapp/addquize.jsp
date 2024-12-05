<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        h1, h2 {
            text-align: center;
            color: #2c3e50;
            margin-top: 20px;
        }
        form {
            text-align: center;
            margin: 20px 0;
        }
        label {
            font-size: 16px;
            font-weight: bold;
        }
        input[type="text"] {
            padding: 8px;
            margin-left: 10px;
            font-size: 14px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 8px 15px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #219150;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #34495e;
            color: #ffffff;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tr:hover {
            background-color: #eaf2f8;
        }
        .actions button {
            margin: 5px 2px;
            padding: 6px 12px;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>

    <!-- Add Quiz Form -->
    <h2>Add New Quiz</h2>
    <form action="AddQuizServlet" method="post">
        <label for="title">Quiz Title:</label>
        <input type="text" id="title" name="title" required>
        <button type="submit">Add Quiz</button>
    </form>

    <!-- List Quizzes with Edit/Delete Options -->
    <h2>Existing Quizzes</h2>
    <table>
        <thead>
            <tr>
                <th>Quiz ID</th>
                <th>Quiz Title</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM quizzes");
            while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("title") %></td>
                <td class="actions">
                    
                    <form action="DeleteQuizServlet" method="post" style="display:inline;">
                        <input type="hidden" name="quizId" value="<%= rs.getInt("id") %>">
                        <button type="submit" style="background-color: #e74c3c;">Delete</button>
                    </form>
                    
                </td>
            </tr>                            
            
            <% } %>
        </tbody>
    </table>
    <footer>
        &copy; 2024 Quiz Management System. All rights reserved.
        <a href="adminDashboard.jsp" class="back-link">Back to Admin Home</a>
        
    </footer>
</body>
</html>
