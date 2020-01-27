<html>
<head>
<title>Update Record</title>
<script language="JavaScript" type="text/javascript">
    function checkvalidation(theForm) {

        if (theForm.txtrollno.value == "") {
            alert("Please enter a value for the \"Roll No.\" field.");
            theForm.txtrollno.focus();
            return (false);
        }
        if (theForm.txtpassword.value == "") {
            alert("Please enter a value for the \"Password \" field.");
            theForm.txtpassword.focus();
            return (false);
        }
        if (theForm.txtname.value == "") {
            alert("Please enter a value for the \"Student Name\" field.");
            theForm.txtname.focus();
            return (false);
        }

        return (true);
    }
</script>
<style type="text/css">
h1{font-family:arial,comic sans,helvetica;font-size:18pt;font-style:normal;color:blue;BACKGROUND-COLOR:#e6e8fa}
p{font-family:arial,comic sans,helvetica;font-size:12pt;font-style:normal;color:black}
body{background-attachment:fixed}
h2{font-family:arial,comic sans,helvetica;font-size:18pt;font-style:normal;color:blue;BACKGROUND-COLOR:#e6e8fa}
</style>
</head>
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
                                   String strollno= request.getParameter("txtrollno");
		String sqlquery=" select * from student where srollno=?";
                                 
                                   pstmt=con.prepareStatement(sqlquery);
		 pstmt.setString(1,strollno);
		
		try
		{
			rs=pstmt.executeQuery();
		                 if(rs.next())
                                                   {
%>
<form method="post" action="DeleteRecord.jsp" name="Form1" onsubmit="return checkvalidation(this)" >
  <table border="0" cellpadding="0" cellspacing="0"  width="65%" align="center">
   <tr align="center">
      <td width="66%" height="1" colspan="2" > <h1>Delete Recoord</h1></td></tr>
     <tr>
      <td width="33%" height="19"><font color="#0000FF">Roll No.</font></td>
      <td width="33%" height="19"><input type="text" name="txtrollno" size="34"   value="<%= rs.getString(1)%>" readonly="readonly" /></td>
      
    </tr> 
    <tr>
      <td width="33%" height="19"><font color="#0000FF">Password</font></td>
      <td width="33%" height="19"><input type="text" name="txtpassword" size="34" value="<%= rs.getString(2)%>"/></td>
    </tr>
    <tr>
      <td width="33%" height="19"><font color="#0000FF">Student Name</font></td>
      <td width="33%" height="19"><input type="text" name="txtname" size="34" value="<%= rs.getString(3)%>"/></td>
    </tr>
    <tr>
      <td width="33%" height="19"><font color="#0000FF">Branch</font></td>
      <td width="33%" height="19"><input type="text" name="txtbranch" size="34" value="<%= rs.getString(4)%>"/>
      </td>
      </tr>
      <tr>
      <td width="33%" height="19"><font color="#0000FF">Date of Birth (DD/MM/YYYY)</font></td>
      <td width="33%" height="19">
   
      <input type="text" name="txtbdate" size="34" value="<%= rs.getString(5)%>"/></td>
    </tr>
    <tr>
      <td width="33%" height="19"><font color="#0000FF">Gender</font></td>
      <td width="33%" height="19"><input type="text" name="txtgender" size="34" value="<%= rs.getString(6)%>"/></td>
  <% }  else{
                         out.println("No Record Found");
       }
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
    </tr>
    <tr>
      <td width="33%" height="19">&nbsp;</td>
     <td> <input type="submit" value="Delete record" name="submit"/></td>
    </tr>
    <tr>
    <td colspan="2" align="center"><a href="http://localhost:8080/DeleteRecord.htm" > Go Back <<<<<---------</a></td>
    </tr>
  </table>
</form>
</body>
</html>