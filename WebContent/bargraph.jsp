<!doctype html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<html>

<head>
<meta charset="utf-8">
<title>production Graph</title>


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
							out.println("<h3>"+new String(table.toUpperCase()).replaceAll("_"," ")+" of "+state+" in year "+year+"</h3>");
							
							String str=new String("select "+column+" from "+table+" where year='"+year+"' and state='"+state+"'");	
	
							Integer yy=new Integer("0");
						Connection con;
						Statement st;
						Vector data=new Vector(3,5);
						Vector label=new Vector(3,5);
						Vector XAxis=new Vector(3,5);
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/statedata","root","nitk");
							st=con.createStatement();
							ResultSet result=st.executeQuery(str);
							ResultSetMetaData rm=result.getMetaData();
						nc=rm.getColumnCount();
									result.next();
									for(int i=3;i<rm.getColumnCount();i++)
									{data.addElement(result.getObject(i));label.addElement(new String("'"+(i-2)+"'"));
									XAxis.addElement(new String("'"+(i-2)+"."+rm.getColumnName(i)+"'").replaceAll("_"," "));
									}
									unit=result.getString(rm.getColumnCount());
									
									
								
							%>
			<script>
    window.onload = function ()
    {
        var data =<%=data%>;

        var bar = new RGraph.Bar({
            id: 'cvs',
            data: data,
            options: {
                backgroundGridAutofitNumvlines: 20,
                gutterBottom: 40,
                gutterLeft: 100,
                unitsPost: '',
                titleXaxis: '<%=table%>',
                titleXaxisY: 390,
                titleYaxis: '<%=unit%>',
                titleYaxisX: 10,
				
                labels: <%= label %>,
                labelsAbove: true,
                labelsAboveDecimals: 1,
                labelsAboveSize: 10,
                noxaxis: true,
				tooltips: !RGraph.ISOLD ? <%= XAxis %> : null
            }
        }).draw();
    };
</script>
		
  <canvas id="cvs" width='<%=50*nc%>' height="500">[No canvas support]</canvas>
    <div style="position: relative; " id="myKey"><h4><font color="red">X-axis :<%=XAxis%></font></h4><h4>Y-axis : <%=unit%></h4></div>

 	
	<script src="RGraph.common.core.js"></script>
<script src="RGraph.bar.js"></script>
<script src="RGraph.common.key.js"></script>	
<script src="RGraph.common.dynamic.js"></script>
<script src="RGraph.common.tooltips.js"></script>	
	
	<%
	 }
						 catch(Exception ex)
						 {
						out.println(ex);
						 }
						 %>
						 
						</br>
						</br>

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