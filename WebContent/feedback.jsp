<!doctype html>
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
<script>

function validateForm() {
     var x = document.forms["feedback"]["name"].value;
     if (x == null || x == "") {
         alert("Name must be filled out");
         return false;
     }
	 
	 var y=document.forms["feedback"]["email"].value;
     if (y== null || y == "") {
         alert("Email must be filled out");
         return false;
     }
	 var z=document.forms["feedback"]["comments"].value;
     if (z== null || z == "") {
         alert("Comments must be filled out");
         return false;
     }
	 
	  var m=document.forms["feedback"]["email"].value;
     if (m.search("@")==-1||m.search(".")==-1) {
         alert("Enter a valid email id ");
         return false;
     }
	 
 }

 </script>
<div id="form-wrap">
  <form action='feedbacksave.jsp' name='feedback' onsubmit='return validateForm()' method='post'>
     <fieldset>
 <h4>Feedback</h4>
 <label class="labelone" for="name">Name: </label>
  <input name="name"/>
 <label for="email">E-mail: </label>
  <input name="email"/>
  <label for="comments">Comment: </label>
  
  <textarea name="comments" > </textarea>
</fieldset>


<fieldset>
<input class="btn" type="submit" value="Add"/>
<input class="btn" type="reset" value="Reset"/>
</fieldset>

</form>
</div>
<div id="form-wrap">


<h4>Latest comment</h4>
<%

try
{
int count=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agroinformation","root","nitk");
Statement st=con.createStatement();
ResultSet result=st.executeQuery("select name,email,comments from feedback order by insert_time desc");

while(result.next())
{
%>

<h4>By:<%=result.getObject(1)%></h4>
<%=result.getObject(3)%></br>
Email:<%=result.getObject(2)%>,</br></br>
<%
count++;
if(count==5)
break;
 }
 }catch(Exception ex)
 {
 out.print(ex);
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