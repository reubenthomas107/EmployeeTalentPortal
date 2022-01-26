package com.talentportal;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RenderPdf")
public class RenderPdf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String filename=request.getParameter("filename");
		
		System.out.println(email);
		System.out.println(filename);
		String filepath = "D:/LTI Work Related/OJT/IP Development/EmployeeTalentPortal/src/main/webapp/assets/resume/";
		String file_final = filepath+email+"_"+filename;
		System.out.println(file_final);
		File file = new File(file_final);
 
		response.setHeader("Content-Type", getServletContext().getMimeType(file.getName()));
        response.setHeader("Content-Length", String.valueOf(file.length()));
        response.setHeader("Content-Disposition", "inline; filename=\"foo.pdf\"");
        Files.copy(file.toPath(), response.getOutputStream());
	}

}
