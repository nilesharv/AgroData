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
							Connection con1;
                            Connection con2;                 int col; 
						Statement st;
						Statement st1;
						
						
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
                            meta=con.getMetaData();
							ResultSet res= meta.getTables(null, null, null,new String[] {"TABLE"});
							out.print("<table align='center'>");
							 while (res.next()) {
							 
							 if(!(new String(res.getString("TABLE_NAME")).matches("state")))
							 {
									
							String table=res.getString("TABLE_NAME");
					
								st=con1.createStatement();
								ResultSet r=st.executeQuery("select * from "+table);
								ResultSetMetaData rm=r.getMetaData();
								for(int i=3;i<rm.getColumnCount();i++)
								{
								
							/*out.print("<form method='get' action='ranklist.jsp'>");
							out.print("<input type='Hidden' name='table' value='"+table+"'>");	
							out.print("<input type='hidden' name='column' value='"+rm.getColumnName(i)+"'>");	
							out.print("<input type='submit' value='rank by "+rm.getColumnName(i)+"'>");	
							
							out.print("<h4>"+table.replaceAll("_"," ")+" "+rm.getColumnName(i)+"</h4></form>");*/
							
							out.print("<tr><td><a href='ranklist.jsp?table="+table+"&column="+rm.getColumnName(i)+"'>Rank of state by "+rm.getColumnName(i)+" "+table.replaceAll("_"," ")+"</a></td></tr>");
								
								
								}
								
					
						

							 }
							 
      }
	  out.print("</table>");
         
      res.close();

      con.close();
  } catch (Exception e) {

      e.printStackTrace();
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