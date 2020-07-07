<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserting</title>
</head>
<body>
<%
String name= request.getParameter("name");
String email= request.getParameter("email");
String phone= request.getParameter("phone");
String pass = request.getParameter("pass");
String age = request.getParameter("age");
String bname = request.getParameter("bname");
String cnumber = request.getParameter("cnumber");
String exp = request.getParameter("exp");
String cvv = request.getParameter("cvv");
String address = request.getParameter("address");


try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
  PreparedStatement ps = con.prepareStatement("select count(*) from customer");
  ResultSet rs = ps.executeQuery();
  rs.next();  
  int sid = 100 + rs.getInt(1);
  ps = con.prepareStatement("insert into CUSTOMER(c_name,c_email,c_phone,c_password,c_id,c_age,c_address) values(?,?,?,?,?,?,?)");
  ps.setString(1,name);
  ps.setString(2,email);
  ps.setString(3,phone);
  ps.setString(4,pass);
  ps.setInt(5,sid);
  ps.setString(6,age);
  ps.setString(7,address);
  ps.executeUpdate();

  ps = con.prepareStatement("insert into bank(c_id,name,card_number,expdate,cvv) values(?,?,?,?,?)");

  ps.setInt(1,sid);
  ps.setString(2,bname);
  ps.setString(3,cnumber);
  ps.setString(4,exp);
  ps.setString(5,cvv);
  ps.executeUpdate();

  String redirectURL = "http://localhost:8080/aish/home/index.jsp?cid="+sid;
  response.sendRedirect(redirectURL);
      
  
}catch(Exception e){
  System.out.println(e);
}
 %>


</body>
</html>