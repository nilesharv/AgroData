<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<html>
<head>
<title>hi this krishna sinha</title>
</head>
<body>
<canvas id="cvs" width="2500" height="500">
    [No canvas support]
</canvas>
<%

String table;
							table=request.getParameter("table");
							String column=request.getParameter("column");
							String y=request.getParameter("year");
							String str;	
							if(y.equals("0"))
							str=new String("select "+column+" from "+table);
							else
							str=new String("select "+column+" from "+table+" where year="+y+" limit 10");
					
						Connection con;
						Statement st;
						Vector year;
						Vector gdp;
						Vector gdp2;
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agrodata","root","nitk");
							st=con.createStatement();
							ResultSet result=st.executeQuery(str);
							ResultSetMetaData rm=result.getMetaData();
						 year=new Vector(2,5);
						 gdp=new Vector(5);
						 gdp2=new Vector(5);
						 Vector[] v;
						 v=new Vector[rm.getColumnCount()+1];
						 for(int k=0;k<=rm.getColumnCount();k++)
						 v[k]=new Vector(5);
						 while(result.next())
						 {
						 v[1].addElement(new String("'"+result.getObject(1)+"'"));
						 for(int c=2;c<=rm.getColumnCount();c++)
						 v[c].addElement(result.getObject(c));
						 }
						
	 
			%>
	<script src="RGraph.common.core.js"></script>
<script src="RGraph.line.js"></script>
	
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
                backgroundGridAutofitNumvlines: 6,
                tickmarks: 'filledcircle',
                ticksize: 5,
                numxticks: 6,
                labels: <%= v[1] %>,
                colors: ['#c00', 'blue','yellow','black','green'],
                linewidth: 2,
                shadow: false,
                scaleZerostart: true
            }
        }).draw();
    };
</script>
	<%
	 }
						 catch(Exception ex)
						 {
						out.println(ex);
						 }
						 %>
	</body>
	</html>