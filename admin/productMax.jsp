<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product bought maximum</title>
</head>
<body>
<%

try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
  PreparedStatement ps = con.prepareStatement("select p_name from p_details where p_id in(select p_id from sales where total =(select max(total) from sales))");
  ResultSet rs = ps.executeQuery();
  rs.next();  
  out.println(rs.getString(1)); 
}catch(Exception e){
  System.out.println(e);
}
 %>


</body>
</html>