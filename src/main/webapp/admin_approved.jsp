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
else if (session.getAttribute("emp_role")!="Admin")
{
	if(session.getAttribute("emp_role") == "Manager") 
	{
		response.sendRedirect("manager_dashboard.jsp");
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
PreparedStatement stmt = conn.prepareStatement(query);
stmt.setString(1, "Approved");
ResultSet rs = stmt.executeQuery();
%> 
    
<%@ include file="admin_navbar.jsp" %>
<body>
<main>
<div class="container my-5">
       <div class="card-body text-center">
    <h4 class="card-title">Approved Applications</h4>
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
                <td><a class="btn btn-sm btn-info" href="#approve"><i class="far fa-edit"></i>View</a></td>
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