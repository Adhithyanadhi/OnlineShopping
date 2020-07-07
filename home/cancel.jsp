<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Order Cancel </title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %>
</head>
<body>
<%

String oid = request.getParameter("oid");

try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
        PreparedStatement ps = conn.prepareStatement("update o_details set status = ? where o_id = ?");
        ps.setString(1,"2");
        ps.setString(2,oid);
        ps.executeQuery();
        conn.close();  
        out.println("Cancelled Successfully");
    }catch(Exception e){
        out.println(e);
    }
%>
</body>
<script>
history.go(-2);
</script>
</html>
