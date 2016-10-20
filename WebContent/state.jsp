<!doctype html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<html>

<head>
<meta charset="utf-8">
<title>All India</title>


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
<div id="form-wrap">


  <form>
     <fieldset>
 <h4>STATE VISE DATA</h4>
  <div id="allindialist">
  <a href="statelist.jsp" target="_self">State List!</a> </br>
			<%				DatabaseMetaData meta;

                            Connection con;
                                                int col; 
						Statement st;
						
						
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
                            meta=con.getMetaData();
							ResultSet res= meta.getTables(null, null, null,new String[] {"TABLE"});
							 while (res.next()) {
							 
							if(!(new String(res.getString("TABLE_NAME")).matches("state")))
							 {
								 
									
							%>
							
							 
							 
							 
			<a href="statedata.jsp?table=<%=res.getString("TABLE_NAME")%>" target="_self"><%=new String(new String(res.getString("TABLE_NAME")).replaceAll("_"," ")).toUpperCase()%>!</a> </br>
							 
							 
							 
							 <%
							 }
         //out.println(res.getString("TABLE_NAME")+"</br>"); 
      }
      res.close();

      con.close();
  } catch (Exception e) {
      e.printStackTrace();
    }

                        %>
  
  <a href="allindia.jsp" target="_self">Jump to All India Data!</a> </br>

	
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
</form>
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