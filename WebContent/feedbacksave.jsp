<! doctype html >

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<html>

<head>
<meta charset="utf-8">
<title>Feedback</title>

<link href="feedback.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFFF">

<div class="container">
<header>
<figure class="logo">
<img src="agriculture_logo.png" style="width::130" height="100" alt=""> 
</figure>
<div id="socialicons">

<img src="Facebook_logo-7.png" alt="">
</div>

</header>

<!--
<div id="banner">
<img src="8.jpg" style="width:100%" height="200"/>
</div> <!--end of banner--> 
</div>
 <nav>

    <div id="menu">
   <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="about%20us.html">About Us</a></li>
      <li><a href="allindia.jsp"> Statistical Information</a>
         <ul>
             <li><a href="allindia.jsp">All India Data</a></li>
              <li><a href="state.jsp">State's Data</a></li>
			  <li><a href="comparemenue.jsp">State's Data compare</a></li>
			   <li><a href="textualdata.jsp">Summarized Data</a></li>
               <!--<li><a href="summerized.html">Summarized  Data</a></li>-->
         </ul>
      </li>
     <li><a href="feedback.jsp">Feed Back</a></li>

     <li><a href="reachus.html">Reach Us</a></li>
   </ul><!--closing of main ul list-->
   
</div>

</nav>

<div id="form-wrap">
 <%				DatabaseMetaData meta;

 String email=request.getParameter("email");
 String name=request.getParameter("name");
 String comment=request.getParameter("comments");
 
 String str=new String("insert into feedback values(now(),'"+name+"','"+email+"','"+comment+"')");
                            Connection con;
                                                int col; 
						Statement st;
						
						
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agroinformation","root","nitk");
                            st=con.createStatement();
							st.execute(str);
				%>
				<h3>Thanks for  your valuable feedback </h3> 
				
				<%
									
      con.close();
  } catch (Exception e) {
  out.print(e);
      e.printStackTrace();
    }
	
	%>
</div>




<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
 <br/>
 <br/>
 <br/>
<div id="footer" >
   All copyright reserved
   </div>

</body>
</html>