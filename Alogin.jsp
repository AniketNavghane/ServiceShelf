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
			<h1> Admin Login Page</h1>
			<form method="POST">
				<input type="text" name="un" placeholder="Enter Admin Username"/>
				<br/><br/>
				<input type="password" name="pw" placeholder="Enter Admin Password"/>
				<br/><br/>
				<input type="submit" value="Login" name="btn"/>
			</form>
			<a href="./index.jsp">For Students Login</a>
			</div>
			<% 
				String username = "Admin";
				String password = "Admin@123";

				if(request.getParameter("btn")!=null)
				{
					String un = request.getParameter("un");
					String pw = request.getParameter("pw");
					
					if(un.equals(username) && pw.equals(password))
					{	
						request.getSession().setAttribute("user",un);
						response.sendRedirect("Amainpage.jsp");
					}
					else
					{
						out.println("try only if you have Admin username and password");
					}
				}
			 %>
		</center>
	</body>
</html>