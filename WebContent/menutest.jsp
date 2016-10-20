<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<html><body>
<form method="get" action="menutest.jsp" >
    <input type="text" name="table" value=""/>
    <input type="submit"/>
</form>

<%                       Connection con;
						ResultSet result;
							ResultSetMetaData rm;
                         int col; 
						Statement st;
							try
							{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agrodata","root","nitk");
							st=con.createStatement();
							String table;
			if((table=request.getParameter("table"))==null)
                        {
                            table="fertiliser";
                        }
							
							
							try{
							result=st.executeQuery("select * from "+table);
							rm=result.getMetaData();
							out.print("<h2>"+table+"</h2>");
							out.print("<h3><table border=0>");
							out.print("<form method='get' action='datatest.jsp'>");
							out.print("<tr><td><h3 align='center' > Year </h3></td><td><select name='year' >");
							out.print("<option value='0' >"+" Select ALL "+"</option>");
							while(result.next())
							out.print("<option value='"+result.getObject(1)+"'>"+result.getObject(1)+"</option>");
							out.print("</select></td></tr>");
		
			
							for(col=2;col<=rm.getColumnCount();col++)
							out.print("<tr><td><h3 align='center'>"+rm.getColumnName(col)+"</h3></td><td align='center'><input type='checkbox' name='"+col+"' value='"+rm.getColumnName(col)+"' checked></td></tr>");
							;
							out.print("<input type='hidden' name='num_of_column' value='"+rm.getColumnCount()+"'>");
							out.println("<tr><td align='center'><input type='submit' value='Go'><input type='hidden' name='table' value='"+table+"'></td></tr></form></table></h3>");
							
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
  	</body>
	</html>