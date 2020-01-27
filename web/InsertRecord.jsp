<html>
<head>
<title>Registration</title>
</head>
<body>
<%@ page language = "java" %>
<%@ page import = "java.sql.*" %>
<%@ page session="true"%>
<%

		Connection con=null;
                                   PreparedStatement pstmt=null;
		Class.forName("com.mysql.jdbc.Driver");
		//con=DriverManager.getConnection("com.mysql.jdbc.Driver","","");
                                   con=DriverManager.getConnection("jdbc:derby://localhost:1527/SUYASH","suyash","vandana");
                                   String strollno= request.getParameter("txtrollno");
		String stpassword= request.getParameter("txtpassword");
		String stname= request.getParameter("txtname");
		String stbranch= request.getParameter("ddlbranch");
		String stdob= request.getParameter("ddlbdate")+"/"+request.getParameter("ddlbmonth")+"/"+request.getParameter("ddlbyear");
		String stgender= request.getParameter("rbgender");
		String sqlquery="insert into student (srollno,spassword,sname,sbranch,sdob,sgender)  values (?,?,?,?,?,?)";
                                   
                                   pstmt=con.prepareStatement(sqlquery);
		pstmt.setString(1,strollno);
		pstmt.setString(2,stpassword);
		pstmt.setString(3,stname);
                                    pstmt.setString(4,stbranch);
		pstmt.setString(5,stdob);
		pstmt.setString(6,stgender);
		try
		{
			int i=pstmt.executeUpdate();
			if(i>0)
			{
			    out.println("Record Inserted Successfully");
			}
			else
			{
			    out.println("Error!!!!!!!!!!!!! Try again");
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
<br/>
<br/>
<a href="http://localhost:8080/index.html"> Go Back <<<---------</a>
</body>
</html>