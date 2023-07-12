<html>
	<head>
		<title> KC APP </title>
		<style> * { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
			.nav { background-color:black; }
			.nav a{ color:white; text-decoration:none; margin:2%; }
			body{ background-color:darkcyan;}
			
			.container { color:black; width:550px; padding: 50px; 40px; 50px; 40px; border-radius:5px; box-shadow:0 4px; 8px 0; background-color:white;}
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

				<div class="nav" >
				
				<a href="mainpage.jsp">Home</a>
				<a href="addmconf.jsp">AddmissionForm</a>
				<a href="course.jsp">Courses</a>
				<a href="enrollcourse.jsp">EnrollCourse</a>
				<a href="query.jsp">Query</a>
				<a href="feedback.jsp">feedback</a>
				<a href="home.jsp">Profile</a>
			</div>
			<br/>

			<div class="container">
			<h1>Profile</h1><br/>
			<%
				if(session.getAttribute("user")!=null)
				{
					String user = (String)session.getAttribute("user");
					out.println("Welcome " +user);
				}
				else
				{
					response.sendRedirect("index.jsp");
				}
			%>
			<form method="POST">
				<br/><br/>
				<p><button name="btn">Logout</button></p>				
			</form>

			<%
				if(request.getParameter("btn")!=null)
				{
					request.getSession().invalidate();
					response.sendRedirect("index.jsp");
				}
			%>
			</div>
		</center>

	</body>
</html>