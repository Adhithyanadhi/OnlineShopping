<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profit per Day</title>
</head>
<body>
<%

try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
  PreparedStatement ps = con.prepareStatement("select sum(total) from(select profit.profit*cart.quantity as total from cart inner join profit on profit.p_id=cart.p_id and cart.o_id in(select o_id from o_details where o_date='12-oct-2019'))");
  ResultSet rs = ps.executeQuery();
  rs.next();  
  out.println(rs.getString(1)); 
}catch(Exception e){
  System.out.println(e);
}
 %>


</body>
</html>