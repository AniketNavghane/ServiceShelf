<%@page import="java.sql.*" %>
<html>
	<head>
		<title> KC APP </title>
		<style>
			* { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
			body {background-color:rgb(155,142,162);width:100%;height:100vh;}
			.nav { background-color:black; }
			.nav a{ color:white; text-decoration:none; margin:2%; }
			.container {    
				color:black; 
				width:550px; 
				padding: 50px; 40px; 50px; 40px; 
				border-radius:5px; 
				box-shadow:0 4px; 8px 0; 
				background-color:white;
				}
			
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
			
			<div class="nav">
				<a href="mainpage.jsp">Home</a>
				<a href="addmconf.jsp">AddmissionForm</a>
				<a href="course.jsp">Courses</a>
				<a href="enrollcourse.jsp">EnrollCourse</a>
				<a href="query.jsp">Query</a>
				<a href="feedback.jsp">feedback</a>
				<a href="home.jsp">Profile</a>
			</div><br/>
		<div class="container">
			<h1> Enroll Your Course Now!</h1>
			<br/>
		<form mthod="POST" >
			<input type="text" name="name" placeholder="Enter Full Name"/>
				<br/><br/>
			<input type="text" name="college" placeholder="Enter College Name"/>
				<br/><br/>
			<input type="tel" name="phone" placeholder="Enter Phone Number"/>
				<br/><br/>
			<input type="email" name="email" placeholder="Enter Email Id"/>
				<br/><br/>
			<input type="checkbox" name = "p" value="PYTHON" checked/>PYTHON
			<input type="checkbox" name = "d" value="D-JANGO"/>D-JANGO<br/>
			<input type="checkbox" name = "m" value="MYSQL"/>MYSQL
			<input type="checkbox" name = "ms" value="MERN STACK"/>MERN STACK<br/>
			<input type="checkbox" name = "j" value="JAVA"/>JAVA
			<input type="checkbox" name = "ml" value="MACHINE LEARNING"/>MACHINE LEARNING
				<br/><br/>
			<p><button name="btn">Enroll</button></p>
			<br/>
			</div>
			<br/>
		</form>

		<%
			if(request.getParameter("btn")!= null)
				{
					String name = request.getParameter("name");
					String college = request.getParameter("college");
					String phone = request.getParameter("phone");
					String email = request.getParameter("email");
					String choice = "";
					String p = request.getParameter("p");
					String d = request.getParameter("d");
					String m = request.getParameter("m");
					String ms = request.getParameter("ms");
					String j = request.getParameter("j");
					String ml = request.getParameter("ml");
					
					if(p!=null)                  choice += "Python, ";
					if(d!=null)                  choice += "Django, ";
					if(m!=null)                  choice += "Mysql, ";
					if(ms!=null)                  choice += "Mern Stack, ";
					if(j!=null)                  choice += "Java, ";
					if(ml!=null)                  choice += "Machine Learning, ";

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
					
					else if(phone.trim().length() == 0)
					{
						out.println("invalid phone number");
						return;
					}

					else if(!phone.trim().matches("^[0-9]{10}"))
					{
						out.println("invalid phone number");
						return;
					}	

					else if(email.trim().length() == 0)
					{
						out.println("invalid email id");
						return;
					}

					else if(!email.trim().matches("^[A-Za-z0-9+_.-]+@(.+)$"))				
					{
						out.println("email format abc@gmail.com");
						return;
					}

					else if(choice == null)
					{
						out.println("invalid choice");
						return;
					}

					else
						{		
					try
					{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/ec_16jan23";
						String un = "root";
						String pw = "abc456";
						Connection con = DriverManager.getConnection(url,un,pw);
						String sql = "insert into enrolc values(?,?,?,?,?)";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1,name);
						pst.setString(2,college);
						pst.setString(3,phone);
						pst.setString(4,email);
						pst.setString(5,choice);
						pst.executeUpdate();
						out.println("thank you for enroll!! first 2 lectures attend free after that you have to take addmission");
						con.close();
					}
					catch(SQLException er)
					{
						out.println("issue" +er);
					}
					
				} 
			}
		%>
		</center>
	</body>
</html>