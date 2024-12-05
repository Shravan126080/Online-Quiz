package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection con;
	public static Connection getConnection()
	
	{
		{
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/OnlineQuizDB","root","123456");
				
				
			} catch (Exception e) {

			System.out.println("Exception"+e.getMessage());
			}
		}
		return con;
		
	}

}