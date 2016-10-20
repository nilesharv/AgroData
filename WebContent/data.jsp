<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<html>
<head>
<title> AgroData </title>
</head>
<body>
    
    <table border="0" align="center" width="700">
        <tr>
			<%
                            String table;
							table=request.getParameter("table");
							String column=request.getParameter("column");
							String year=request.getParameter("year");
							String str;		
                    
                            Connection con;
                                                int col; 
						Statement st;
						if(year.equals("0"))
						str=new String("select "+column+" from "+table);
						else
						str=new String("select "+column+" from "+table+" where year="+year);
						
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
<form method='get' action='GraphMaker.jsp'>
<input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= year%>' name='year'>
<input type="hidden" value='<%= column%>' name='column'>
<input type='submit' value='Graph'>
</form>
</body>			

</html>
			
			