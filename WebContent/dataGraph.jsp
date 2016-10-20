<!doctype html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<html>

<head>
<meta charset="utf-8">
<title>All India Production Graph</title>


<link href="fetchdata.css" rel="stylesheet" type="text/css">

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
<a href="http//www.facebook.com">
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

 
  <%

String table;
							table=request.getParameter("table");
							String unit=new String();
							String rowCount=request.getParameter("count");
						if(Integer.parseInt(rowCount)>10)
							out.print("Data should be at most 10 row ");
				
				

							String column=request.getParameter("column");
							String to=request.getParameter("to");
							String from=request.getParameter("from");
							String y=request.getParameter("to");
							String next=request.getParameter("next");
							String prev=request.getParameter("Prev");
							String str;	
							Integer yy=new Integer(y);
							out.print("<h3>"+new String(new String(table).replaceAll("_"," ")).toUpperCase()+"</h3>");
							str=new String("select "+column+",unit from "+table+" where year between '"+from+"' and '"+to+"'");
						%>
						
						

<%
							
						Connection con;
						Statement st;
						Vector columnName;
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agrodata","root","nitk");
							st=con.createStatement();
							ResultSet result=st.executeQuery(str);
							ResultSetMetaData rm=result.getMetaData();
						columnName=new Vector(5);
						 Vector[] v;
						 v=new Vector[rm.getColumnCount()+1];
						 for(int k=0;k<=rm.getColumnCount();k++)
						 v[k]=new Vector(5);
						 for(int k=2;k<rm.getColumnCount();k++)
						  columnName.addElement(new String("'"+rm.getColumnName(k)+"'"));
						 int count=0;
						 while(result.next()&&count<=10)
						 {count++;
						 v[1].addElement(new String("'"+result.getObject(1)+"'"));
						 from=Integer.toString(result.getInt(1));
						 for(int c=2;c<rm.getColumnCount();c++)
						 v[c].addElement(result.getObject(c));
						 yy=(Integer)result.getObject(1);
						 unit=result.getString(rm.getColumnCount());
						 }
						
			%>
			<form method='get' name='graph' action='dataGraph.jsp' onsubmit='return myf()'style='width:60px'>
<input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= from%>' name='from'>
<input type="hidden" value='<%= to%>' name='to'>
<input type="hidden" value='<%= column%>' name='column'>
<input type="hidden" value='<%=(Integer.parseInt(rowCount)-10)%>' name='count'>
<input type='Submit' name='123' value='Next Page'style='width:100px' >
</form>
		
		<script>
		
		function myf()
		{
		var x = document.forms["graph"]["count"].value;
		if(x<=0)
		{
		var y=document.forms["graph"]["123"];
		y.type=hidden';
		return false;
		}
		
		
		}
		
		</script>
  <canvas id="cvs" width="600" height="300">[No canvas support]</canvas>
    <div style="position: relative; " id="myKey"><h4><font color="red">X-axis : Year</font></h4><h4>Y-axis : <%=unit%></h4></div>


 	
	<script src="RGraph.common.core.js"></script>
<script src="RGraph.line.js"></script>
<script src="RGraph.common.key.js"></script>
<script src="RGraph.common.dynamic.js"></script>
<script src="RGraph.common.tooltips.js"></script>	
	<script>
    window.onload = function ()
    {
        var line = new RGraph.Line({
            id: 'cvs',
            data: [<% for(int c=2;c<rm.getColumnCount();c++){out.print(v[c]);out.print(',');}
			out.print(v[rm.getColumnCount()]);
			%>],
            options: {
                gutterLeft: 100,
                backgroundGridAutofitNumvlines: 10,
                tickmarks: 'filledcircle',
                ticksize: 3,
				unitsPost: '',
				titleXaxis: '',
                titleXaxisY: 250,
                titleYaxis: '<%=unit%>',
                titleYaxisX: 100,
                numxticks: 10,
				labelsAbove: false,
                labelsAboveDecimals: 1,
                labelsAboveSize: 10,
                labels: <%= v[1] %>,
                colors: ['#c00', 'blue','yellow','purple','Olive','Fuchsia ','green','magenta','#9900FF','#990033'],
                linewidth: 2,
				 
                
                shadow: false,
                scaleZerostart: false
			
            }
        }).draw();
		
		document.getElementById('myKey').style.top = line.Get('gutter.top') + 'px';
        
        RGraph.HTML.Key('myKey', {
            'colors': line.Get('colors'),
            'labels': <%= columnName %>,
            'labelCss_0': {'color':'red'}
        });
    };
	

</script>
	<%
	 }
						 catch(Exception ex)
						 {
						out.println(ex);
						 }
						 
						
					
				
						 %>
						 
						</br>
						</br>
						 

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