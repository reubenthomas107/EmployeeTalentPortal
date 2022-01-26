package com.talentportal;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManagerUploads")
public class ManagerUploads extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{	
			Connection con = Data.getDBConnection();
			Scanner sc = new Scanner(new File("D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\resume\\Demo.csv"));  
			//make file link dynamic
			while (sc.hasNext())  
			{
				
				String data = sc.next();
				String [] Data1 = data.split(",");
				Date dob=Date.valueOf(Data1[3]);
				String email= Data1[0];
				String fn= Data1[1];
				String ln= Data1[2];
				String no= Data1[4];
				String gender= Data1[5];
				System.out.println(dob.toString());
				System.out.println(Data1[3]);
				Data.managerUploads(con,email,fn,ln,dob,no,gender);
			}   
			sc.close();  
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}

}
