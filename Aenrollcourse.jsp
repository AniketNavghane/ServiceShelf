<%@page import="java.sql.*" %>


		<%

					if(request.getParameter("n")!=null)
					{
						String name = request.getParameter("n");
					try
					{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/ec_16jan23";
						Connection con = DriverManager.getConnection(url,"root","abc456");
						String sql = "delete from enrolc where name=?";
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
	<head>
		<title> KC APP </title>
		<style>
			 * { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
			body {background-color:rgb(155,142,162);width:100%;height:100vh;}
			.nav { background-color:black; }
			.nav a{ color:white; text-decoration:none; margin:2%; }
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

			<h1>Student enroll course data</h1>
			<table border="3" style="width:50%;">
				<tr>
					<th>Name</th>
					<th>College name</th>
					<th>Phone no</th>
					<th>Emai id</th>
					<th>course enroll</th>
				</tr>
				
				<%
					try
					{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/ec_16jan23";
						Connection con = DriverManager.getConnection(url,"root","abc456");
						String sql = "select * from enrolc";
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next())
						{
							String name = rs.getString(1);
							String college = rs.getString(2);
							String phone = rs.getString(3);
							String email = rs.getString(4);
							String choice = rs.getString(5);
							
				%>
						<tr style="text-align:center;">
							<td><%=name %></td>
							<td><%=college %></td>
							<td><%=phone %></td>
							<td><%=email %></td>
							<td><%=choice %></td>
							<td><a href="?n=<%=name %>" onclick="return confirm('Sure?')" >Delete</a></td>
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