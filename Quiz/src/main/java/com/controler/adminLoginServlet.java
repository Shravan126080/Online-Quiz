package com.controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminLoginServlet
 */
@WebServlet("/adminLoginServlet")
public class adminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLoginServlet() {
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Initialize a PrintWriter object to send the response
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // For this demo, let's assume the valid credentials are:
        String validEmail = "admin@example.com";
        String validPassword = "123";

        // Check if the email and password are correct
        if (email.equals(validEmail) && password.equals(validPassword)) {
            // Redirect to the admin dashboard page
            response.sendRedirect("adminDashboard.jsp");
        } else {
            // If login fails, show an error message
            out.println("<html><body><h3 style='color:red;'>Invalid email or password. Please try again.</h3></body></html>");
        }
    }
}	
