package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.*;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession lol = request.getSession();
		HttpSession session =request.getSession();
		
		String cardtype = request.getParameter("type");
		double totalamount=Double.parseDouble(request.getParameter("totalamount"));
		int creditcardno = Integer.parseInt(request.getParameter("creditcard"));
		int cvc = Integer.parseInt(request.getParameter("cvc"));
		
		checkoutDB db=new checkoutDB();
		int transactionid = db.updateTransaction(cardtype, totalamount, creditcardno);
		
				
		ArrayList<Products> productList = (ArrayList<Products>)session.getAttribute("productCart");
		checkoutDB db1=new checkoutDB();
		db1.updateTransactionDetails(productList, transactionid);

	
		
		response.sendRedirect("displayCheckOutSuccess.jsp");
		
		
	}

}
