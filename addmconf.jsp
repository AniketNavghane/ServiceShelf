<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<html>
	<head>
		<title> kamal classes </title>
		<style>
			 * { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
			.nav { background-color:black;}
			.nav a{ color:white; text-decoration:none; margin:2%; }
			body{ 
				
				 background-color:lightsteelblue; 
 				 background-repeat: no-repeat; 
  				 background-attachment: fixed; 
  				 background-size: 100% 100%; 
			}
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
			

@media screen and (max-width: 800px) {
	body {
		background-color: red;
	}
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
			</div>
			<br/>

			<div class="container">
			<h1>Addmission Form</h1>
			<br/>
			<form method="POST">
				<input type="text" name="name"  placeholder="Enter ur Full Name"/>
				<br/><br/>
				<input type="text" name="college" placeholder="Enter ur College Name"/>
				<br/><br/>
				<input type="tel" name="phone"  placeholder="Enter ur Phone No"/>
				<br/><br/>
				<input type="text" name="address"  placeholder="Enter ur Full Address"/>
				<br/><br/>
				<input type="radio" name = "choice" value="cash" checked/>Cash
				<input type="radio" name = "choice" value="online payment"/>Online Payment
				<br/><br/>
				<p><button name="btn">Submit</button></p>
			</form>	
			</div>

			<% 

				
				if(request.getParameter("btn")!= null)
				{
					String name = request.getParameter("name");
					String college = request.getParameter("college");
					String phone = request.getParameter("phone");
					String address = request.getParameter("address");
					String choice = request.getParameter("choice");

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

					else if(address.trim().length() == 0)
					{
						out.println("invalid address");
						return;
					}
				
					else if(!address.trim().matches("^[a-zA-Z ]*$"))
					{
						out.println("invalid address");	
						return;
					}

					else if(address.trim().length() < 4)
					{
						out.println("invalid address");	
						return;
					}

					else if(choice == null)
					{
						out.println("choose any one");	
						return;
					}					

					else
						{		
						try
						{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/ad_6jan23";
						Connection con = DriverManager.getConnection(url,"root","abc456");
						String sql = "insert into addmission values(?,?,?,?,?)";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1,name);
						pst.setString(2,college);
						pst.setString(3,phone);
						pst.setString(4,address);
						pst.setString(5,choice);
						pst.executeUpdate();
						out.println("send your fees recipt on kamal office number and you get id card(if your are offline) or digital id on whatsapp(if your are online).Thank you! your addmission confirm!");
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
		</div>
	</body>
</html>