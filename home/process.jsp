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
String ptype = request.getParameter("ptype");
String cid = request.getParameter("cid");

try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
    PreparedStatement ps = conn.prepareStatement("select p_name,cpp,p_id from p_details where p_type = ?");
    ps.setString(1,ptype);
    ResultSet rs =ps.executeQuery();
  String avai = "";
 %>
  <table border="4">
  <thead>
    <tr>
      <th>Name</th><th>Price</th><th>Quantity</th><th>Add to Cart</th><th>Buy Now</th><th>Availability</th>
    </tr>
  </thead>
  <tbody>
  <% while(rs.next()){    
      avai = "Available";
 %>
  <tr>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
    
    <form action="addToCart.jsp" method="post">   
      <td><input type = "number" name="qty" value="1"></td>
      <input type = "text" name="cid" value="<%= cid %>" hidden ="true">
      <input type = "text" name="pid" value="<%=rs.getString(3) %>" hidden="true">
      <td>
        <button type ="submit">Add to Cart</button>
      </td>   
     </form>
  
    
    <td>
      <form action="" method="post">
        <input type = "text" value="<%=rs.getString(3) %>" hidden="true">
        <input type = "text" value="<%= cid %>" hidden ="true">
        <button>Buy Now</button>
      </form>       
    </td><td><%=avai%></td>
  </tr>
 <%     
    }
 %>
 </tbody>
</table>
 <%
}catch(Exception e){
    out.println(e);
}
 
%>
</body>
</html>
