<%@page import="java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Today s customer</title>
</head>
<body>
<%

try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
  PreparedStatement ps = con.prepareStatement("select distinct(c_name) from customer inner join o_details on customer.c_id = o_details.c_id and o_date = '12-OCT-19'");
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