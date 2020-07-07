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
    PreparedStatement ps = conn.prepareStatement("select p_details.p_name , p_details.p_id , p_details.cpp , addtocart.qty from p_details inner join addToCart on p_details.p_id = addToCart.p_id and addtocart.c_id = ?");
    ps.setString(1,cid);
    ResultSet rs =ps.executeQuery();
 %>
 	<table border="4">
 	<thead>
 		<tr>
			<th>Name</th><th>Quantity</th><th>Price</th>
 		</tr>
 	</thead>
 	<tbody>
 	 <form action = "payment.jsp" method = "post">
 	 <% while(rs.next()){
 %>

 	<tr>
 		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getInt(3) * rs.getInt(4)%></td>
 	</tr>
	<%   	
    }
 %>		
 	<input type = "text" name="cid" value=<%= cid %> hidden ="true">
	<tr>
		<td ><button type ="submit" name="cod" value="cod">Cash On Delivery</button></td>
		<td colspan="2"><button type = "submit" name="card" value="card">Credit/Debit/ATM card</button></td>
	</tr>
 </form> 
 </tbody>
</table>

 <%
}catch(Exception e){
    out.println(e);
}
%>
</body>
</html>