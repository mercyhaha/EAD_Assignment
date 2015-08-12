package Model;
import java.util.*;
import java.sql.*;

import Model.User;

public class UserDB {

	public Connection getConnDB() throws Exception{
		   Class.forName("com.mysql.jdbc.Driver");

		    
		   String connURL ="jdbc:mysql://localhost/finalsp_it?user=root&password=root"; 

		   
		   Connection conn =        DriverManager.getConnection(connURL);
		   return conn; 
		
	}
	public User verifyUser(String email,String password)
	{
		try{
		Connection conn= getConnDB();
		   String sql="Select * from user where email=? and password=?";
		   
		   
		   PreparedStatement pstmt = conn.prepareStatement(sql);	   
		   
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			
			ResultSet rs =pstmt.executeQuery();
			
			if(rs.next()){
				String nickname = rs.getString("nickname");
				String dob = rs.getString("dob");
				int contact = rs.getInt("contactno");
				String type = rs.getString("type");
				String mailingaddr = rs.getString("mailingaddr");
				User U = new User(nickname,email,contact,dob,mailingaddr,password,type);
				
				U.setContact(contact);
				U.setNickname(nickname);
				U.setPassword(password);
				U.setDob(dob);
				U.setMaillingaddress(mailingaddr);
				U.setType(type);
				U.setEmail(email);
				conn.close();
				
				return U;
			}else{return null;}
		}catch(Exception e){
			System.out.println(e);
			return null;}
		
		
	}
		
	public boolean insertUser(User usr){
		
		try{
			Connection conn= getConnDB();
			String sqlStr="insert into user(email,nickname,password,dob,contactno,mailingaddr,type) values(?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1 , usr.getEmail());
			pstmt.setString(2, usr.getNickname());
			pstmt.setString(3 , usr.getPassword());
			pstmt.setString(4, usr.getDob());
			pstmt.setInt(5, usr.getContact());
			pstmt.setString(6, usr.getMaillingaddress());
			pstmt.setString(7,usr.getType());
			int rec =pstmt.executeUpdate();
			
			conn.close();
			if(rec==0){
				return false;
				
			}else{
				return true;
				
			}
			
		}catch(Exception e){
			System.out.println(e);
			return false;
		}
		
		
	}
	
	
	public boolean updateUser(User usr){
		
		try{
			   Connection conn= getConnDB();
			   
			   String sqlStr="Update user set nickname=? ,password=?,dob=?,contactno=?,mailingaddr=?,type=?  where email =?";
			   
			   PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			   
			   
				pstmt.setString(1, usr.getNickname());
				pstmt.setString(2 , usr.getPassword());
				pstmt.setString(3, usr.getDob());
				pstmt.setInt(4, usr.getContact());
				pstmt.setString(5, usr.getMaillingaddress());
				pstmt.setString(6,usr.getType());
				pstmt.setString(7 , usr.getEmail());
			   
				
			   int recs=pstmt.executeUpdate();
			   
			  conn.close();
			   
			   return recs >0;
			   
			
		}catch(Exception e){
			System.out.println(e);
			return false;
			
			
			
		}
		
		
	}

	

	
}
