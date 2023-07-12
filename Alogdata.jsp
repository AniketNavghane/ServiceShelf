<%@page import="java.sql.*" %>

		<%

					if(request.getParameter("n")!=null)
					{
						String name = request.getParameter("n");
					try
					{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/auth_5jan23";
						Connection con = DriverManager.getConnection(url,"root","abc456");
						String sql = "delete from users where username=?";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1, name);
						pst.executeUpdate();
						con.close();
					}
					catch(SQLException er)
					{
						out.println("isuue" +er);
					}
					}
		%>
<html>
<head><title>kc class</title>
<style>
* { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
			.nav { background-color:black; }
			.nav a{ color:white; text-decoration:none; margin:2%; }
			body{ background-color:burlywood; }
</style>
</head>
<body>
<center>
			<div class="nav ml-auto">
				<a href="Amainpage.jsp">Home</a>
				<a href="Aaddmconf.jsp">AddmissionData</a>
				<a href="Alogdata.jsp">STLD</a>
				<a href="Aenrollcourse.jsp">EnrollCourse</a>
				<a href="Aquery.jsp">Query</a>
				<a href="Afeedback.jsp">feedback</a>
				<a href="Ahome.jsp">Profile</a>
			</div>
			<br/>

			<h1>Student Login data</h1>
			<table border="3" style="width:50%;">
				<tr>
					<th>Name</th>
					<th>Password</th>
				</tr>
				
				<%
					try
					{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/auth_5jan23";
						Connection con = DriverManager.getConnection(url,"root","abc456");
						String sql = "select * from users";
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next())
						{
							String un = rs.getString(1);
							String pw1 = rs.getString(2);
							
				%>
						<tr style="text-align:center;">
							<td><%=un %></td>
							<td><%=pw1 %></td>
							<td><a href="?n=<%=un %>" onclick="return confirm('Sure?')" >Delete</a></td>
						</tr>
				<%
						
						}
					}
					catch(SQLException er)
					{
						out.println("isuue" +er);
					}
				%>
	</center>
</body>
</html>