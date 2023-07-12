<html>
	<head>
		<title> KC APP </title>
		
		<style>
			 * { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
			.nav { background-color:black; }
			.nav a{ color:white; text-decoration:none; margin:2%; }
			body{ background-color:burlywood; }
		
			.container {
				background-color:white;
				float : left; 
				padding: 20px;
  				box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
				height : 500px;
 				max-width: 300px;
  				margin: 50px;
  				text-align: center;
  				font-family: arial;
				}			
		
			.container button {
					border: none;
  					outline: 0;		
					padding: 12px;
  					color: white;
  					background-color: #000;
  					text-align: center;
  					cursor: pointer;
  					width: 100%;
  					font-size: 18px;
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
		</center>
		<form method ="POST">
		<div class="container">
  				<img src="images/java.jpg" alt="JAVA PROGRAMMING LANGUAGE" style="width:100%">
  				<h1>Java Course</h1>
 				<p class="price">RS 11000 + 18% GST</p>
  				<p><button name="btn">Enroll</button></p>
			</div>
		<div class="container">
  				<img src="images/javascript.jpg" alt="JAVASCRIPT PROGRAMMING LANGUAGE" style="width:100%">
  				<h1>MERN STACK Course</h1>
 				 <p class="price">RS 10000 + 18% GST</p>
  					<p><button name="btn">Enroll</button></p>
			</div>
		
		<div class="container">
  				<img src="images/sql.jpg" alt="MYSQL DB PROGRAMMING LANGUAGE" style="width:100%">
  				<h1>Mysql DB Course</h1>
 				 <p class="price">RS 8500 + 18% GST</p>
  					<p><button name="btn">Enroll</button></p>
			</div>

		<div class="container">
  				<img src="images/python.jpg" alt="PYTHON PROGRAMMING LANGUAGE" style="width:100%">
  				<h1>Python Course</h1>
 				 <p class="price">RS 7500 + 18% GST</p>
  					<p><button name="btn">Enroll</button></p>
			</div>	

		<div class="container">
  				<img src="images/django.jpg" alt="DJANGO PROGRAMMING LANGUAGE" style="width:100%">
  				<h1>Django Course</h1>
 				 <p class="price">RS 8500 + 18% GST</p>
  					<p><button name="btn">Enroll</button></p>
			</div>	

		<div class="container">
  				<img src="images/ml.jpg" alt="MACHINE LEARNING PROGRAMMING LANGUAGE" style="width:100%">
  				<h1>Machine Learning Course</h1>
 				 <p class="price">RS 7500 + 18% GST</p>
  					<p><button name="btn">Enroll</button></p>
			</div>
		
		</form>
		<% 
				if(request.getParameter("btn")!=null)
				{
					response.sendRedirect("enrollcourse.jsp");
				}
				
		%>
		
	</body>
</html>