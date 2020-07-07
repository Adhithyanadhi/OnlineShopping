<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fuking inserting</title>
</head>
<body>
<%
String name= request.getParameter("name");
String email= request.getParameter("email");
String phone= request.getParameter("phone");
String sid = "s500";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
	PreparedStatement ps = con.prepareStatement("insert into CUSTOMER(c_id,c_name,c_address,c_phone) values(?,?,?,?)");
	ps.setString(1,sid);
	ps.setString(2,name);
	ps.setString(3,email);
	ps.setString(4,phone);
	int i = ps.executeUpdate();
	if(i>0){
		out.println("Yippie Kay yae Mother Fucker");
	}
	else{
		System.out.println("fail");
	}
}catch(Exception e){
	System.out.println(e);
}
 %>


</body>
</html>