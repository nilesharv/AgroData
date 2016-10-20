<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<html>
<head>
<title> AgroData </title>
</head>
<body>

    <table border="2" align="center" width="700">
        <tr>
			<%				DatabaseMetaData meta;

                            Connection con;
                                                int col; 
						Statement st;
						
						
							try
						{
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agrodata","root","nitk");
                            meta=con.getMetaData();
							ResultSet res= meta.getTables(null, null, null,new String[] {"TABLE"});
							 while (res.next()) {
							 %>
							
							 
							 
							 
			<a href="menuallindia.jsp?table=<%=res.getString("TABLE_NAME")%>" target="_self"><%=res.getString("TABLE_NAME")%>!</a> </br>
							 
							 
							 
							 <%
							 
         //out.println(res.getString("TABLE_NAME")+"</br>"); 
      }
      res.close();

      con.close();
  } catch (Exception e) {
      e.printStackTrace();
    }

                        %>
    </tr>
</table>
</body>			

</html>
			
			