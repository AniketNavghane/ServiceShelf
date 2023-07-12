<%@page import="java.sql.*" %>

<html>
	<head>
		<title> KC APP </title>
		<style>
			* { font-size:40px; font-family:Simsun; }
			body{ background-color:aqua;}
	
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
			<h1>Student Signup Page</h1>
			<form method="POST">
				<input type="text" name="un" placeholder="Enter Username"/>
				<br/><br/>
				<input type="password" name="pw1" placeholder="Enter Password"/>
				<br/><br/>
				<input type="password" name="pw2" placeholder="Confirm Password"/>
				<br/>
				<p><button name="btn">Register</button></p>
			</form>
			
			<a href="./index.jsp">Already User</a>
			</div>
			<% 
				if(request.getParameter("btn")!=null)
				{
					String un = request.getParameter("un");
					String pw1 = request.getParameter("pw1");
					String pw2 = request.getParameter("pw2");
					if(un.trim().length() == 0)
					{
						out.println("enter valid name");
						return;
					}

					else if(!un.trim().matches("^[a-zA-Z ]*$"))
					{
						out.println("invalid name");	
						return;
					}
					
					else if(un.trim().length() < 2)
					{
						out.println("invalid username");	
						return;
					}


					else if(pw1.trim().length()<5)
					{
						out.println("password should min of 5 characters.");
						out.println("create strong password =>(abc@123)");
						return;
					}


					else if(! pw1.trim().equals(pw2))
					{
						out.println("password did not match");
						return;
					}

					else {
					//check for password complexity
					try
					{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/auth_5jan23";
						Connection con = DriverManager.getConnection(url,"root","abc456");
						String sql = "insert into users values(?,?)";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1,un);
						pst.setString(2,pw1);
						pst.executeUpdate();
						out.println("successfully signup! go to login page ");	
					}
					catch(SQLException er)
					{
						out.println("User Alredy Register" +er);
					} 
					}
				}
			 %>
		</center>
	</body>
</html>