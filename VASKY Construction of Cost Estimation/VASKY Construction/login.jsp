<%@page  import="java.sql.*"%>
<%

String s1= request.getParameter("t1");
String s2= request.getParameter("t2");
  Connection con;
  Statement stmt;
  try
  { 
     Class.forName("com.mysql.cj.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cost_estimation","root","root");
     stmt=con.createStatement();
     ResultSet rs=stmt.executeQuery("Select * from user where username='"+s1+"' and Password='"+s2+"'");
     if(rs.next())
    {
       response.sendRedirect("index.html");
    }
    else 
    {
        response.sendRedirect("signup.html");
    }
  }
  catch(Exception e)
  {
  out.println(e);
  } 
%>