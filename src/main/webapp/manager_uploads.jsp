<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="manager_navbar.jsp" %>
<body>

<button type="submit" onclick="window.open('D:/LTI Work Related/OJT/IP Development/EmployeeTalentPortal/src/main/webapp/assets/bulkuploads/Template.csv')">Download! 1</button>
	
	<div class="file-wrapper">
	<form action="ManagerUploads" method="POST" enctype="multipart/form-data">
		<div class="form-group">
	      <a href="/assets/bulkuploads/" download="Template.csv">Download</a>
	      </div>
	      <div class="form-group">
	         <input class="form-control form-control-md" name="bulkupload" type="file"/>
	         <div class="small text-muted mt-2">Upload bulk details </div>
	      </div>
	          
	         
	          <button type="submit">Upload</button>
	     </form>
</div>

  <footer >
  <div class="container bg-info p-5">
    </div>
</footer>
</body>



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