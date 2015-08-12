package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import Model.*;

import java.util.*;

/**
 * Servlet implementation class SearchPhoneServlet
 */
@WebServlet("/UpdateProductsServlet")
public class UpdateProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
HttpSession session = request.getSession(); //get the session
		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int productid = Integer.parseInt(request.getParameter("productid"));
		
		ArrayList<Products> productList = (ArrayList<Products>)session.getAttribute("productCart");
		
			for(Products p : productList){
				
				if (quantity<=0 || quantity > 10){
					int newquantity = 10;
					JOptionPane.showMessageDialog(null, "Invalid Quantity!\n"
							+ "The maximum number of products that can be purchse is 10!");
					p.setQuantity(newquantity);
				}
				
				else if (productid == p.getProductid()){
					JOptionPane.showMessageDialog(null, "Quantity Updated!");
					 p.setQuantity(quantity);
					 p.setTotalPrice(p.getQuantity()*p.getPrice());
				}
				
			}	
				
			
			session.setAttribute("productCart", productList);
			response.sendRedirect("displayCart.jsp");
			
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
}
}




