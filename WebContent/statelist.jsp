<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<html>
<link href="fetchdatastate.css" rel="stylesheet" type="text/css">
<head>
<meta charset="utf-8">
<title>State List</title>

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
			   <li><a href="textualdata.jsp">Summerized Data</a></li>
			   <li><a href="analysis.jsp"> Statistical Analysis</a></li>
               <!--<li><a href="summerized.html">Summerized Data</a></li>-->
         </ul>
      </li>
     <li><a href="feedback.jsp">Feed Back</a></li>

     <li><a href="reachus.html">Reach Us</a></li>
   </ul><!--closing of main ul list-->
   
</div>

</nav>
<div id="form-wrap" align='center'>


     <fieldset align='center'>
  <div id="importexport">

<%
                           
                            Connection con;
                           
							Statement st;
							
						
							
							
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							st=con.createStatement();
							ResultSet result=st.executeQuery("select * from state order by rank" );
							
							ResultSetMetaData rm=result.getMetaData();
							out.print("<h4>State List </h4>");
							out.print("<table><tr>");
			
							for(int i=1;i<=rm.getColumnCount();i++)
							{
							out.print("<td>"+rm.getColumnName(i)+"</td>");
							
							}
							out.print("</tr>");
		
							
							while(result.next())
							{
							out.print("<tr>");
							for(int i=1;i<=rm.getColumnCount();i++)
							{
							out.print("<td>"+result.getObject(i)+"</td>");
							
							}
							out.print("</tr>");
		
							}
							out.print("</table>");
							}catch(Exception ex)
							{
							out.print(ex);
							}
							%>
							</div>
</fieldset>
</form>
</div>


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