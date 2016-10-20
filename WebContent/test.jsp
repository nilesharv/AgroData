<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<html>
<head>
<title> AgroData </title>
</head>
<body>
    
<form method="post" action="data.jsp" >
    <input type="text" name="table"/>
    <input type="submit"/>
</form>
    
    <table border="2" align="center" width="700">
        <tr>
			<%
			String table=request.getParameter("table");
                        if(table.isEmpty())
                          table.concat("state");
                        
                            Connection con;
                                                int col; 
						Statement st;
						Vector v;
						Vector state;
						String str=new String("select * from "+table);
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agrodata","root","nitk");
							st=con.createStatement();
							ResultSet result=st.executeQuery(str);
							ResultSetMetaData rm=result.getMetaData();
							col=rm.getColumnCount();
	
                                                        for(int i=1;i<=col;i++)
                                                        {                               
			%>
		
                        <th align="center" ><%=rm.getColumnName(i) %></th>

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
%></tr> <%
                                    }
                                       }catch(Exception ex)
                                        {

                                       }
                        %>
    </tr>
</table>
</body>			

</html>
			
			