<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String session_val="User";
String old_val =(String) session.getAttribute("login_failed");
if(old_val!=null) 
{
	session_val=old_val;
	session.removeAttribute("login_failed");
}
%>   
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
    
    
    <link rel="stylesheet" href="assets/css/style.css">
<meta charset="ISO-8859-1">
<title>Employee Talent Portal</title>

<script type ="text/javascript">
function failed_login()
{
	var msg="<%=session_val%>";
	if (msg!="User")
	{
		alert(msg);
	}
}

</script>

</head>


<body onload="return failed_login();">
	
<div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
		<div class="login-form">
		    <form action="Login" method="post">
		        
		        
		        <h2 class="text-center mb-4">Login</h2>
		        <div class="form-group">
		            <input type="text" name="username" class="form-control" placeholder="Email-Username" required="required">
		        </div>
		        <div class="form-group">
		            <input type="password" name="password" class="form-control" placeholder="Password" required="required">
		        </div>
		        <div class="form-group">
		            <button type="submit" class="btn btn-primary btn-block">Log in</button>
		        </div>
		        <hr>
		       
		        <div class="clearfix">
		            <p class="text-center"><a href="register.jsp">Register Account</a></p>
		        </div>
		    </form>
		</div>
</div></div></div>
</body>
</html>