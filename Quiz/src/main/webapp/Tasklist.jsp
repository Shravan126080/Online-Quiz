<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Quizzes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-top: 20px;
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
            background-color: #f2f2f2;
        }
        table tr:hover {
            background-color: #eaf2f8;
        }
        button {
            background-color: #3498db;
            color: #ffffff;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #2980b9;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #7f8c8d;
        }
        
    </style>
</head>
<body>
        <h1>Available Quizzes </h1> 
        
    <%
        Connection con = null;
        try {
            con = DBConnection.getConnection(); // DBConnection is a utility class to get the database connection
            String query = "SELECT * FROM Quizzes";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
    %>
    <table border="1">
        <tr>
            <th>Quiz Title</th>
            <th>Action</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("title") %></td>
            <td>
                <form action="Taskservlet1" method="POST">
                    <input type="hidden" name="quizId" value="<%= rs.getInt("id") %>">
                    <button type="submit">Start Quiz</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        
    </table>
    
    <%
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error fetching quiz list. Please try again later.</p>");
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
    <div class="footer" >
            <a href="dashboard.jsp">Back to Home</a>
        </div>
</body>
</html>
