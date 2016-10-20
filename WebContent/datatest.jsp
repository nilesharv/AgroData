<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<html>
<head>
<title> AgroData </title>
</head>
<body>

</br>
</br>
    <table border="0" align="left" width="700">
        <tr>
			<%
                            String table;
							table=request.getParameter("table");
							int num_of_column=Integer.parseInt(request.getParameter("num_of_column"));
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
<div style="position: absolute; left: 50px; top: 10px" >
<form method='get' action='GraphMaker.jsp'>
<input type="hidden" value='<%= table%>' name='table'>
<input type="hidden" value='<%= year%>' name='year'>
<input type="hidden" value='<%= column%>' name='column'>
<input type='submit' value='Graph'>
</form>
</div>
</body>			

</html>
			
			