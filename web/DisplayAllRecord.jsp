<html>
<head>
<title> </title>
</head>
<style>
h1{font-family:arial,comic sans,helvetica;font-size:18pt;font-style:bold;color:blue;BACKGROUND-COLOR:#e6e8fa}
p{font-family:arial,comic sans,helvetica;font-size:12pt;font-style:normal;color:black}
body{background-attachment:fixed}
</style>
<body>
<%@ page language = "java" %>
<%@ page import = "java.sql.*" %>
<%@ page session="true"%>
<%

		Connection con=null;
                                   PreparedStatement pstmt=null;
                                   ResultSet rs=null;
		Class.forName("com.mysql.jdbc.Driver");
		//con=DriverManager.getConnection("jdbc:odbc:adsn","","");
                                   con=DriverManager.getConnection("jdbc:derby://localhost:1527/SUYASH","suyash","vandana");
               
		String sqlquery=" select * from student order by srollno";
                                   
                                   pstmt=con.prepareStatement(sqlquery);
		
		
		try
		{
			rs=pstmt.executeQuery();
		
%>
<table style="border-style: none; border-color: inherit; border-width: 1; background-color:Orange;height: 22px; width: 967px;">
<tr align="center">
<td> <a href="index.html">Registration</a></td>
<td> <a href="DisplayAllRecord.jsp">Display All Record</a> </td>
<td> <a href="SearchRecord.htm">Search Record</a></td>
<td> <a href="UpdateRecord.htm">Update Record</a></td>
<td> <a href="DeleteRecord.htm">Delete Record</a></td>
</tr>
</table>
<form name="Form1" action="">
  <table border="1" cellpadding="0" cellspacing="0"  width="65%" align="center">
   <tr>
        <td width="60%" height="1" colspan="6"> <h2 align="center">Display Student Record</h2>
        </td>
    </tr>
    <tr>
       <th width="12%">Student Roll No</th>
    <th width="12%">Password</th>
    <th width="12%">Student Name</th>
    <th width="12%">Student Branch</th>
    <th width="12%">Student Date of Birth</th>
    <th width="12%">Student Gender</th>
    </tr>
  <% while (rs.next()){ %>
  <tr>
    <td width="12%"><%= rs.getString(1)%></td>
    <td width="12%"><%= rs.getString(2)%></td>
    <td width="12%"><%= rs.getString(3)%></td>
    <td width="12%"><%= rs.getString(4)%></td>
    <td width="12%"><%= rs.getString(5)%></td>
   <td width="12%"><%= rs.getString(6)%></td>
  </tr>
  <% } 
                                  }
		catch(Exception e)
		{
			out.println("Problem"+e);
		}
                                  finally
		{
			pstmt.close();
			con.close();

		}
%>
</table> 
</form>
</body>
</html>