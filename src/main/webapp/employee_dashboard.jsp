<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");
%>   
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("email_id")==null){
	response.sendRedirect("login.jsp");
}
else if (session.getAttribute("emp_role")!="Employee")
{
	if(session.getAttribute("emp_role") == "Manager") 
	{
		response.sendRedirect("manager_dashboard.jsp");
	}
	else 
	{
		response.sendRedirect("admin_dashboard.jsp");
	}
}
%>
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
Statement s = conn.createStatement();
String email_id = (String) session.getAttribute("email_id");
String query = "SELECT * FROM employee WHERE email_id=?";
PreparedStatement stmt = conn.prepareStatement(query);
stmt.setString(1, email_id);
ResultSet rs = stmt.executeQuery();
rs.next();
session.setAttribute("emp_role","Employee");


String query1 = "SELECT * FROM employee AS e INNER JOIN employee_details ON e.emp_id=employee_details.emp_id WHERE e.email_id=?";
PreparedStatement stmt2 = conn.prepareStatement(query1);
stmt2.setString(1, email_id);
ResultSet rs1 = stmt2.executeQuery();
rs1.next();

session.setAttribute("emp_id", rs.getString(1));
session.setAttribute("old_resume", rs.getString(6));
session.setAttribute("old_picture", rs1.getString(13));
%>



<%@ include file="employee_navbar.jsp" %>

<div class="row">
    <div class="col-10 ms-5 mt-5">
        <h5>Settings</h5>
    </div>
    <hr>
    <div class="container mt-1" style="border: 1px solid black; width: fit-content; border-radius: 5px;">
     <div class="d-flex mt-5 justify-content-center">
        <div class="col-5 mt-3">
        <div class="px-4 mx-4">
            <div class="card">
                <div class="card-body">
                    <center class="m-t-30"> <img src="assets/images/<%= rs1.getString(13) %>" class="rounded-circle" width="150" height="150" />
                        <h4 class="card-title m-t-10"> </h4>
                        <h6 class="card-subtitle" id="name-data-user"><%= rs.getString(3) %> <%= rs.getString(4) %></h6>
                    </center>
                </div>
                <div>
                   
                </div>
                <div class="card-body lead ">
                	<small class="" id="email-data">Employee ID : <%= rs.getString(1) %></small><br>
                    <small class="" id="name-data">First Name : <%= rs.getString(3) %></small><br>
                    <small class="" id="email-data">Last Name : <%= rs.getString(4) %></small><br>
                    <small class="" id="email-data">Email : <%= rs.getString(2) %></small><br>
                    <small class="" id="email-data">Date of Birth : <%= rs.getString(5) %></small><br>
                    <small class="" id="email-data">Mobile Number : <%= rs.getString(7) %></small><br>
                    <small class="" id="email-data">Gender : <%= rs.getString(8) %></small><br>
                </div>
            </div>
            </div> 
        </div>

 
      <div class="container mt-1" style="border: 1px solid black; width: fit-content; border-radius: 5px;">
		    <h4 class="mt-3 mx-5 text-center">My Profile</h4>
		
		
		    
    <form class="mt-4 ms-5" method="post" action="UpdateProfile" enctype="multipart/form-data">

        <div class="mb-3 row">
            <label for="name" class="col-sm-3 col-form-label">Resume</label>
       
            <div class="col-sm-8">
            <a class="btn btn-sm btn-info" target="_blank" href="${pageContext.request.contextPath}/RenderPdf?email=<%= rs.getString(2) %>&filename=<%= rs.getString(6) %>">
                <input type="text" class="form-control" id="resume" name="resume" value="<%= rs.getString(6) %>" disabled>        
         	</a>
         </div>
        </div>
        
        <div class="mb-3 row">
            

            <label for="image" class="col-sm-3 col-form-label">Update Resume</label>
            <div class="col-sm-8">
                <input type="file" class="form-control" id="updated_resume" name="updated_resume">
            </div>
        </div>
		
		
		
     
     <%!  
     	String p_skill="";
     	String s_skill="";
     	String lang="Please select your language";
     %>
		<% 
		
		if(rs1.getString(10)!=null)
		{
		    p_skill=rs1.getString(10);  
		}
		if(rs1.getString(11)!=null)
		{
		    s_skill=rs1.getString(11);
		}
		if(rs1.getString(12)!=null)
		{
		    lang=rs1.getString(12);
		}
		
		
		%>
     
     
        <div class="mb-3 row">
            <div class="mb-3">
                <label for="image" class="col-sm-3 col-form-label">Profile Picture</label>
                <img src="assets/images/<%= rs1.getString(13) %>" height="auto" width="150px" alt="No image uploaded">
            </div>

            <label for="image" class="col-sm-3 col-form-label">Update Image</label>
            <div class="col-sm-8">
                <input type="file" class="form-control" id="updated_image" name="updated_image">
            </div>
        </div>
        
        
        <div class="mb-3 row">
            <label for="description" class="col-sm-3 col-form-label">Primary Skills</label>
            <div class="col-sm-8">
                <textarea class="form-control" id="p_skill" name="p_skill" required><%= p_skill %></textarea>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="description" class="col-sm-3 col-form-label">Secondary Skills</label>
            <div class="col-sm-8">
                <textarea class="form-control" id="s_skill" name="s_skill" required><%= s_skill %></textarea>
            </div>
        </div>

        <div class="mb-3 row">
            <div class="mb-3 row">
                <label for="staticEmail" class="col-sm-3 col-form-label">Language Preference</label>
                <div class="col-sm-8">
                    <div class="dropdown">
                        <select class="form-select" name="lang" id="lang"
                            style=" height: 100%; width: 100%;">
                            <option disabled value="<%= lang %>"><%= lang %></option>   
                            <option value="English">English</option>
                            <option value="Hindi">Hindi</option>
                            <option value="Marathi">Marathi</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
       
        <div class="row text-center">
            <div class="d-grid mx-auto col-6">
                <button class="btn btn-primary mt-3 mb-2" type="submit">Update Profile</button>
            </div>
        </div>
    </form>
</div>
        
        
        
       
    </div>
</div>
</html>