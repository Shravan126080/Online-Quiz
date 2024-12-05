 package com.controler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DBConnection;
import com.entity.quesionentitty;
import com.modules.promodel;

/**
 * Servlet implementation class Taskservlet1
 */
@WebServlet("/Taskservlet1")
public class Taskservlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Taskservlet1() {
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
        int quizId = Integer.parseInt(request.getParameter("quizId"));

        try (Connection con = DBConnection.getConnection()) {
            // Check if the quiz exists
            String query = "SELECT title FROM Quizzes WHERE id = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, quizId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("quizId", quizId);
                session.setAttribute("quizTitle", rs.getString("title"));
                response.sendRedirect("quize1.jsp");
            } else {
                response.getWriter().println("<p>Quiz not found.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error loading quiz. Please try again.</p>");
        }
    }
}
