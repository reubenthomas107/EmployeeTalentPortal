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
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Profile</title>
</head>
<body>
<header>
  <div class="container bg-info p-5 ">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#"><img src="ltilogo.jpg" class="img-responsive logo"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-item nav-link active" href="index.html">Home <span class="sr-only">(current)</span></a>
          <a class="nav-item nav-link" href="manager_uploads.jsp">Bulk Uploads</a>
        </div>
      </div>
    </nav>
  </div>
</header>
<!---->
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