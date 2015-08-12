package Model;

import java.sql.Connection;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.http.HttpSession;

public class checkoutDB {

	
public Connection getConnDB() throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
	    
		String connURL ="jdbc:mysql://localhost/finalsp_it?user=root&password=root"; 
		   
		Connection conn = DriverManager.getConnection(connURL); 
		
		return conn;
	}

public ArrayList<checkout1> sales(int month,int year){
	
	try{
	   Connection conn= getConnDB();
	   
	   String sqlStr="Select transactiondetails.productid, model,transactiondetails.quantity  FROM transaction,transactiondetails,it_product where transaction.transactionid=transactiondetails.transactionid and transactiondetails.productid=it_product.ProductID and MONTH(dateofpurchase)=? and YEAR(dateofpurchase)=?  order by transactiondetails.quantity DESC LIMIT 10 ";
	   
	   PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	   System.out.println("sql");
	   pstmt.setInt(1,month);
	   pstmt.setInt(2,year);
	   
	   
	   ResultSet rs = pstmt.executeQuery();
	   
	   ArrayList<checkout1> al = new ArrayList<checkout1>();
			   
	   while(rs.next()){
		   
			int q = rs.getInt("transactiondetails.productid");
			String e=rs.getString("model");
			int r=rs.getInt("transactiondetails.quantity");
			
			System.out.println(q+e+r);
			checkout1 co =new checkout1(q,e,r);
		   
			al.add(co);
	   }
	   
	   return al;
	   
	}catch(Exception E){
		System.out.println(E);
		return null;
	}
	
		
	
	
}
	
	
public int updateTransaction(String cardtype, double totalamount, int creditcardno){
	
	try{
		
		//HttpSession session = session.getSessionContext();
		Connection conn=getConnDB();
		
		String sql="Insert into transaction(transactionid, dateofpurchase, email, cardtype,creditcardno, totalamount) values(0,NOW(),?,?,?,?)";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, "email");
		pstmt.setString(2, cardtype);
		pstmt.setInt(3, creditcardno);
		pstmt.setDouble(4, totalamount);
		
		int recs=pstmt.executeUpdate();
		
		if(recs==1){
			
			String sql2="Select * from transaction where email=?";
			PreparedStatement pstmt2=conn.prepareStatement(sql2);
			pstmt2.setString(1, "email");
			ResultSet rs = pstmt2.executeQuery();
			int transactionid = 0;
			
			if (rs.last()){
				transactionid = rs.getInt("transactionid"); 
			}
			
			return transactionid;
		}
		else{
			System.out.println("Error");
			return 0;
		}
		
	}catch(Exception e){
		
		System.out.println(e);
		return 0;
		
	}
		
}
public int updateTransactionDetails(ArrayList<Products> productList, int transactionid){
	
	try{
		
		Connection conn=getConnDB();
		
		for(Products p : productList){
			
			String sql = "Insert into transactiondetails(transactionid, productid, quantity) values(?, ?, ?)";
			
			PreparedStatement pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, transactionid);
			pstmt.setInt(2, p.getProductid());
			pstmt.setInt(3, p.getQuantity());
			
			int recs=pstmt.executeUpdate();
			
		}
		
	}catch(Exception e){
		System.out.println(e);
	}
	return transactionid;
	
}
	
	
}
