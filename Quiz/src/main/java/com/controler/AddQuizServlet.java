package com.controler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBConnection;

/**
 * Servlet implementation class AddQuizServlet
 */
@WebServlet("/AddQuizServlet")
public class AddQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuizServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        try (Connection con = DBConnection.getConnection()) {
            String query = "INSERT INTO Quizzes (title) VALUES (?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, title);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                response.getWriter().println("<p>Quiz added successfully!</p>");
                response.sendRedirect("rap.jsp"); // Redirect back to admin dashboard

            } else {
                response.getWriter().println("<p>Error: Quiz could not be added.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
}


