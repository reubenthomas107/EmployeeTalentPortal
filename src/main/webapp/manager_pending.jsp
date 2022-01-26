<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
String query = "SELECT e.emp_id,e.first_name,e.last_name,e.email_id,e.dob,e.mobile_no,e.resume,registrations.admin_approval_status FROM employee AS e INNER JOIN registrations ON e.emp_id=registrations.emp_id";
PreparedStatement stmt = conn.prepareStatement(query);
ResultSet rs = stmt.executeQuery();
%> 

<main>
<div class="container my-5">
       <div class="card-body text-center">
    <h4 class="card-title">All Applications</h4>
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
            <% while(rs.next()){ %>
              <tr>
                <td scope="row"><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><a class="btn btn-sm btn-info" target="_blank" href="${pageContext.request.contextPath}/RenderPdf?email=<%= rs.getString(4) %>&filename=<%= rs.getString(7) %>"><i class="far fa-edit"></i>View</a></td>
                <td><%= rs.getString(8) %></td>
              </tr>
              
              <% } %>
            </tbody>
          </table>
    </div>
</div>
</main>
<!---->
<!---->
<footer >
  <div class="container bg-info p-5">
    </div>
</footer>
</body>