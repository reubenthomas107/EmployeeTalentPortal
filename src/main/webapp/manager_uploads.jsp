<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="manager_navbar.jsp" %>


<head>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,900;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<body>
<header>
 
</header>
<form action="ManagerUploads" method="POST" enctype="multipart/form-data" onsubmit="return validateBulkFile()">
	<div class="form-group">
		<div class="fullbody">
		<div>
		  <label for="input" id="label">
			  <ion-icon name="cloud-upload-outline"></ion-icon>
			  <span id="span">Bulk upload CV's here</span>
			  <input id="input" name="bulkupload" type="file">
		  </label>
				<button type="submit">Upload</button>
		</div>
			<div>
			<a href="download_template.jsp" style ="text-decoration:none";>
				<label  id="label">
				  <ion-icon name="cloud-download-outline"></ion-icon>
				  <span id="#">Download Template for CVs</span>
				</label>
				<button disabled>Download</button></a>
				
		    </div>
	  	</div>
		     
		</div>
	</form>
</body>
<style>
* {
  margin: 0;
  podding: 0;
  box-sizing: border-box;
}
body {
  width: 100vw;
  height: 100vh;
  place-content: center;
  grid-gap: 25px;
}
input {
  display: none;
}
label {
  width: 300px;
  height: 125px;
  padding: 15px;
  margin-top:15px;
  margin-bottom:15px;
  margin-right:15px;
  border: 2px dotted #7e57c2;
  border-radius: 5px;
  color: #7e57c2;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}
label:hover {
  background-color: #ede7f6;
}
ion-icon {
  font-size: 24px;
}
span {
  max-width: 100%;
  font-family: sans-serif;
  font-size: 20px;
  text-align: center;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
button {
  appearance: none;
  padding: 8px;
  display:grid;
  margin:auto;
  background-color: #7e57c2;
  border: none;
  border-radius: 5px;
  color: #ede7f6;
  font-family: sans-serif;
  font-size: 16px;
  cursor: pointer;
}
.fullbody{
    display: flex;
    flex-direction: row;
    height: 100%;
    justify-content: center;
    position: fixed;
    left: 30%;
    top: 20%;
}
button:hover {
  color: #fff;
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
.bg__card__navbar{
    background-color: #000000;
}
.bg__card__footer{
    background-color: #000000 !important;
}
</style>
<script>

document.getElementById("input").addEventListener("change", (e) => {
      document.getElementById("span").innerText = e.target.files[0].name;
    });
</script>
</html>
</html>