package com.talentportal;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ManagerUploads")
@MultipartConfig
public class ManagerUploads extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{	
			Connection conn = Data.getDBConnection();
			Part filePart = request.getPart("bulkupload");
            String fileName = filePart.getSubmittedFileName();
            String filePath = "D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\bulkuploads\\"+fileName ;
            for (Part part : request.getParts()) 
            {
              part.write(filePath);
            }
            
			Scanner sc = new Scanner(new File(filePath));  
			//make file link dynamic
			while (sc.hasNext())  
			{
				
				String data = sc.next();
				String [] Data1 = data.split(",");
				String email= Data1[0];
				if(email.equals("Email"))
				{
					continue;
				}
				else 
				{
					String fn= Data1[1];
					String ln= Data1[2];
					String no= Data1[4];
					String gender= Data1[5];
					Date dob=Date.valueOf(Data1[3]);
					int employee_id = Data.managerUploads(conn,email,fn,ln,dob,no,gender);
					Data.managerSubmission(conn,employee_id);	
				}
			}   
			sc.close(); 
			response.sendRedirect("manager_dashboard.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}

}
