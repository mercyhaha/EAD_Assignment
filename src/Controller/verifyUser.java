package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;
import Model.UserDB;

/**
 * Servlet implementation class verifyUser
 */
@WebServlet("/verifyUser")
public class verifyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verifyUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email");		
		String password=request.getParameter("password");
		
		User user =new User();
		UserDB db = new UserDB();						
		user= db.verifyUser(email,password);
		
		
		
		HttpSession Session = request.getSession();
		Session.setAttribute("result", user);
//		PrintWriter out = response.getWriter();
		if((user.getType()).equals("member")){
		response.sendRedirect("homePageEdit.jsp");
	
		}else{
			response.sendRedirect("AdminPage.jsp");
		}
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
