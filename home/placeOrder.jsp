<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Order Placed Sucessfully</title>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %>
    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

</head>

<body>
<%
String total = request.getParameter("total");
String cid = request.getParameter("cid");
%>
    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <% 
                      String home = "http://localhost:8080/aish/home/index.jsp?cid="+cid;
                      String cartPage = "http://localhost:8080/aish/home/cartPage.jsp?cid="+cid;
                      String url = "http://localhost:8080/aish/entry/accountUpdate.jsp?cid="+cid;
                      String checkout = "http://localhost:8080/aish/home/checkout.jsp?cid="+cid;
                    %>
                   <li><a href="<%=home%>">Home</a></li>
                    <li><a href="<%=home%>">Shop</a></li>
                    <li><a href="<%=home%>">Product</a></li>
                    <li><a href="<%=cartPage%>">Cart</a></li>
                    <li class="active"><a href="<%= checkout %>">Checkout</a></li>
                    <li><a href="<%=url%>">My Account</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">%Discount%</a>
                <a href="#" class="btn amado-btn active">New this week</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                <a href="cart.html" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(0)</span></a>
                <a href="#" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> Favourite</a>
                <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
    </div>
<%
try{
    %>
    
<h3>Ordered placed Sucessfully</h3>
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
    PreparedStatement ps = conn.prepareStatement("select count(*) from o_details");
    ResultSet rs = ps.executeQuery();
    rs.next();  
    int oid = 700 + rs.getInt(1);
    ps = conn.prepareStatement("insert into o_details values(?,?,?,?,?)");
    ps.setInt(1,oid);
    ps.setString(2,cid);
    ps.setString(3,total);
    ps.setString(4,"31/10/19");
    ps.setString(5,"0");
    ps.executeQuery();

    ps = conn.prepareStatement("select freq from c_points where c_id = ?");
    ps.setString(1, cid);
    rs = ps.executeQuery();
    rs.next();  
    int freq =  rs.getInt(1);

    
    CallableStatement cs = null;
    cs = conn.prepareCall("{call stats(?,?)}");
    cs.setInt(1, freq);
    cs.setString(2,cid);
    cs.executeQuery();
    
    ps = conn.prepareStatement("select p_id,qty from addtocart where c_id = ?");
    ps.setString(1,cid);
    rs = ps.executeQuery();
    while(rs.next()){
        String pid1 = rs.getString(1);
        String qty1 = rs.getString(2);
        ps = conn.prepareStatement("insert into cart values(?,?,?)");
        ps.setInt(1,oid);
        ps.setString(2,pid1);
        ps.setString(3,qty1);
        ps.executeQuery();            
    }
    ps = conn.prepareStatement("delete from addtocart where c_id = ?");
    ps.setString(1,cid);
    ps.executeQuery();

}catch(Exception e){
    out.println(e);
}
      %>

</body>

</html>