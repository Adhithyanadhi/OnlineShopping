<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Add new Product</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.DriverManager" %>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
  Product Admin CSS Template
  https://templatemo.com/tm-524-product-admin
  -->
  </head>

  <body>
    <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="index.html">
          <h1 class="tm-site-title mb-0">Update Product</h1>
        </a>
      </div>
    </nav>
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                <form action="productUpdate.jsp" class="tm-edit-product-form" >
                  <div class="form-group mb-3">
                    <label
                      for="name"
                      >Product Name
                    </label>
                    <input
                      id="name"
                      name="pname"
                      type="text"
                      class="form-control validate"
                      required
                    />
                  </div><div class="form-group mb-3">
                    <label
                      for="name"
                      >Product Id
                    </label>
                    <input
                      id="name"
                      name="pid"
                      type="text"
                      class="form-control validate"
                      required
                    />
                  </div>
                  
                  <div class="form-group mb-3">
                    <label
                      for="category"
                      >Category</label
                    >
                    <select name="ptype"  class="custom-select tm-select-accounts" id="category">
                <option>---Select One---</option>
                <%
                
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("select distinct(p_type) from p_details");
                 while(rs.next()){ 
                %>
                <option value="<%=rs.getString("p_type")%>" > <%=rs.getString("p_type")%> </option>
               <%}
                 
               %>
                 </select>
                  </div>
                  <div class="row">
                     
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="stock"
                            >Units In Stock
                          </label>
                          <input
                            id="stock"
                            name="stock"
                            type="text"
                            class="form-control validate"
                            required
                          />
                        </div> <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="stock"
                            >Cost per Unit
                          </label>
                          <input
                            id="stock"
                            name="cpp"
                            type="text"
                            class="form-control validate"
                            required
                          />
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="stock"
                            >Color
                          </label>
                          <input
                            id="stock"
                            name="color"
                            type="text"
                            class="form-control validate"
                            required
                          />
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="stock"
                            >Brand
                          </label>
                          <input
                            id="stock"
                            name="brand"
                            type="text"
                            class="form-control validate"
                            required
                          />
                        </div>
                         <div class="form-group mb-3 col-xs-12 col-sm-12">
                          <label
                            for="expire_date"
                            >Expire Date
                          </label>
                          <input
                            id="expire_date"
                            name="exp"
                            type="text"
                            class="form-control validate"
                            data-large-mode="true"
                          />
                        </div>
                  </div>
                  
              </div>
                       <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                 
                  <img alt="" width="420" height="240" src="">
                  
                </div>
                <div class="custom-file mt-3 mb-3"><input id="fileInput" type="file" style="display:none;" />
                 </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Product</button>
              </div>
            </form>
            </div>
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

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
      $(function() {
        $("#expire_date").datepicker({
            dateFormat: 'd-M-y'
        });
      });
    </script>
  </body>
</html>
