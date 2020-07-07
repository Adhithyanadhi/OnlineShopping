<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %>
</head>
<body>
<%

String upd = request.getParameter("update");
String del = request.getParameter("delete");
String id = request.getParameter("cid");

if(upd != null && upd.equals("update")){

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
        PreparedStatement ps = conn.prepareStatement("update customer set c_name = ?,c_email = ?, c_phone = ? where c_id = ?");
        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,phone);
        ps.setString(4,id);
        ps.executeQuery();
        conn.close();  
        String redirectURL = "http://localhost:8080/aish/entry/accountUpdate.jsp?cid="+id;
    	response.sendRedirect(redirectURL);
    }catch(Exception e){
        out.println(e);
    }
}
else if(del != null && del.equals("delete")){
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
        PreparedStatement ps = conn.prepareStatement("Delete from c_status where c_id = ?");
        ps.setString(1,id);
        ps.executeQuery();
        ps = conn.prepareStatement("Delete from c_points where c_id = ?");
        ps.setString(1,id);
        ps.executeQuery();
        ps = conn.prepareStatement("Delete from customer where c_id = ?");
        ps.setString(1,id);
        ps.executeQuery();
        conn.close();
        String redirectURL = "http://localhost:8080/aish/Login/index.html";
    	response.sendRedirect(redirectURL);
      
    }
    catch(Exception e){
        out.println(e);
    }
        
}else{
    out.println("Press a Button");
}
%>
</body>
</html>
