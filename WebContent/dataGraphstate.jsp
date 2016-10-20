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
      <li><a href="allindia.jsp">Statical Information</a>
         <ul>
             <li><a href="allindia.jsp">All India Data</a></li>
              <li><a href="state.jsp">State's Data</a></li>
               <!--<li><a href="summerized.html">Summerized Data</a></li>-->
         </ul>
      </li>
     <li><a href="feedback.html">Feed Back</a></li>

     <li><a href="reachus.html">Reach Us</a></li>
   </ul><!--closing of main ul list-->
   
</div>

</nav>

<div id="form-wrap" align='center'>


     <fieldset align='center'>
 <h4>Export Import</h4>
  <div id="importexport">

 
  <%

String table;
							table=request.getParameter("table");
							String unit=new String();
							String column=request.getParameter("column");
								int nc;
								String year=request.getParameter("year");
							String y=request.getParameter("state");
							String state=request.getParameter("state");
							String next=request.getParameter("next");
							String prev=request.getParameter("Prev");
							String str;	
							Integer yy=new Integer("0");
						
							if(y.equals("0"))
							str=new String("select "+column+",unit from "+table+" where year="+year);
							else
							str=new String("select "+column+",unit from "+table+" where state='"+state+"' and year="+year);
							
							if(new Boolean(next))
							str="select "+column+",unit from "+table+" where state='"+state+"'";
							
							if(new Boolean(prev))
							str="select "+column+",unit from "+table+" where state="+state+"'";
							out.print(str);
						Connection con;
						Statement st;
						Vector columnName;
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							st=con.createStatement();
							ResultSet result=st.executeQuery(str);
							ResultSetMetaData rm=result.getMetaData();
						columnName=new Vector(5);
						 Vector[] v;
						 nc=rm.getColumnCount()-3;
						 v=new Vector[rm.getColumnCount()+1];
						 for(int k=0;k<=rm.getColumnCount();k++)
						 v[k]=new Vector(5);
						 for(int k=3;k<rm.getColumnCount();k++)
						  columnName.addElement(new String("'"+rm.getColumnName(k)+"'"));
						 int count=0;
						 while(result.next()&&count<=10)
						 {count++;
						 v[1].addElement(new String("'"+result.getObject(1)+"'"));
						 v[2].addElement(new String("'"+result.getObject(2)+"'"));
						 for(int c=3;c<rm.getColumnCount();c++)
						{ v[3].addElement(result.getObject(c));}
						 yy=(Integer)result.getObject(1);
						 unit=result.getString(rm.getColumnCount());
						 }
						
	 
			%>
			<script>
    window.onload = function ()
    {
        var data = <% out.print("[");for(int m=0;m<nc;m++)out.print(m+",");out.print("34]"); %>;

        var bar = new RGraph.Bar({
            id: 'cvs',
            data: data,
            options: {
                backgroundGridAutofitNumvlines: 20,
                gutterBottom: 40,
                gutterLeft: 60,
                unitsPost: 'm',
                titleXaxis: 'krishna sinha',
                titleXaxisY: 390,
                titleYaxis: 'million',
                titleYaxisX: 10,
                labels: <% out.print("[");for(int m=0;m<nc;m++)out.print("'"+m+"',");out.print("'34']"); %>,
                labelsAbove: true,
                labelsAboveDecimals: 1,
                labelsAboveSize: 10,
                noxaxis: true
            }
        }).draw();
    };
</script>
		
  <canvas id="cvs" width=<%= "'"+(nc*100)+"'" %> height="500">[No canvas support]</canvas>
    <div style="position: relative; " id="myKey"><h4><font color="red">X-axis : Year</font></h4><h4>Y-axis : <%=unit%></h4></div>

 	
	<script src="RGraph.common.core.js"></script>
<script src="RGraph.bar.js"></script>
<script src="RGraph.common.key.js"></script>	
	
	<%
	 }
						 catch(Exception ex)
						 {
						out.println(ex);
						 }
						 %>
						 
						</br>
						</br>
						 <form method='get' action='dataGraph.jsp'>
<input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= yy%>' name='year'>
<input type="hidden" value='<%= column%>' name='column'>
<input type="hidden" name='next' value='true'>
<input type='submit' value='Next'>
</form>
<form method='get' action='dataGraph.jsp'>
<input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= y%>' name='year'>
<input type="hidden" value='<%= column%>' name='column'>
<input type="hidden" name='Prev' value='true'>
<input type='submit' value='Reset'>
</form>

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