<%    
  String filename = "Template.csv";   
  String filepath = "D:\\LTI Work Related\\OJT\\IP Development\\EmployeeTalentPortal\\src\\main\\webapp\\assets\\bulkuploads\\";   
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%>