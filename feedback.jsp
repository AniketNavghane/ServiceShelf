<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<html>
	<head>
		<title> KC APP </title>

		<style>
			 * { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
			.nav { background-color:black; }
			.nav a{ color:white; text-decoration:none; margin:2%; }
			body{ background-color:lightsteelblue; }

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
			<h1>Feedback Form</h1><br/>
			<form method="POST">
				<input type="text" name="name" placeholder="Enter ur Full Name"/>
				<br/><br/>
				<input type="text" name="college" placeholder="Enter ur College Name"/>
				<br/><br/>
				<textarea name="feedback" placeholder="Enter Feedback" rows=3></textarea>
				<br/><br/>
				<p><button name="btn">Submit</button></p>
			</form>	
			</div>
			<% 
				if(request.getParameter("btn")!= null)
				{
					String name = request.getParameter("name");
					String college = request.getParameter("college");
					String feedback = request.getParameter("feedback");
					
					if(name.trim().length() == 0)
					{
						out.println("invalid name");	
						return;
					}

					else if(!name.trim().matches("^[a-zA-Z ]*$"))
					{
						out.println("invalid name");	
						return;
					}

					else if(name.trim().length() < 2)
					{
						out.println("invalid name");	
						return;
					}

					else if(college.trim().length() == 0)
					{
						out.println("invalid college name");
						return;
					}
				
					else if(!college.trim().matches("^[a-zA-Z ]*$"))
					{
						out.println("invalid college name");	
						return;
					}

					else if(college.trim().length() < 4)
					{
						out.println("invalid college name");	
						return;
					}
					
					else if(feedback.trim().length() == 0)
					{
						out.println("write something");
						return;
					}

					else if(!feedback.trim().matches("^[a-zA-Z ]*$"))
					{
						out.println("type something");	
						return;
					}

					else if(feedback.trim().length() < 5)
					{
						out.println("type true feedback");	
						return;
					}

					else
						{		
							try
							{
								DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
								String url = "jdbc:mysql://localhost:3306/fb_6jan23";
								Connection con = DriverManager.getConnection(url,"root","abc456");
								String sql = "insert into Feedback values(?,?,?)";
								PreparedStatement pst = con.prepareStatement(sql);
								pst.setString(1,name);
								pst.setString(2,college);
								pst.setString(3,feedback);
								pst.executeUpdate();
								out.println("Thank you for feedback!");
								con.close();
							}
							catch(SQLException er)
							{
								out.println("issue"+er);
							}
						}
					}
			%>		
		</center>	
	</body>
</html>