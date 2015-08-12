package Model;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

public class ProductsDB {
	
public Connection getConnDB() throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
	    
		String connURL ="jdbc:mysql://localhost/finalsp_it?user=root&password=root"; 
		   
		Connection conn = DriverManager.getConnection(connURL); 
		
		return conn;
	}
	



	public Products addToCart(int id){
		
		double unitprice = 0.0;
		int quantity1 = 1;
		
		try{
						
			Connection conn=getConnDB();
				
			String sql="Select * from it_product where productid=?";
			 
		    PreparedStatement pstmt=conn.prepareStatement(sql);
		    
		    pstmt.setInt(1, id);
		    
		    ResultSet rs=pstmt.executeQuery();
		 
		    double totalPrice = 0.0;
		    
		    while(rs.next()){
		    	
		    	int quantity=rs.getInt("quantity");
		    			    	
		    	if(quantity>0){
		    	
		    	int productid=rs.getInt("Productid");
				String brand=rs.getString("Brand");
				String model=rs.getString("model");
				String img=rs.getString("Img_Path");
				double price=(rs.getDouble("Price")*quantity1);	
				totalPrice=((rs.getDouble("Price")*quantity1)+totalPrice);
				
				 
	
				Products p1 = new Products(id, img, brand, model, quantity1 , price, totalPrice, 0);
				
				return p1;
				
		    	}
		    	
		    	else{		    		
		    				
		    	String brand=rs.getString("Brand");
				String model=rs.getString("model");
				String img=rs.getString("Img_Path");
		    		
				Products p1 = new Products(id, img, brand, model, 0 , 0, 0, 0);
				
				return p1;
				
		    	}
		    }
		    
		    	
		    conn.close();
	
			
		}catch(Exception e){
			
			System.out.print(e);
			
		}
	
		return null;	
	
	}

}
	

	


	

