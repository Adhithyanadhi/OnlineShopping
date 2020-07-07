<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Page</title>
</head>
<body>
<%
String cid= request.getParameter("cid");
String pid= request.getParameter("pid");
String qty= request.getParameter("qty");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
	PreparedStatement ps = con.prepareStatement("insert into addToCart(c_id,p_id,qty) values(?,?,?)");
	ps.setString(1, cid);
	ps.setString(2, pid);
	ps.setString(3, qty);
	ps.executeQuery();
	   	
	
}catch(Exception e){
	System.out.println(e);
}
 %>

</body>
<script>
history.go(-1);
</script>
</html>