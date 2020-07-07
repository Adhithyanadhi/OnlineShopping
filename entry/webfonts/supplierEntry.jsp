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
String sname= request.getParameter("sname");
String cname= request.getParameter("cname");
String sid= request.getParameter("sid");
String ph= request.getParameter("ph");


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
	PreparedStatement ps = con.prepareStatement("insert into S_DETAILS values(?,?,?,?)");
	ps.setString(1,sid);
	ps.setString(2,sname);
	ps.setString(3,ph);
	ps.setString(4,cname);
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