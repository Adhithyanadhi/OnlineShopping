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
String ptype= request.getParameter("ptype");
String pname= request.getParameter("pname");
String pid= request.getParameter("pid");
String cpp= request.getParameter("cpp");
String qty= request.getParameter("qty");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
	PreparedStatement ps = con.prepareStatement("update p_details set p_name = ?, p_type = ?, cpp = ?, p_quantity = ? where p_id = ?");
	ps.setString(5,pid);
	ps.setString(1,pname);
	ps.setString(2,ptype);
	ps.setString(3,cpp);
	ps.setString(4,qty);
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