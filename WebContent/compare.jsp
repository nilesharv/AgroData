<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<!doctype html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<html>

<head>
<meta charset="utf-8">
<title>Import Export</title>


<link href="allindia.css" rel="stylesheet" type="text/css">

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
      <li><a href="allindia.jsp">Statistical Information</a>
         <ul>
             <li><a href="allindia.jsp">All India Data</a></li>
              <li><a href="state.jsp">State's Data</a></li>
			  <li><a href="comparemenue.jsp">State's Data compare</a></li>
			   <li><a href="textualdata.jsp">Summerized Data</a></li>
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


<%                       Connection con;
						ResultSet result;
							ResultSetMetaData rm;
                         int col; 
						 
						String  year=request.getParameter("year");
						
						Statement st;
							try
							{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							st=con.createStatement();
							String table;
			if((table=request.getParameter("table"))==null)
                        {
                            table="state_production";
                        }
							//table=" cultivation_income_statewise";
							
							try{
							result=st.executeQuery("select * from "+table);
							rm=result.getMetaData();
							out.print("<h4>"+new String(table.toUpperCase()).replaceAll("_"," ")+"</h4>");
							out.print("<form action='comparegraph.jsp' method='get'> <table border=0 width='100' >");
							out.print("<input type='hidden' name='table' value='"+table+"'>");
							result=st.executeQuery("select distinct year from "+table+" order by year desc");
							out.print("<tr><td align='left' > year </td><td align='center'><select name='year' >");
				
							while(result.next())
							out.print("<option value='"+result.getObject(1)+"'>"+result.getObject(1)+"</option>");
							out.print("</select></td></tr>");
							
							result=st.executeQuery("select distinct state from "+table);
							
							out.print("<tr><td align='center' ><select name='state1'>");
							while(result.next())
							out.print("<option value='"+result.getObject(1)+"'>"+result.getObject(1)+"</option>");
							out.print("</select></td>");
							
							
							result=st.executeQuery("select distinct state from "+table);
							
							out.print("<td align='center' ><select name='state2' >");
							while(result.next())
							out.print("<option value='"+result.getObject(1)+"'>"+result.getObject(1)+"</option>");
							out.print("</select></td>");
							out.println("</tr><tr><td><input type='submit' value='compare'></td></tr></table></from>");
							}catch(SQLException ex)
							{
							out.println(ex);
							}
							
							
							}
							catch(Exception ex)
							{
							out.println(ex);
							}
							
							
                        %>

 
 


  
<!--<label class="labelone" for="name">Name: </label>
  <input name="name"/>
 <label for="email">E-mail: </label>
  <input name="email"/>
  <label for="comments">Comment: </label>
  
  <textarea name="comments"> </textarea>
</fieldset>



<fieldset>
<input class="btn" type="submit" value="Submit"/>
<input class="btn" type="reset" value="Reset Form"/>
</fieldset>-->
</div>
</fieldset>
</form>
</div>




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