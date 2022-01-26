package com.talentportal;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email_id=request.getParameter("username");
		String password=request.getParameter("password");
		
		String encryptedPasswd = Data.encryptPassword(password);
		
		try {
			Connection con = Data.getDBConnection();
			String result = Data.login(con, email_id, encryptedPasswd);
			HttpSession session = request.getSession();
			session.setAttribute("email_id",email_id);
			if(result=="Employee") {
				session.setAttribute("emp_role","Employee");
				response.sendRedirect("employee_dashboard.jsp");
			}
			else if(result=="Manager") {
				session.setAttribute("emp_role","Manager");
				response.sendRedirect("manager_dashboard.jsp");
			}
			else if(result=="Admin") {
				session.setAttribute("emp_role","Admin");
				response.sendRedirect("admin_dashboard.jsp");
			}
			else {
				session.setAttribute("login_failed","User cannot be authenticated, Please login again!");
				response.sendRedirect("login.jsp");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
