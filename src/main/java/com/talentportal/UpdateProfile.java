package com.talentportal;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
      )
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
			
			HttpSession session = request.getSession(); 
			String emp_id=(String)session.getAttribute("emp_id");
			String email = (String) session.getAttribute("email_id");
			String old_resume=(String)session.getAttribute("old_resume");
			String old_picture=(String)session.getAttribute("old_picture");
			String p_skill=request.getParameter("p_skill");
			String s_skill=request.getParameter("s_skill");
			String lang=request.getParameter("lang");
			String update_resume="";
			String update_photo="";
			Part filePart1 = request.getPart("updated_resume");
			Part filePart2 = request.getPart("updated_image");
			String fileName1 = filePart1.getSubmittedFileName();
			String fileName2 = filePart2.getSubmittedFileName();
			
			//for resume
			if(fileName1.equals(""))
			{
				update_resume=old_resume;
				System.out.println("Resume not updated");
				System.out.println(update_resume);
			}
			else 
			{
				update_resume=fileName1;
				String filePath = "D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\resume\\"+email+"_"+fileName1 ;
	            for (Part part : request.getParts()) 
	            {
	              part.write("D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\resume\\"+email+"_"+fileName1 );
	            }
			}
			
			//for image
			if(fileName2.equals(""))
			{
				update_photo=old_picture;
				System.out.println("Image not updated");
				System.out.println(update_photo);
			}
			else
			{
				update_photo=fileName2;
				String filePath2 = "D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\images\\"+email+"_"+fileName2 ;
	            for (Part part : request.getParts()) 
	            {
	              part.write("D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\images\\"+email+"_"+fileName2 );
	            }	
			}   
			
			System.out.println(update_resume);
			System.out.println(update_photo);
            
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
}