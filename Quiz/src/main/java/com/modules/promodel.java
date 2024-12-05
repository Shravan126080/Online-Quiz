package com.modules;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.quesionentitty;
import com.entity.quizentity;

public class promodel {
	private static final String Quantity = null;
	Connection con;
	public promodel(Connection con) {
		super();
		this.con=con;}

		public List<quesionentitty> fetchquestion(int id) throws SQLException{
			List<quesionentitty> pl= new ArrayList<quesionentitty>();
			quesionentitty r=null;
			String sql="select * from questions where quiz_id=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				r= new quesionentitty();
				r.setId(rs.getInt(1));
                r.setQuiz_id(rs.getInt(2));
				r.setQuestion_text(rs.getString(3));
				r.setOption1(rs.getString(4));
				r.setOption2(rs.getString(5));
				r.setOption3(rs.getString(6));
				r.setOption4(rs.getString(7));

				
				
				pl.add(r);
			}
			
			
			return pl;
		}
		
	//quzientity
			public List<quizentity> quize1() throws SQLException{
				List<quizentity> pl1= new ArrayList<quizentity>();
				quizentity a=null;
				String sql="select * from quizzes";
				PreparedStatement ps= con.prepareStatement(sql);
				ResultSet rs= ps.executeQuery();
				while(rs.next()) {
					a= new quizentity();
					a.setId(rs.getInt(1));
					a.setTittle(rs.getString(2));
					
					
					pl1.add(a);
				}
				
				
				return pl1;
		
		


		}public quesionentitty check2(int id ) throws SQLException {
			quesionentitty h=null;
			String sql="select * from questions where quiz_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				h=new quesionentitty();
				h.setId(rs.getInt(1));
				h.setQuiz_id(rs.getInt(2));
				h.setQuestion_text(rs.getString(3));
				h.setOption1(rs.getString(4));
				h.setOption2(rs.getString(5));
				h.setOption3(rs.getString(6));
				h.setOption4(rs.getString(7));
				
				
			}
			return h;
		}


			}
