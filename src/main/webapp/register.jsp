<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<meta charset="ISO-8859-1">
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="script.js" type="text/javascript"></script>
  <title>Signup Page</title>
</head>
<body>
<div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
  <div class="login-form">
    <form name="myForm2" onsubmit="return validateSignup()" action="Register" method="post" enctype="multipart/form-data">
      <h2 class="text-center">Sign Up</h2>
      <p class="text-center">Please fill your details to register your account!</p> 
      <br>      
      <div class="form-group">
          <input type="text" id="names" name="firstname" class="form-control" placeholder="First Name" required="required">
      </div>
      <div class="form-group">
          <input type="text" id="names" name="lastname" class="form-control" placeholder="Last Name" required="required">
      </div>
      <div class="form-group">
          <input type="text" id="email" name="email" class="form-control" placeholder="Email-ID" required="required">
      </div>
      <div class="form-group">
        <input type="date" id="dob" name="dob" class="form-control" placeholder="Date of Birth" required="required">
      </div>

      <div class="form-group">
        <select class="form-control" id="gender" name="gender" required>
          <option value="">Select Gender</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
        </select>
      </div>
      <div class="form-group">
        <input type="tel" id="mobileno" name="mobileno" class="form-control" placeholder="Mobile Number" required="required">
    </div>
  
  	<div class="form-group">
         <input class="form-control form-control-md" name="resume" type="file" accept="application/pdf, application/msword"/>
         <div class="small text-muted mt-2">Upload your CV/Resume </div>

      </div>
  
    <br>
      <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block">Submit</button>
      </div>
      <hr>                 
      <div class="clearfix">
          <p class="text-center">Already have an account? <a href="login.jsp">Login here!</a></p>   
      </div>   
  </form>
    
  </div>
  </div></div></div>
</body>

</html>