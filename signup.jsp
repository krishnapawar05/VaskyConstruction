
<%@page import="java.sql.*"%>
<%
  String s1, s2, s3, s4;
  s1 = request.getParameter("t1");
  s2 = request.getParameter("t2");
  s3 = request.getParameter("t3");
  s4 = request.getParameter("t4");
  Connection con;
  Statement stmt;
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cost_estimation", "root", "root");
    stmt = con.createStatement();

    // Check if the user with the provided username (s1) already exists
    ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE username='" + s1 + "'");
    if (rs.next()) {
      // User already exists, show an alert and redirect back to the registration page
%>
      <script>
        alert("Account already exists. Please choose a different username.");
        window.location.href = "signup.html"; // Replace with the actual registration page
      </script>
<%
    } else {
      // User does not exist, proceed with the registration
      int k = stmt.executeUpdate("INSERT INTO user VALUES('" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "')");
      con.close();
      response.sendRedirect("login.html");
    }
  } catch (Exception e) {
    out.println(e);
  }
%> 
