<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding new product</title>
</head>
<body>
<%
String pname= request.getParameter("pname");
String ptype= request.getParameter("ptype");
String cpp= request.getParameter("cpp");
String stock= request.getParameter("stock");
String exp= request.getParameter("exp");
String brand= request.getParameter("brand");
String color= request.getParameter("color");
String sid= request.getParameter("sid");
String sprice= request.getParameter("sprice");

out.println(pname);
out.println(ptype);
out.println(cpp);
out.println(stock);
out.println(exp);
out.println(brand);
out.println(color);
out.println(sid);
out.println(sprice);


try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
    PreparedStatement ps = con.prepareStatement("select count(*) from p_details");
    ResultSet rs = ps.executeQuery();
    rs.next();  
    int pid = 400 + rs.getInt(1);
    ps = con.prepareStatement("insert into p_DETAILS values(?,?,?,?,?,?,?,?)");
    ps.setInt(1,pid);
    ps.setString(2,pname);
    ps.setString(3,ptype);
    ps.setString(4,cpp);
    ps.setString(5,stock);
    ps.setString(6,color);
    ps.setString(7,brand);
    ps.setString(8,exp);
    ps.executeUpdate();
    ps = con.prepareStatement("insert into suppliers values(?,?,?,?)");
    ps.setString(1,sid);
    ps.setInt(2,pid);
    ps.setString(3,sprice);
    ps.setString(4,stock);
    ps.executeUpdate();
    con.close();  
        String redirectURL = "http://localhost:8080/aish/entry/productEntry.jsp";
        response.sendRedirect(redirectURL);
}catch(Exception e){
    System.out.println(e);
}
 %>


</body>
</html>