package com.talentportal;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


@WebServlet("/Register")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
      )
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			HttpSession session = request.getSession();
			String firstname=request.getParameter("firstname");
			String lastname=request.getParameter("lastname");
			String email=request.getParameter("email");
			String dob=request.getParameter("dob");
			String mobileno=request.getParameter("mobileno");
			String gender=request.getParameter("gender");
			
			//Uploading Files
			Part filePart = request.getPart("resume");
            String fileName = filePart.getSubmittedFileName();
            String filePath = "D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\resume\\"+email+"_"+fileName ;
            for (Part part : request.getParts()) 
            {
              part.write("D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\resume\\"+email+"_"+fileName );
            }
            
            Connection conn=Data.getDBConnection();
            

		    Date dob1=Date.valueOf(dob);
            //Validating Age
            LocalDate birthday = LocalDate.parse(dob);  	
			LocalDate today = LocalDate.now();
			Period p = Period.between(birthday, today);
			int age = p.getYears();
			
			Pattern pattern = Pattern.compile("^[0-9]{10}$");
			Matcher matcher = pattern.matcher(mobileno);

			boolean validation=false;
			if((Data.duplicateValidation(conn, email)) && (email.endsWith("@lntinfotech.com")) && (age>18) && (gender.equals("Male") || gender.equals("Female")) && (matcher.find()))
			{
				validation=true;
			}
						
			else 
			{
				validation=false;
				session.setAttribute("registration_failed","Validation Failed!");
				System.out.println("Validation Failed!");
			}
						
			//validation check
			if(validation==true) 
			{
				int employee_id = Data.employeeRegistration(conn, email, firstname, lastname, dob1, fileName, mobileno, gender);
				System.out.println(employee_id);
				String admin_status = "Pending";
				Data.employeeSubmission(conn, email, admin_status, employee_id);
				response.sendRedirect("login.jsp");
			}
			else
			{
				response.sendRedirect("register.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
}
}


