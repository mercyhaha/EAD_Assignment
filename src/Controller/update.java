package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;
import Model.UserDB;

/**
 * Servlet implementation class update
 */
@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
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
		     String email = request.getParameter("hiddenID");
			String password=request.getParameter("password");
			String nickname=request.getParameter("nickname");
			String dob=request.getParameter("dob");
			String cn=request.getParameter("contactno");
			String ma=request.getParameter("mailingaddr");
			int contact = Integer.parseInt(cn);
		  UserDB db = new UserDB();
			String type = "member";
			User usr = new User(nickname,email,contact,dob,ma,password,type);
			boolean status= db.updateUser(usr);
			if(status){
				PrintWriter out =response.getWriter();
				  out.println("User details update Successfully");
					//response.sendRedirect("ProductDetail.jsp?msg=Record have been deleted");
				  out.println("redirecting you back to Update page in 3 second...if fail");
				  out.println("<form action='update.jsp' method='get'>");
				  out.println("<input type='submit' value='Go back to Update!' name='Btn'/>");	
				  out.println("</form>");
					response.setHeader("refresh","3;URL=./update.jsp");
					
					HttpSession Session = request.getSession();
					Session.setAttribute("result", usr);
			}else{
			response.sendRedirect("update.jsp/msg="+status);
			}
	}

}
