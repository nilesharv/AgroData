<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 




<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>State Data</title>


<link href="importexport.css" rel="stylesheet" type="text/css">

<style>
a:link    {color:black; background-color:transparent; text-decoration:none}
a:visited {color:black; background-color:transparent; text-decoration:none}
a:hover   {color:#999; background-color:transparent; text-decoration:underline}
a:active  {color:#999; background-color:transparent; text-decoration:underline}
</style>
<script type="text/javascript">
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
function Redirect() {
               window.location="stateimportexport.jsp";
            }

</script>
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

     <fieldset>
  <div id="importexport">

<%                       Connection con;
						ResultSet result;
							ResultSetMetaData rm;
                         int col; 
						 
						String  year=request.getParameter("year");
						try{
								out.print(year.equals("2010"));
								}catch(NullPointerException ex)
								{
								year=new String("no selection");
								}
						Statement st;
							try
							{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							st=con.createStatement();
							String table;
			if((table=request.getParameter("table"))==null)
                        {
                            table="farmer_income";
                        }
							//table=" cultivation_income_statewise";
							
							try{
							result=st.executeQuery("select * from "+table+" order by year desc");
							rm=result.getMetaData();
							out.print("<form method=get action='fetchdatastate.jsp'>");
							out.print("<h4>"+new String(table.toUpperCase()).replaceAll("_"," ")+"</h4>");
							out.print("<form action='#'> <table border=0 width='100' >");
							
							result=st.executeQuery("select distinct year from "+table+" order by year desc");
							out.print("<tr><td align='left' > year </td><td align='center'><select name='year' >");
				
							while(result.next())
							out.print("<option value='"+result.getObject(1)+"'>"+result.getObject(1)+"</option>");
							out.print("</select></td></tr>");
							
							result=st.executeQuery("select distinct state from "+table);
							
							out.print("<tr><td align='left' > state </td><td align='center'><select name='state' >");
							out.print("<option value='0' >"+" Select ALL "+"</option>");
							while(result.next())
							out.print("<option value='"+result.getObject(1)+"'>"+result.getObject(1)+"</option>");
							out.print("</select></td></tr>");
							result=st.executeQuery("select * from "+table);
							out.print("<tr><td align='left'></td><td align='center'><input type='hidden' name='2' value='"+rm.getColumnName(2)+"' checked></td></tr>");;
							
							for(col=3;col<rm.getColumnCount();col++)
							out.print("<tr><td align='left'>"+new String(rm.getColumnName(col)).replaceAll("_"," ")+"</td><td align='center'><input type='checkbox' name='"+col+"' value='"+rm.getColumnName(col)+"' checked></td></tr>");;
							out.print("<input type='hidden' name='"+col+"' value='"+rm.getColumnName(col)+"'>");
	
							out.print("<input type='hidden' name='num_of_column' value='"+rm.getColumnCount()+"'>");
							out.println("<tr><td align='center' colspane='2'><input type='hidden' name='table' value='"+table+"'><input type='submit' value='See Data'style='width:100px' align='center'></td></tr></table></form>");
							
							result.beforeFirst();
							
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