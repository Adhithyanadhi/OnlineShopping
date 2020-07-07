<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %>
</head>
<body>
<%
String cid = request.getParameter("cid");


try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
    PreparedStatement ps = conn.prepareStatement("select p_name from p_details where p_id in(select p_id from cart where o_id in(select o_id from o_details where c_id = ? and status = ?))");
    ps.setString(1,cid);
    ps.setString(2,"0");
    ResultSet rs =ps.executeQuery();
 %>
  <table border="4">
  <thead>
    <tr>
      <th>Name</th>
    </tr>
  </thead>
  <tbody>
   <form action = "cancel.jsp" method = "post">
   <% while(rs.next()){
 %>

  <tr>
    <td><%=rs.getString(1)%></td>
  </tr>
  <%    
    }
 ps = conn.prepareStatement("select o_id from o_details where c_id = ?");
    ps.setString(1,cid);
   rs =ps.executeQuery();
   rs.next();
   String oid = rs.getString(1);
    %>   
  <input type = "text" name="oid" value=<%= oid %> hidden ="true">
  <tr>
    <td colspan="4" ><button type ="submit" name="cancel" value="cod">Cancel</button></td>
  </tr>
 </form> 
 </tbody>
</table>

 <%
}catch(Exception e){
    out.println("No Entries Found");
}
%>
</body>
</html>