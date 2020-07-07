<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Amado - Furniture Ecommerce Template | Checkout</title>

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
                    <li><a href="index.html">Home</a></li>
                    <li><a href="shop.html">Shop</a></li>
                    <li><a href="product-details.html">Product</a></li>
                    <li><a href="cart.html">Cart</a></li>
                    <li class="active"><a href="checkout.html">Checkout</a></li>
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
        <!-- Header Area End -->

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>Payment</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
    
<%

String cod = request.getParameter("cod");
String card = request.getParameter("card");
String cid = request.getParameter("cid");
int total = 0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
   	if(card != null && card.equals("card")){
		PreparedStatement ps1 = conn.prepareStatement("select name, card_number,to_char(expdate,'dd-mm-yyyy'),cvv from bank where c_id = ?");
	    ps1.setString(1,cid);
	    ResultSet rs1 =ps1.executeQuery();
	    rs1.next();
%>
                                    <div class="col-12 mb-3">
                                        Bank Name:<input type="text" height ="20"  id="first_name" value="<%= rs1.getString(1)%>" >
                                    </div>
                                    <div class="col-12 mb-3">
                                        Card Number:<input type="text"  id="last_name" value="<%= rs1.getString(2)%>"  >
                                    </div>
                                    <div class="col-12 mb-3">
                                        Expiry Date: <input type="text"  id="company" value="<%= rs1.getString(3)%>">
                                    </div>
                                    <div class="col-12 mb-3">
                                        CVV :<input type="text"  id="company" value="<%= rs1.getString(4)%>">
                                    </div>
    <%  
    } 
		PreparedStatement ps = conn.prepareStatement("select c_name,c_age,c_address,c_phone,c_email from customer where c_id = ?");
	    ps.setString(1,cid);
	    ResultSet rs =ps.executeQuery();
	    rs.next();
    %>
                                    <div class="col-12 mb-3">
                                       Your Name: <input type="text"  id="company" value="<%= rs.getString(1)%>">
                                    </div>
                                    <div class="col-12 mb-3">
                                       Age: <input type="text"  id="company" value="<%= rs.getString(2)%>">
                                    </div>
                                    <div class="col-12 mb-3">
                                       Address: <input type="text"  id="company" value="<%= rs.getString(3)%>">
                                    </div> 
                                    <div class="col-12 mb-3">
                                        Phone Number:<input type="text"  id="company" value="<%= rs.getString(4)%>">
                                    </div>
                                    <div class="col-12 mb-3">
                                        Email:<input type="text"  id="company" value="<%= rs.getString(5)%>">
                                    </div> 
								</div>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cart Total</h5>
    <%
    PreparedStatement ps2 = conn.prepareStatement("select p_details.cpp , addtocart.qty ,p_details.p_id from p_details inner join addToCart on p_details.p_id = addToCart.p_id and c_id = ?");
    ps2.setString(1,cid);
    ResultSet rs2 = ps2.executeQuery();

    int subtotal = 0;
  
    String free = "Free";
    while(rs2.next()){
    	//out.println("sub " + subtotal + "cpp " + rs2.getInt(1)+ "qty "+ rs2.getInt(2) );
    	subtotal = subtotal + (rs2.getInt(1) * rs2.getInt(2));
   	
    }
	//out.println("sub " + subtotal + "cpp " + rs2.getInt(1)+ "qty "+ rs2.getInt(2) );
    if (subtotal > 500) {
    	total = subtotal;
    }else{
    	free = "50";
    	total = subtotal + 50;
	}
    %>
                            <ul class="summary-table">
                                <li><span>subtotal:</span> <span><%=subtotal%></span></li>
                                <li><span>delivery:</span> <span><%=free%></span></li>
                                <li><span>total:</span> <span><%= total%></span></li>
                            </ul>
    <%
	}
	catch(Exception e){
   		 out.println(e);
	}
	%>
                            <div class="cart-btn mt-100">
                            <% String placeOrder = "placeOrder.jsp?cid="+cid+"&total="+total; %>
                                <a href="<%= placeOrder %>" class="btn amado-btn w-100">Place Order</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>