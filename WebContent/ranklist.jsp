<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 


<html>

<head>
<meta charset="utf-8">
<title>Summerized Data</title>


<link href="datagraphstate.css" rel="stylesheet" type="text/css">

<style>
a:link    {color:black; background-color:transparent; text-decoration:none}
a:visited {color:black; background-color:transparent; text-decoration:none}
a:hover   {color:#999; background-color:transparent; text-decoration:underline}
a:active  {color:#999; background-color:transparent; text-decoration:underline}
</style>

</head>
<body bgcolor="#FFFFFF">

<div class="container">
<header>
<figure class="logo">
<img src="agriculture_logo.png" style="width::130" height="100" alt=""> 
</figure>
<div id="socialicons">
<a href="http//facebook.com">
<img src="Facebook_logo-7.png" alt="">
</div>
</a>
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
			<%				DatabaseMetaData meta;

                            Connection con;
							
									Statement st;
					int rank=0;
							String table=request.getParameter("table");                    /*new String("state_production");*/
							String column=request.getParameter("column");    
						String str=new String("select t.state,avg("+column+") as average_"+column+",t.unit,s.area from "+table+" t,state s where t.state=s.state group by state order by average_"+column+" desc");
						//out.print(str);
						
						out.print("<h3>State rank according to "+column+" production </h3>");
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");			
							st=con.createStatement();
							ResultSet result=st.executeQuery(str);
							ResultSetMetaData rm=result.getMetaData();
							out.print("<table border=2 align='center' width='100%'>");
							out.print("<tr><td></td></tr>");
							
						
							out.print("<tr><h4><td>Rank</td><td>"+rm.getColumnName(1)+"</td><td>"+rm.getColumnName(2)+"</td><td>"+rm.getColumnName(3)+"</td><td>"+rm.getColumnName(4)+"(in sqr KM)</td></h4></tr>");
							while(result.next())
							{rank++;
							out.print("<tr><h5><td>"+rank+"</td><td>"+result.getObject(1)+"</td><td> "+result.getObject(2)+" </td><td>"+result.getObject(3)+" </td><td>"+result.getObject(4)+"</td></h5></tr>");
							}
							out.print("</table>");
							}
							catch(Exception ex)
							{
							
							out.print(ex);
							}

                        %>
  </div>
</fieldset>
</form>
</div>




 <br/>
<div id="footer" >
   All copyright reserved
   </div>

</body>
</html>