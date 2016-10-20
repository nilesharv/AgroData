<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<html>
<head>
</head>

<body>

<form method='post' action='self.jsp'>
<form method='post' action='self.jsp'>
<input type='text' name='k1'>
<input type='submit'>
</from>
<input type="text" name="k2" onclick="Document.getElementByName('k2')=Document.getElementByName('k1')">
<input type='submit'>
</form>

<%
String str=request.getParameter("k2");
out.println(str+"hi");
%>

</body>
</html>