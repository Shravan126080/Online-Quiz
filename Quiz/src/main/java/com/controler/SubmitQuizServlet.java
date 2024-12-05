package com.controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DBConnection;

/**
 * Servlet implementation class SubmitQuizServlet
 */
@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitQuizServlet() {
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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        Integer quizId = (Integer) session.getAttribute("quizId");

        if (quizId == null) {
            out.println("<p>Error: No quiz selected. Please go back and choose a quiz.</p>");
            out.println("<a href='dashboard.jsp'>Back to Dashboard</a>");
            return;
        }

        Connection con = null;
        int score = 0;
        int totalQuestions = 0;

        try {
            con = DBConnection.getConnection();
            
            // Retrieve correct answers for the quiz
            String query = "SELECT id, correct_option FROM Questions WHERE quiz_id = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, quizId);
            ResultSet rs = stmt.executeQuery();
            
            Map<Integer, String> correctAnswers = new HashMap<>();
            while (rs.next()) {
                correctAnswers.put(rs.getInt("id"), rs.getString("correct_option"));
            }

            // Check user responses against correct answers
            for (Map.Entry<Integer, String> entry : correctAnswers.entrySet()) {
                int questionId = entry.getKey();
                String correctAnswer = entry.getValue();
                String userAnswer = request.getParameter("question" + questionId);
                
                if (userAnswer != null && userAnswer.equals(correctAnswer)) {
                    score++;
                }
                totalQuestions++;
            }

            // Display the result
            out.println("<h1>Quiz Results</h1>");
            out.println("<p>Quiz Title: " + session.getAttribute("quizTitle") + "</p>");
            out.println("<p>Your Score: " + score + " out of " + totalQuestions + "</p>");
            out.println("<a href='dashboard.jsp'>Back to Dashboard</a>");
            
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error processing the quiz. Please try again later.</p>");
            out.println("<a href='dashboard.jsp'>Back to Dashboard</a>");
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}