 <%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Maximum profit</title>
</head>
<body>
<%

try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
  PreparedStatement ps = con.prepareStatement(" select distinct(p_type) from type_profit where  profit in(select  max(p) from (select p_type, sum(profit) as p from type_profit group by p_type ))");
  ResultSet rs = ps.executeQuery();
  rs.next();  
  out.println(rs.getString(1)); 
}catch(Exception e){
  System.out.println(e);
}
 %>


</body>
</html>