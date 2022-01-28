function validateSignup(){
	
	var ln=document.getElementById("lastname").value;
    var fn=document.getElementById("firstname").value;
	var em=document.getElementById('email').value;
	var email = /^([A-Za-z0-9_\-\.])+\@([lntinfotech|LNTINFOTECH])+\.(com)$/;
	var dob=document.getElementById("dob").value;
	var mn=document.getElementById("mobileno").value;
	 
	if(fn=="" || fn==null || !fn.match(nam))
    {
        alert('Enter first name (Only Alphabets)');
        document.myForm2.firstname.focus();
        return false;
    }
    if(ln=="" || ln==null || !ln.match(nam))
    {
        alert('Enter last name (Only Alphabets)');
        document.myForm2.lastname.focus();
        return false;
    }

	if(!em.match(email))
    {
        alert('Please provide a valid email address [@lntinfotech.com domain only]');
        document.myForm2.email.focus();
        return false;
    }
	
	if(mn.length!=10)
    {
        alert('Enter a 10 Digit Mobile Number');
        document.myForm2.mobileno.focus();
        return false;
    }
	
	if(dob=="")
    {
        alert('Please provide your Date of Birth');
        document.myForm2.dob.focus();
        return false;
    }
	
	
	return (true);
}
