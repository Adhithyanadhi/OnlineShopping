<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating product</title>
</head>
<body>
<%
String pname= request.getParameter("pname");
String pid= request.getParameter("pid");
String ptype= request.getParameter("ptype");
String cpp= request.getParameter("cpp");
String stock= request.getParameter("stock");
String exp= request.getParameter("exp");
String brand= request.getParameter("bra	nd");
String color= request.getParameter("color");


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
	PreparedStatement ps = con.prepareStatement("update P_DETAILS set p_name = ?, p_type = ?, cpp = ?, p_quantity = ?,exp = ?, brand = ? , color =? where p_id = ?");
	ps.setString(8,pid);
	ps.setString(1,pname);
	ps.setString(2,ptype);
	ps.setString(3,cpp);
	ps.setString(4,stock);
	ps.setString(5,exp);
	ps.setString(6,brand);
	ps.setString(7,color);
	ps.executeUpdate();
    con.close();  
    String redirectURL = "http://localhost:8080/aish/entry/productUpd.jsp";
    response.sendRedirect(redirectURL);
}catch(Exception e){
	System.out.println(e);
}
 %>


</body>
</html>