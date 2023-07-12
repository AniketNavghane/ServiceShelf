<html>
<head>
<title>kc app</title>
<style>
* { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
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
					response.sendRedirect("Alogin.jsp");
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
					response.sendRedirect("Alogin.jsp");
				}
			%>
			</div>
	</center>
</body>
</html>