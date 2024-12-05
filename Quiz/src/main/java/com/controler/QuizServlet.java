package com.controler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DBConnection;

/**
 * Servlet implementation class QuizServlet
 */
@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizServlet() {
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
        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");
        
        int score = 0;
        try (Connection con = DBConnection.getConnection()) {
            String[] questionIds = request.getParameterValues("questionId");
            
            for (String questionId : questionIds) {
                String userAnswer = request.getParameter("correct_option" + questionId);
                
                String query = "SELECT correct_option FROM questions WHERE id = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(questionId));
                ResultSet rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    String correctAnswer = rs.getString("correct_option");
                    if (correctAnswer.equals(userAnswer)) {
                        score++;
                    }
                }
            }
            
            String query = "INSERT INTO results (user_id,score) VALUES ((SELECT id FROM users WHERE username = ?), ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setInt(2, score);
            pstmt.executeUpdate();
            
            session.setAttribute("score", score);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

