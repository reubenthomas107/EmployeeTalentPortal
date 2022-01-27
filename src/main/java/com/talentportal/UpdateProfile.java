package com.talentportal;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
			int emp_id=(int)session.getAttribute("emp_id");
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
			
			Collection<Part> parts = request.getParts();
			  List<Part> resume = new ArrayList<>(parts.size());
			  List<Part> image = new ArrayList<>(parts.size());
			  for (Part part : parts) {
			    if (part.getName().equals("updated_resume")) 
			    {
			      resume.add(part);
			    }
			    if (part.getName().equals("updated_image")) 
			    {
			      image.add(part);
			    }
			  }
			
			//for resume
			if(fileName1.equals(""))
			{
				update_resume=old_resume;
				System.out.println("Resume not updated");
			}
			else 
			{
				update_resume=fileName1;
				String filePath = "D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\resume\\"+email+"_"+update_resume ;
	            for (Part part : resume) 
	            {
	              System.out.println(part.getName());
	              part.write("D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\resume\\"+email+"_"+update_resume );
	            }
			}
			
			//for image
			if(fileName2.equals(""))
			{
				update_photo=old_picture;
				System.out.println("Image not updated");
			}
			else
			{
				update_photo=fileName2;
				String filePath2 = "D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\images\\"+email+"_"+update_photo ;
	            for (Part part : image) 
	            {
	              part.write("D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\images\\"+email+"_"+update_photo );
	            }	
			}   
			
			System.out.println(update_resume);
			System.out.println(update_photo);
			System.out.println(p_skill);
			System.out.println(s_skill);
			Connection conn = Data.getDBConnection();
            Data.updateEmployeeDetails(conn,emp_id,p_skill,s_skill,lang,update_resume,update_photo);
            response.sendRedirect("employee_dashboard.jsp");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
}