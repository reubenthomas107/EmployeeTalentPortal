package com.talentportal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;

public class Data{
	public static final String driver = "com.mysql.cj.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/employee";
	public static final String uname = "root";
	public static final String pwd = "root";
	
	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {
		Connection con = null;
		Class.forName(driver);
		System.out.println("Loaded Driver");
		con = DriverManager.getConnection(url,uname,pwd);
		System.out.println("DB Connected");
		return con;
	}
	
	
	public static String login(Connection con, String email_id, String passwd) throws SQLException{
		int emp_id;
		String emp_role="";
		String q1 = "SELECT emp_id,emp_role FROM employee WHERE email_id=?";
		PreparedStatement stmt = con.prepareStatement(q1);
		stmt.setString(1, email_id);
		
		ResultSet rs1 = stmt.executeQuery();
		if(rs1.next()) 
		{
		emp_id=rs1.getInt("emp_id");
		emp_role=rs1.getString("emp_role");
		}

		String q2 = "SELECT password FROM user WHERE email_id = ?";
		PreparedStatement stmt2 = con.prepareStatement(q2);

		stmt2.setString(1, email_id);
		ResultSet rs = stmt2.executeQuery();

		if(rs.next()) 
		{
		String password = rs.getString("password");
		if(password.equals(passwd)) 
		{
			System.out.println("Successful Login!");	
			if(emp_role.equals("Employee")) 
			{
				return "Employee";
			}
			else if(emp_role.equals("Manager")) 
			{
				return "Manager";
			}
			else 
			{
				return "Admin";
			}
		}
		}
		return "";
	}

	public static String generateRandomPassword(int len)
    {
  
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < len; i++)
        {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
 
        String random_password = sb.toString();
        return random_password;
    }
	
	
	
	public static String encryptPassword(String password) {
		String encrypted_password = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(password.getBytes());
			byte[] bytes = md.digest();	
			StringBuilder sb = new StringBuilder();
			for(int i=0;i<bytes.length;i++) {
				sb.append(Integer.toString((bytes[i]&0xff)+0x100,16).substring(1));
			}
			encrypted_password = sb.toString();
		}
		catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	
	return encrypted_password;
}

public static boolean duplicateValidation(Connection conn, String email) throws SQLException{
	String query = "SELECT email_id FROM employee WHERE email_id=?";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setString(1, email);
	ResultSet rs = stmt.executeQuery();
	if (!rs.isBeforeFirst()) 
	{    
	    return true;
	}
	System.out.println("Email already Exists");
	return false;
}
	
	
	
public static int employeeRegistration(Connection conn, String email, String firstname, String lastname, Date dob, String resume_name, String mobileno, String gender) throws SQLException {
	String query = "INSERT INTO employee (email_id,first_name,last_name,dob,resume,mobile_no,gender) Values(?,?,?,?,?,?,?)";
	
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setString(1, email);
	stmt.setString(2, firstname);
	stmt.setString(3, lastname);
	stmt.setDate(4, dob);
	stmt.setString(5, resume_name);
	stmt.setString(6, mobileno);
	stmt.setString(7, gender);
	boolean rows = stmt.execute();	
	
	if(!rows) 
	{
		System.out.println("Employee registered successfully. Added to employee DB");
	}
	
	stmt.close();
	int employee_id=0;
	String query1 = "SELECT emp_id FROM employee WHERE email_id=?";
	
	PreparedStatement stmt1 = conn.prepareStatement(query1);
	stmt1.setString(1, email);
	ResultSet rs = stmt1.executeQuery();
	if (rs.next())
	{
		employee_id=rs.getInt("emp_id");
	}
	return employee_id;
}

public static void employeeSubmission(Connection conn, String email, String admin_status, int employee_id) throws SQLException {
	String query = "INSERT INTO registrations (admin_approval_status,emp_id) VALUES (?,?)";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setString(1, admin_status);
	stmt.setInt(2, employee_id);
	boolean rows = stmt.execute();	
	
	String query1 = "INSERT INTO employee_details (emp_id,profile_img) VALUES (?,?)";
	PreparedStatement stmt2 = conn.prepareStatement(query1);
	stmt2.setInt(1, employee_id);
	stmt2.setString(2, "employee.jpg");
	stmt2.execute();
	
	if(!rows) {
		System.out.println("Updated registration successfully. Added to Registration DB");
	}
}


public static void updateEmployeeDetails(Connection conn, int emp_id, String p_skill,String s_skill,String lang,String update_resume,String update_photo) throws SQLException {
	String query = "UPDATE employee_details SET primary_skill=?,secondary_skill=?,language_pref=?,profile_img=? WHERE emp_id=?";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setString(1, p_skill);
	stmt.setString(2, s_skill);
	stmt.setString(3, lang);
	stmt.setString(4, update_photo);
	stmt.setInt(5, emp_id);
	stmt.execute();
	
	String query1 = "UPDATE employee SET resume=? WHERE emp_id=?";
	PreparedStatement stmt2 = conn.prepareStatement(query1);
	stmt2.setString(1, update_resume);
	stmt2.setInt(2, emp_id);
	stmt2.execute();
	
	System.out.println("Updated employee details successfully");
}


public static int managerUploads(Connection conn, String email, String firstname, String lastname, Date dob, String mobileno, String gender) throws SQLException {
	String query = "INSERT INTO employee (email_id,first_name,last_name,dob,mobile_no,gender) VALUES (?,?,?,?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setString(1, email);
	stmt.setString(2, firstname);
	stmt.setString(3, lastname);
	stmt.setDate(4, dob);
	stmt.setString(5, mobileno);
	stmt.setString(6, gender);
	boolean rows = stmt.execute();	
	
	if(!rows) 
	{
		System.out.println("Employee "+firstname+" registered successfully. Added to employee DB");
	}
	
	stmt.close();
	
	int employee_id=0;
	String query1 = "SELECT emp_id FROM employee WHERE email_id=?";
	
	PreparedStatement stmt1 = conn.prepareStatement(query1);
	stmt1.setString(1, email);
	ResultSet rs = stmt1.executeQuery();
	if (rs.next())
	{
		employee_id=rs.getInt("emp_id");
	}
	return employee_id;
	
}

public static void managerSubmission(Connection conn, int employee_id) throws SQLException {
	String query = "INSERT INTO registrations (admin_approval_status,emp_id) VALUES (?,?)";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setString(1, "Pending");
	stmt.setInt(2, employee_id);
	boolean rows = stmt.execute();	
	
	String query1 = "INSERT INTO employee_details (emp_id) VALUES (?)";
	PreparedStatement stmt2 = conn.prepareStatement(query1);
	stmt2.setInt(1, employee_id);
	stmt2.execute();
	
	if(!rows) {
		System.out.println("Manager updated registration successfully."+employee_id+" Added to Registrations DB");
	}
}

public static void adminApproval(Connection conn, String reg_id) throws SQLException {
	String query = "UPDATE registrations SET admin_approval_status='Approved',approval_date=? where registration_id=?";
	LocalDate currentDate = LocalDate.now();
	Date date = Date.valueOf(currentDate);
	
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setDate(1, date);
	stmt.setString(2, reg_id);
	stmt.executeUpdate();
	
	String user_query = "SELECT e.emp_id,e.email_id,registrations.registration_id FROM employee AS e INNER JOIN registrations ON e.emp_id=registrations.emp_id WHERE registrations.registration_id=?";
	PreparedStatement stmt2 = conn.prepareStatement(user_query);
	stmt2.setString(1, reg_id);
	stmt2.executeQuery();
	
	ResultSet rs = stmt2.executeQuery();
	rs.next();
	
	String emp_id = rs.getString(1);
	String email_id = rs.getString(2);
	
	//password generation function here
	String random_password = generateRandomPassword(10);
	System.out.println(random_password);
	String password = encryptPassword(random_password);
	userGenerate(conn,emp_id,email_id,password);
	
	//mail generation function here
	sendEmail(email_id,random_password);
	
}

public static void sendEmail(String email_id, String password) throws SQLException {
	final String sender_name="ltialentportal@gmail.com";
	final String sender_pass="LTI@portal1";
	
	String email_subject = "EmployeeTalent - Registration Approved!";
	String email_body = ("Your registration was approved successfully.\n\n\nUsername : "+email_id+"\n Password : "+password);
	
	Properties props=new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.starttls.enable", "true");
    Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator()
    {
    	protected PasswordAuthentication getPasswordAuthentication() 
    	{
    		return new PasswordAuthentication(sender_name,sender_pass);
    	}
    });
    try 
    {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(sender_name));
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(email_id));
        message.setSubject(email_subject);
        message.setText(email_body);
        Transport.send(message);
    }
    catch(Exception e) {
        e.printStackTrace();
    }
	
}


public static void userGenerate(Connection conn, String emp_id, String email_id, String password) throws SQLException {
	String query = "INSERT INTO user (email_id,password,emp_id) VALUES (?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setString(1, email_id);
	stmt.setString(2, password);
	stmt.setString(3, emp_id);
	stmt.execute();
}


public static void adminRejected(Connection conn, String reg_id) throws SQLException {
	String query = "UPDATE registrations SET admin_approval_status='Rejected',approval_date=? where registration_id=?";
	LocalDate currentDate = LocalDate.now();
	Date date = Date.valueOf(currentDate);
	
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setDate(1, date);
	stmt.setString(2, reg_id);
	stmt.executeUpdate();

}





}//ends class
