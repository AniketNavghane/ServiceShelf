<%@page import="java.sql.*" %>

			
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
			<h1>Update Form</h1>
			<br/>
			<form method="POST">
				<input type="text" name="name" placeholder="enter new Full Name"/>
				<br/><br/>
				<input type="text" name="college" placeholder="enter new College name" />
				<br/><br/>
				<input type="tel" name="phone" placeholder="enter new Phone number"/>
				<br/><br/>
				<input type="text" name="address"  placeholder="enter new Address"/>
				<br/><br/>
				<p><button name="btn">Update</button></p>
			</form>	
			</div>
			<%
			if(request.getParameter("btn")!=null)
					{
						String name = request.getParameter("name");
						String college = request.getParameter("college");
						String phone = request.getParameter("phone");
						String address = request.getParameter("address");

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
					
					else {
						try
						{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/ad_6jan23";
						Connection con = DriverManager.getConnection(url,"root","abc456");
						String sql = "update addmission set name=?,college=?,phone=?,address=? where name=?";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1, name);
						pst.setString(2, college);
						pst.setString(3, phone);
						pst.setString(4, address);
						pst.setString(5, name);
						pst.executeUpdate();
						out.println("Record updated successfully");
						con.close();
					}
					catch(SQLException er)
					{
						out.println("isuue" +er);
					}
					}
					}
		%>

		</center>
		</div>
	</body>
</html>