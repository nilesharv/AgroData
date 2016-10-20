<!doctype html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<html>

<head>
<meta charset="utf-8">
<title>State Production </title>


<link href="fetchdatastate.css" rel="stylesheet" type="text/css">

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


  
  
  <table border="0" align="center" width="700">
        <tr>
			<%
                            String table;
							table=request.getParameter("table");
							out.print("<h3>"+new String(new String(table).replaceAll("_"," ")).toUpperCase()+"</h3></br</br></br>");
							int num_of_column=Integer.parseInt(request.getParameter("num_of_column"));
							String year=request.getParameter("year");
							String column=new String("year");
							for(int nc=2;nc<=num_of_column;nc++)
								{
								String temp=request.getParameter(Integer.toString(nc));
								try{
								if(!temp.isEmpty())
								column=column + "," + request.getParameter(Integer.toString(nc));
								}
								catch(NullPointerException ex)
								{
								
								}
								}  
							
							String state=request.getParameter("state");
							String str;		
                    
                            Connection con;
                                                int col; 
						Statement st;
						if(state.equals("0"))
						{
						str=new String("select "+column+" from "+table+" where year="+year);
						}
						else
						str=new String("select "+column+" from "+table+" where state='"+state+"' and year="+year);
						
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							st=con.createStatement();
							ResultSet result=st.executeQuery(str);
							ResultSetMetaData rm=result.getMetaData();
							col=rm.getColumnCount();
	
                                                        for(int i=1;i<=col;i++)
                                                        {                               
			%>
		
                        <th align="center" ><%= new String(rm.getColumnName(i)).replaceAll("_"," ") %></th>

                        <%
                                }
                                    %> </tr><%
                                    while(result.next())
                                    {
                                    %> <tr>    <%
                                        for(int i=1;i<=col;i++)
                                    {
%>
                        
<td align="center"><%= result.getObject(i) %></td> 


                        <%                                        

                                    }
%><td>
<form method='get' action='bargraph.jsp' style='width:60px'><input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= result.getObject(2)%>' name='state'>
<input type="hidden" value='<%= column%>' name='column'>
<input type="hidden" value='<%= result.getObject(1)%>' name='year'>
<input type='submit' style='width:50px' value='Graph'>
</form> </td>    
</tr> <%
                                    }
                                       }catch(Exception ex)
                                        {

                                       }
                        %>
    </tr>
</table>
<div style="position:absolute; left: 20px; top: 195px" >
<!--<form method='get' action='bargraph.jsp'>
<input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= state%>' name='state'>
<input type="hidden" value='<%= column%>' name='column'>
<input type="hidden" value='<%= year%>' name='year'>
<input type='submit' value='Graph'>
</form>
-->

</div>
  
  
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