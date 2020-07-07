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

String usubmit = request.getParameter("usubmit");
String asubmit = request.getParameter("asubmit");
if(usubmit != null && usubmit.equals("Login")){

String uname = request.getParameter("uname");
String pass = request.getParameter("pass");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
    PreparedStatement ps = conn.prepareStatement("select c_password from customer where c_id = ?");
    ps.setString(1,uname);
    ResultSet rs =ps.executeQuery();
    while(rs.next()){
        String password = rs.getString("c_password");
        if(password.equals(pass)){
        	String redirectURL = "http://localhost:8080/aish/home/index.jsp"+"?cid="+uname;
        	response.sendRedirect(redirectURL);
        }
        else{
        	out.println(password);%>
        	
        	<h1>Invalid Username or Password</h1>
        	<br>
        	<a href="index.html">Click here to go back</a>
        	
        	<%
        }
    }
    conn.close();
}catch(Exception e){
    out.println(e);
}
}
else if(asubmit != null && asubmit.equals("SignIn")){
    String aname = request.getParameter("aname");
    String apass = request.getParameter("apass");
    try{
             if(apass.equals("admin") && aname.equals("admin")){
            	String redirectURL = "http://localhost:8080/aish/admin/index.html";
            	response.sendRedirect(redirectURL);
            } 
            else{
            	%>
            	<h1>Invalid Username or Password</h1>
            	<br>
            	<a href="index.html">Click here to go back</a>
            	
            	<%
            }
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
