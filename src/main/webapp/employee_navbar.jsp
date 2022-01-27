<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Employee Talent Portal</title>
</head>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand ms-3" href="#"><img src='assets/images/ltilogo.png' height="35", width="35"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="employee_dashboard.jsp">Home</a>
        </li>
    
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                aria-expanded="false">
                Categories
            </a>
            <ul class="dropdown-menu me-5 mt-2" style="float: left;" aria-labelledby="navbarDropdown">
                
                <li><a class="dropdown-item" href="#">Category</a></li>           
            </ul>
        </li>
        
        <li class="nav-item">
            <a class="nav-link " aria-current="page" href="">Search Products</a>
        </li>
        </ul>
        <div class="d-flex">
            <div class="nav-item mt-1 me-4">      
               
                <a class="nav-link disabled">Welcome, {{user.first_name}} {{user.last_name}}</a>
                
            </div>

            
            <div class="nav-item dropdown me-3">
                <a class="nav-link " href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="fa fa-user" style="font-size:26px; color: black;" aria-hidden="true"></i>
                </a>
                <ul class="dropdown-menu mt-2" style="left: auto; right: 0px;" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="">Account</a></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/Logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
    </div>
</nav>