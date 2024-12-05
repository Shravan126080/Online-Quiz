<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Results</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f9f1f9; /* Light pastel lavender background */
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 950px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #6c4fef; /* Muted lavender for title */
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 18px;
            text-align: center;
            border: 1px solid #e0c9e8; /* Light lavender border */
        }

        th {
            background-color: #6c4fef; /* Muted lavender */
            color: white;
            font-size: 18px;
        }

        td {
            background-color: #f7f0f8; /* Very light pinkish lavender for data rows */
            font-size: 16px;
        }

        tr:nth-child(even) td {
            background-color: #fdf1f7; /* Slightly lighter lavender for alternating rows */
        }

        tr:hover td {
            background-color: #f0d3f7; /* Light pinkish effect on row hover */
        }

        a {
            display: block;
            text-align: center;
            margin-top: 25px;
            font-size: 16px;
            color: #6c4fef; /* Muted lavender for links */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
            color: #9b69df; /* Darker lavender on hover */
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>User Results</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection con = DBConnection.getConnection();
                        String query = "SELECT u.username, r.score FROM users u INNER JOIN results r ON u.id = r.user_id";
                        PreparedStatement stmt = con.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getInt("score") %></td>
                </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>

</body>
</html>
