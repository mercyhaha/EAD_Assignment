package Controller;

import java.io.IOException;




import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import Model.*;

import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class InsertProduct
 */
@WebServlet("/ObtainProductServlet")
public class ObtainProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ObtainProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(); //get the session
		//HttpSession session2 = request.getSession();
		
		int productid=Integer.parseInt(request.getParameter("productid"));
		//int quantity=Integer.parseInt(request.getParameter("quantity"));
		
		ProductsDB product1=new ProductsDB();
		Products item = product1.addToCart(productid);
		
		ArrayList<Products> productList = new ArrayList<Products>();
		
		
		if(session.getAttribute("productCart")!=null){
			productList=(ArrayList<Products>) session.getAttribute("productCart");
			
		}
		
		boolean match=false;	
		
		for(Products p : productList){
						
			if(productid == p.getProductid()){
				p.setQuantity(p.getQuantity()+1);
				p.setTotalPrice(p.getPrice()*p.getQuantity());		
				match = true;
				break;
			}			
		}
		
		
		
		if(match!=true){
			productList.add(item);
			
		}
		
		for(Products p : productList){
		
		if(p.getQuantity()>10){
			int newquantity = 10;
			JOptionPane.showMessageDialog(null, "You can only buy a maximum number of 10 products!");
			p.setQuantity(newquantity);
			break;
		}
		}
		
/**********************************Out of Stock**************************************************/
		
		for(Products p : productList){
		
		if(p.getQuantity()==0){
			JOptionPane.showMessageDialog(null, "No more stocks!");
			productList.remove(item);
			break;
			
		}
	
	}
				
		session.setAttribute("productCart", productList);
		response.sendRedirect("displayCart.jsp");
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}
}


