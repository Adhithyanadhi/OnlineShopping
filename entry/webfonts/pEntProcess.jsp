<%@page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@page import = "java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fuking inserting</title>
</head>
<body>
<%

   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");


   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      
      factory.setRepository(new File("c:/adhi"));
   ServletFileUpload upload = new ServletFileUpload(factory);
      
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Write the file
               filePath = "c:/adhi";
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
                  out.println("in if");
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                     out.println("in else");
               }
               fi.write( file ) ;
               out.println("Uploaded Filename: " + filePath + 
               fileName + "<br>");
            }
         }
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } else {
      out.println("Paavani");
   }

String ptype= request.getParameter("ptype");
String pname= request.getParameter("pname");
String pid= request.getParameter("pid");
String cpp= request.getParameter("cpp");
String qty= request.getParameter("qty");

try{
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
   PreparedStatement ps = con.prepareStatement("insert into p_details(p_id,p_name,p_type,cpp,p_quantity) values(?,?,?,?,?)");
   ps.setString(1,pid);
   ps.setString(2,pname);
   ps.setString(3,ptype);
   ps.setString(4,cpp);
   ps.setString(5,qty);
   int i = ps.executeUpdate();
   if(i>0){
      out.println("Yippie Kay yae Mother Fucker");
   }
   else{
      System.out.println("fail");
   }
}catch(Exception e){
   System.out.println(e);
}
 %>


</body>
</html>