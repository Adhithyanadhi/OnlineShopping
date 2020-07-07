<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VIP Customers</title>
</head>
<body>
<%

try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
  PreparedStatement ps = con.prepareStatement("select c_name from customer where c_id in (select c_id from c_status where status='VIP')");
  ResultSet rs = ps.executeQuery();
%>  <table border="4">
    <thead>
      <tr>
        <th>Name</th>
      </tr>
    </thead>
    <tbody> 
<%  while(rs.next()){
%>
      <tr>
        <td><%= rs.getString(1)%></td>
     </tr>
<%}%>
    </tbody>
  </table>
 <%   con.close();  
}catch(Exception e){
  System.out.println(e);
}
 %>


</body>
</html>