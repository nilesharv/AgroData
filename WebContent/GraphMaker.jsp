<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<html>
<head>
<title>Graph</title>
</head>
<body>
 <canvas id="cvs" width="600" height="300">[No canvas support]</canvas>
    <div style="position: absolute; left: 600px; top: 25px" id="myKey"><h4><font color="red">X-axis : Year</font></h4><h4>Y-axis : unit</h4></div>
<%

String table;
							table=request.getParameter("table");
							String column=request.getParameter("column");
							String y=request.getParameter("year");
							String next=request.getParameter("next");
							String prev=request.getParameter("Prev");
							String str;	
							Integer yy=new Integer(y);
							if(y.equals("0"))
							str=new String("select "+column+" from "+table);
							else
							str=new String("select "+column+" from "+table+" where year="+y);
							
							if(new Boolean(next))
							str="select "+column+" from "+table+" where year>="+y;
							
							if(new Boolean(prev))
							str="select "+column+" from "+table+" where year<="+y;
							
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
						 for(int k=2;k<=rm.getColumnCount();k++)
						  columnName.addElement(new String("'"+rm.getColumnName(k)+"'"));
						 int count=0;
						 while(result.next()&&count<=10)
						 {count++;
						 v[1].addElement(new String("'"+result.getObject(1)+"'"));
						 for(int c=2;c<=rm.getColumnCount();c++)
						 v[c].addElement(result.getObject(c));
						 yy=(Integer)result.getObject(1);
						 }
						
	 
			%>
	<script src="RGraph.common.core.js"></script>
<script src="RGraph.line.js"></script>
<script src="RGraph.common.key.js"></script>	
	<script>
    window.onload = function ()
    {
        var line = new RGraph.Line({
            id: 'cvs',
            data: [<% for(int c=2;c<rm.getColumnCount();c++){out.print(v[c]);out.print(',');}
			out.print(v[rm.getColumnCount()]);
			%>],
            options: {
                gutterLeft: 75,
                backgroundGridAutofitNumvlines: 10,
                tickmarks: 'filledcircle',
                ticksize: 3,
                numxticks: 10,
                labels: <%= v[1] %>,
                colors: ['#c00', 'blue','yellow','purple','Olive','Fuchsia ','green','magenta','#9900FF','#990033'],
                linewidth: 2,
                shadow: false,
                scaleZerostart: true
			
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
						 
						
						 <form method='get' action='GraphMaker.jsp'>
<input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= yy%>' name='year'>
<input type="hidden" value='<%= column%>' name='column'>
<input type="hidden" name='next' value='true'>
<input type='submit' value='Next'>
</form>
<form method='get' action='GraphMaker.jsp'>
<input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= y%>' name='year'>
<input type="hidden" value='<%= column%>' name='column'>
<input type="hidden" name='Prev' value='true'>
<input type='submit' value='Reset'>
</form>
	</body>
	</html>