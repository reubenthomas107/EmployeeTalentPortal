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
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "root");
Statement s = conn.createStatement();
String email_id = (String) session.getAttribute("email_id");
String query = "SELECT * FROM employee INNER JOIN registrations ON employee.emp_id=registrations.emp_id WHERE registrations.admin_approval_status=?";

PreparedStatement stmt = conn.prepareStatement(query);

stmt.setString(1, email_id);

ResultSet rs = stmt.executeQuery();
%> 
<%@ include file="manager_navbar.jsp" %>    
<main>
<div class="container my-5">
       <div class="card-body text-center">
    <h4 class="card-title">Manager Approval dashboard</h4>
    <p class="card-text"></p>
  </div>
    <div class="card">
        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email ID</th>
                <th scope="col">Mobile Number</th>
                <th scope="col">DOB </th>
                <th scope="col">Approval </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Fname</td>
                <td>Lname</td>
                <td>1@gmail.com</td>
                <td>123456789</td>
                <td></td>
                 <td>
                    <a class="btn btn-sm btn-primary" href="#"><i class="far fa-edit"></i> Approve</a>
                    <a class="btn btn-sm btn-danger" href="#"><i class="fas fa-trash-alt"></i> Reject</a>
                </td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>fname</td>
                <td>lname</td>
                <td>1@gmail.com</td>
                <td>123456789</td>
                <td></td>
                <td>
                    <a class="btn btn-sm btn-primary" href="#"><i class="far fa-edit"></i> Approve</a>
                    <a class="btn btn-sm btn-danger" href="#"><i class="fas fa-trash-alt"></i> Reject</a>
                </td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>emp3</td>
                <td></td>
                <td>1@gmail.com</td>
                <td>123456789</td>
                <td></td>
                <td>
                    <a class="btn btn-sm btn-primary" href="#"><i class="far fa-edit"></i> Approve</a>
                    <a class="btn btn-sm btn-danger" href="#"><i class="fas fa-trash-alt"></i> Reject</a>
                </td>
              </tr>
            </tbody>
          </table>
          
          
          <form action="ManagerUploads" method="POST">
          <button type="submit">Upload</button>
          </form>
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