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

import java.util.regex.*;
import java.util.*;
import java.sql.*;   
/**
 * Servlet implementation class Authenticate
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
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
		
			//HttpSession session = request.getSession(); //get the session
	
			
		String email= request.getParameter("email");		
		String password=request.getParameter("password");
		String nickname=request.getParameter("nickname");
		String dob=request.getParameter("dob");
		String cn=request.getParameter("contactno");
		String ma=request.getParameter("mailingaddr");
		int contact = Integer.parseInt(cn);
		
		boolean error=false;
		String errorMsg="";
		
		
		
		if(email==""){
			//alert("1");		
			errorMsg +="Please enter a Email!";
			//alert("User id is empty!")
		
			error = true;
			
		}
		if(password==""){
				//alert("2");
				errorMsg +="\nPlease enter the Password!";
				//alert("User id is empty!")
				error = true;
				
			}
		 if(nickname==""){
			//alert("3");
			errorMsg +="\nPlease enter the Nickname!";
			//alert("User id is empty!")
			error = true;
			
		}
		 if(dob==""){
				//alert("3");
				errorMsg +="\nPlease enter the Date of Birth!";
				//alert("User id is empty!")
				error = true;
				
			}
		 if(cn==""){
				//alert("3");
				
				errorMsg +="\nPlease enter the Contact Number!";
				//alert("User id is empty!")
				error = true;
				
			}
		 if(ma==""){
				//alert("3");
				
				errorMsg +="\nPlease enter the Mailing Address!";
				//alert("User id is empty!")
				error = true;
				
			}
		 
			
			
			String emailID ="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

			boolean resultID = email.matches(emailID);
			
			String criteriaPw ="(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$&*]).{8,}"; 
			boolean resultPw = password.matches(criteriaPw);

			String criteriadob = "^\\d{4}-\\d{2}-\\d{2}$";
			boolean resultdob = dob.matches(criteriadob);
			
			String criteriacn = "^\\d{8}";
			boolean resultcn = cn.matches(criteriacn);
			
		
			if(resultID){
			}else{
				
				errorMsg+="Invalid Email!\n Example@Example.com";
				error = true;
			}
			if(resultPw){
			}else{
				
				errorMsg+="Invalid Password!\n Must Contain one lower case,\n one upper case,\n one !@#$%^&* \nand one numeric.\nAt least 8 characters!!!";
				error = true;
				}
			if(resultdob){
			}else{
					
				errorMsg+="Invalid Date of Birth\nPlease write in YYYY-MM-DD Format!!";
				error = true;
				}
			if(resultcn){
			}else{
				
				errorMsg+="Invalid Contact number 8 digit numeral. ";
				error = true;
				}
		
		
		

		

		
				if(error){
					response.sendRedirect("Signup.jsp?msg="+errorMsg);
				}
				else{
				UserDB db = new UserDB();
				String type = "member";
				User usr = new User(nickname,email,contact,dob,ma,password,type);
				boolean status= db.insertUser(usr);
				if(status){
					PrintWriter out =response.getWriter();
					  out.println("User register Successfully");
						//response.sendRedirect("ProductDetail.jsp?msg=Record have been deleted");
					  out.println("redirecting you back to Product page in 3 second...if fail");
					  out.println("<form action='Login.jsp' method='get'>");
					  out.println("<input type='submit' value='Go back to Login!' name='Btn'/>");	
					  out.println("</form>");
						response.setHeader("refresh","3;URL=./Login.jsp");
				}else{
				response.sendRedirect("Signup.jsp");
				}
				}
				
			}
			
		
	}


