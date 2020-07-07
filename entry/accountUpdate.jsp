<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Account Update</title>
    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %><link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="css/templatemo-style.css"><link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body id="reportsPage">
  <%
	String id = request.getParameter("cid");
  
                try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
                PreparedStatement st = conn.prepareStatement("select c_name, c_id, c_email,c_phone from customer where c_id = ?");
                st.setString(1,id);
                ResultSet rs = st.executeQuery();
                rs.next();   %>
                 
              
                
    <div class="" id="home">
      <nav class="navbar navbar-expand-xl">
        <div class="container h-100">
          <a class="navbar-brand" href="index.html">
            <b class="tm-site-title mb-0">Account Details</b>
          </a>
          <button
            class="navbar-toggler ml-auto mr-0"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <i class="fas fa-bars tm-nav-icon"></i>
          </button>

         </div>
       </nav><div class="container mt-5">
        <div class="row tm-content-row">
          <div class="col-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
              <h2 class="tm-block-title">Type of Account</h2>
              <p class="text-white">Customer Account</p>
             
            </div>
          </div>
        </div>
        <!-- row -->
        <div class="row tm-content-row">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">Change Avatar</h2>
              <div class="tm-avatar-container">
                <img
                  src="img/avatar.png"
                  alt="Avatar"
                  class="tm-avatar img-fluid mb-4"
                />
                <a href="#" class="tm-avatar-delete-link">
                  <i class="far fa-trash-alt tm-product-delete-icon"></i>
                </a>
              </div>
              <button class="btn btn-primary btn-block text-uppercase">
                Upload New Photo
              </button>
            </div>
          </div>
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">Account Settings</h2>
              <form action="accUpdProcess.jsp" class="m-signup-form row">
                <div class="form-group col-lg-6">
                  <label for="name">Name</label>
                  <input
                   value="<%=rs.getString("c_name") %>"
                    id="name"
                    name="name"
                    type="text"
                    class="form-control validate"
                  />
                </div>  
                           
                <div class="form-group col-lg-6">
                  <label for="name">Id</label>
                  <input
                   value="<%=rs.getString("c_id") %>"
                     id="name"
                    name="cid"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">Email</label>
                  <input
                    value="<%=rs.getString("c_email") %>"
                    id="email"
                    name="email"
                    type="email"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="phone">Phone</label>
                  <input
                    value="<%=rs.getString("c_phone") %>"
                    id="phone"
                    name="phone"
                    type="tel"
                    class="form-control validate"
                  />
                </div>
     
                
                <br>
                <br>
                <br>

                <div class="col-12">
                  <button
                    type="submit"
                    name = "delete"
                    value = "delete"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                   Delete Your Profile
                  </button>
                </div> <br>
                <br>
                <br>

                <div class="col-12">
                  <button
                  	name ="update"
                  	value ="update"
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                   Update Your Profile
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>   
      <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
          <p class="text-center text-white mb-0 px-4 small">
            Copyright &copy; <b>2018</b> All rights reserved. 
            
            Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Adhithyan - Adithya - Aswath - Ajay</a>
          </p>
        </div>
      </footer>
    </div>
<% }catch(Exception e){
out.println(e);

} %>
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
     <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script>
      $(function() {
        $("#expire_date").datepicker();
      });
    </script></body>
</html>
