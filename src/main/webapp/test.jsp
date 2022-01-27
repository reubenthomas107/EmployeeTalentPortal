<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>
<body>
	<div>
		  <label for="input" id="label">
		  <ion-icon name="cloud-upload-outline"></ion-icon>
		  <span id="span">Upload your file here</span>
		  <input id="input" type="file">
		</label>
		<button>Submit</button>
	  </div>
	<div>
		<label  id="label">
		  <ion-icon name="cloud-download-outline"></ion-icon>
		  <span id="#">Download your file here</span>
		</label>
	<button>Download</button>
	  </div>
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
  display:inline-flex;
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
  border: 2px dotted #7e57c2;
  border-radius: 5px;
  color: #7e57c2;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 10px;
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
button:hover {
  color: #fff;
}
</style>
<script>
document.getElementById("input").addEventListener("change", (e) => {
      document.getElementById("span").innerText = e.target.files[0].name;
    });
</script>
</html>