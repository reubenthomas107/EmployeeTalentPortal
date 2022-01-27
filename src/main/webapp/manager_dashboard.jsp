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
else if (session.getAttribute("emp_role")!="Manager")
{
	if(session.getAttribute("emp_role") == "Admin") 
	{
		response.sendRedirect("admin_dashboard.jsp");
	}
	else 
	{
		response.sendRedirect("employee_dashboard.jsp");
	}
	
}
%> 
<%@ include file="manager_navbar.jsp" %>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>   
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("email_id")==null){
	response.sendRedirect("login.jsp");
}
else if (session.getAttribute("emp_role")!="Manager")
{
	if(session.getAttribute("emp_role") == "Admin") 
	{
		response.sendRedirect("admin_dashboard.jsp");
	}
	else 
	{
		response.sendRedirect("employee_dashboard.jsp");
	}
	
}
%> 
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
Statement s = conn.createStatement();
String email_id = (String) session.getAttribute("email_id");
String query = "SELECT e.emp_id,e.first_name,e.last_name,e.email_id,e.dob,e.mobile_no,e.resume,registrations.admin_approval_status FROM employee AS e INNER JOIN registrations ON e.emp_id=registrations.emp_id WHERE registrations.admin_approval_status=?";
PreparedStatement stmt1 = conn.prepareStatement(query);
stmt1.setString(1, "Pending");
ResultSet rs = stmt1.executeQuery();

%> 

<main>
<div class="container my-5">
       <div class="card-body text-center">
    <h4 class="card-title">Pending Applications</h4>
    <p class="card-text"></p>
  </div>
    <div class="card">
        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">Employee ID</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email ID</th>
                <th scope="col">DOB</th>
                <th scope="col">Mobile Number</th> 
                <th scope="col">Resume</th>
                <th scope="col">Approval Status</th>
              </tr>
              
              
            </thead>
            <tbody>
            
            <% 
            if (!rs.isBeforeFirst()) 
            { 
            %> 
            <td class="lead" style="text-align:center;" colspan="8">No pending applications</td>
            <% } 
            
            else
            {        
              while(rs.next()){ %>
              <tr>
                <td scope="row" style="text-align: center;"><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><a class="btn btn-xs btn-info" target="_blank" href="${pageContext.request.contextPath}/RenderPdf?email=<%= rs.getString(4) %>&filename=<%= rs.getString(7) %>">View</a></td>
                <td><%= rs.getString(8) %></td>
              </tr>
              
              <% }} %>
            </tbody>
          </table>
    </div>
</div>
</main>




<!---->
<!---->
</body>
<style>
.navbar-brand{
margin:0;
padding:0;
}
.logo{
height:50px;
padding-right:15px;
padding-left:5px;
}
body{
    
    background-repeat:no-repeat;
    background-size: 100%;
}
footer{
    margin-top: 20px;
    padding-top: 20px;
}
.bg__card__navbar{
    background-color: #000000;
}
.bg__card__footer{
    background-color: #000000 !important;
}
</style>
</html>