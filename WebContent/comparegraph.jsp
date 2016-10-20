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






 <%
Connection con;
Statement st;
ResultSet state1;
ResultSet state2;
String state[];
state= new String[10];

String unit=new String();
String table=request.getParameter("table");
String year=request.getParameter("year");
state[0]=request.getParameter("state1");	
state[1]=request.getParameter("state2");
state[2]=new String("Gujarat");
state[3]=new String("Haryana");
state[4]=new String("Himachal ");
state[5]=new String("Pradesh");
%>

<h3>Comparison between <%=state[0]%> and <%=state[1]%> in year <%=year%> from table <%=table.replaceAll("_"," ")%></h3>
<%
ResultSetMetaData rm;
//String str=new String("select * from livestock where state='Bihar'");
Vector label= new Vector(5); 
Vector Xaxis= new Vector(5); 
//String column=new String();
Vector[] v;
v =new Vector[20];
Integer column=new Integer(0);
						for(int k=0;k<20;k++)
						 v[k]=new Vector(5);
						
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							st=con.createStatement();
							int size=2;
							for(int j=0;j<size;j++)
							{
							
							state1=st.executeQuery("select * from "+table+" where state='"+state[j]+"' and year='"+year+"'");
							rm=state1.getMetaData();
							column=rm.getColumnCount()-1;
							if(j==0)
							{
							for(int k=3;k<=column;k++)
							Xaxis.addElement(new String("'"+rm.getColumnName(k)+"'"));
							}
							if(state1.next())
							{
							label.addElement(new String("'"+state1.getObject(1)+" "+state1.getObject(2)+"'"));
							
							for(int i=3;i<=column;i++)
							v[j].addElement(state1.getObject(i));
							
							unit=new String(state1.getString(column+1));
									}
									
									}
					
									%>
					





 </br><canvas id="cvs" width="1000" height="300">[No canvas support]</canvas>
    <div style="position: relative; " id="myKey"><h4><font color="red">State :<%=Xaxis%></font></h4><h4>Y-axis:<%=unit%> :</h4></div>





<script src="RGraph.common.core.js"></script>
<script src="RGraph.bar.js"></script>
<script src="RGraph.common.key.js"></script>
<script src="RGraph.common.dynamic.js"></script>
<script src="RGraph.common.tooltips.js"></script>	


<script>
    window.onload = function ()
    {
        // A global on purpose
        bar = new RGraph.Bar({
            id: 'cvs',
            data:[<% for(int i=0;i<size-1;i++)out.print(v[i]+",");out.print(v[size-1]);%>] 	,
            options: {
                labels: <%=label%>,
                colors: ['red','blue','green','yellow','#DEB887','#A52A2A','Cyan','#8B008B','#FF1493'],
                hmargin: 15,
                hmarginGrouped: 3,
                gutterLeft: 100,
				unitsPost: '',
				titleXaxis: '',
                titleXaxisY: 300,
                titleYaxis: '<%=unit%>',
                gutterBottom: 45,
				labelsAbove: true,
                labelsAboveDecimals: 1,
                labelsAboveSize: 10,
                backgroundGridVlines: false,
                backgroundGridBorder: false,
                textSize: 12,
				
                strokestyle: 'rgba(0,0,0,0)',
                shadow: false
            }
        }).draw();
    };
</script>


	<% }
						catch(Exception ex)
						{
						out.println(ex);
						
						}
						
						
					
					
						
			%>
			
			
			
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