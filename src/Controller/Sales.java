package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.*;

/**
 * Servlet implementation class Sales
 */
@WebServlet("/Sales")
public class Sales extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sales() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int month =Integer.parseInt( request.getParameter("month"));
		int year =Integer.parseInt( request.getParameter("year"));
		System.out.println(month);
		System.out.println(year);
			checkoutDB db = new checkoutDB();
		ArrayList<checkout1> al= db.sales(month,year);
		
		//HttpSession session=request.getSession();
		//session.setAttribute("searchResult", al);
		
		request.setAttribute("searchResult", al);
		RequestDispatcher rd = request.getRequestDispatcher("Sales.jsp");
		rd.forward(request,response);
		
		response.sendRedirect("Sales.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
