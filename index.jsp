<%@page import="java.sql.*" %>

<html>
	<head>
		<title> KC APP </title>
		<style>
			* { font-size:40px;font-family:Simsun;}
			body{ background-color:aquamarine;}
		
			.container { color:black; width:500px; padding: 50px; 40px; 50px; 40px; border-radius:5px; box-shadow:0 4px; 8px 0; background-color:white;}
			.container button {
					border: none;
  					outline: 0;		
					padding: 12px;
  					color: white;
  					background-color: grey;
  					text-align: center;
  					cursor: pointer;
  					width: 50%;
  					font-size: 30px;
				}
		</style>
	</head>
	<body>
		<center>
			<div class="container">
			<h1>Student Login Page</h1>
			<form method="POST">
				<input type="text" name="un"  placeholder="Enter Username"/>
				<br/><br/>
				<input type="password" name="pw" placeholder="Enter Password"/>
				<br/><br/>
				<input type="submit" value="Login" name="btn"/>
			</form>
			<a href="./Alogin.jsp">Login as Admin</a> |
			<a href="./signup.jsp">New User</a>
			</div>
			<% 
				if(request.getParameter("btn")!=null)
				{
					String un = request.getParameter("un");
					String pw = request.getParameter("pw");
					if(un.trim().length() == 0)
					{
						out.println("enter valid name");
						return;
					}
					else if(pw.trim().length() == 0)
					{
						out.println("enter valid password");
						return;
					}
					else{
						try
						{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/auth_5jan23";
						Connection con = DriverManager.getConnection(url,"root","abc456");
						String sql = "select * from users where username=? and password=?";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1,un);
						pst.setString(2,pw);
						ResultSet rs = pst.executeQuery();
						if(rs.next())
						{
							request.getSession().setAttribute("user",un);
							response.sendRedirect("mainpage.jsp");
						}
						else
						{
							out.println("invalid login");
						}
						
					}
					catch(SQLException e)
					{
						out.println("issue" +e);
					} 
					}
				}
			 %>
		</center>
	</body>
</html>