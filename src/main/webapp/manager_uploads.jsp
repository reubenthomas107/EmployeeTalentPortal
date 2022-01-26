<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,900;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
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
          <a class="nav-item nav-link active" href="manager_dashboard.jsp">Home <span class="sr-only">(current)</span></a>
          <a class="nav-item nav-link" href="manager_uploads.jsp">Bulk Uploads</a>
        </div>
      </div>
    </nav>
  </div>
</header>
 <div class="file-wrapper">
      <div class="upload-btn-wrapper">
          <button class="btn upload-file font-weight-500">
              <span class="upload-btn">
                <i class="fas fa-cloud-upload-alt d-block font-50 pb-2"></i>
                Browse folders here
              </span>
              <span class="upload-select-button" id="blankFile">
              </span>
              <span class="success">
                <i class="far fa-check-circle text-success"></i>
              </span>
          </button>
          <input type="file" name="selectfile" id="selectfile">
      </div>
  </div>
  <footer >
  <div class="container bg-info p-5">
    </div>
</footer>
</body>
<script>
$("#selectfile").bind('change',function(){
    var filename = $("#selectfile").val();
    if(/^s*$/.test(filename)){
        $("#blankFile").text("No File Chosen..");
        $(".success").hide();
    }else{
        $("#blankFile").text(filename.replace("/EmployeeTalentPortal/WebContent/WEB-INF/resumes",""));
        $(".success").show();
    }
}) 
</script>
<style>
*{
    margin:0;
    padding:0;
    box-sizing: border-box;
}
body{
    background-color:#f3f2f2;
    font-family: 'Poppins', sans-serif;
} 
 .file-wrapper{
     width:100%;
     margin:auto;
     height:100vh;
     display: flex;
     align-items: center;
     justify-content: center;
 }
 .upload-btn-wrapper{
     position: relative;
     overflow: hidden;
     display: inline-block;
     cursor: pointer;
 }
 .upload-file{
     border:2px dashed #eee;
     color:#9b9b9b;
     background-color: white;
     width:400px;
     height:250px;
     border-radius: 8px;
     font-size:15px;
     cursor: pointer;
 }
 .upload-btn-wrapper input[type=file]{
     width:100%;
     position: absolute;
     left:0;
     right:0;
     top:0;
     opacity: 0;
     cursor: pointer;
     min-height: 300px;
 }
 .success{
     display:none;
 }
 .success i{
     font-size:22px;
     margin-left:6px;
     margin-top:10px;
     color:#00b665;
 }
 .font-50{
     font-size:50px;
 }
 .d-block{
     display: block;
 }
 .btn .upload-file{
     font-size:13px;
 }
 .upload-btn{
     display: block;
     font-size:18px;
     color:#00b665;
 }
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