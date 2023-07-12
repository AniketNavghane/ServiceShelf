<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<%@page import="javax.activation.*" %>


<html>
	<head>
		<title>Kamal classes</title>
		<style>
			 * { font-size:30px; font-family:Simsun; margin:0; padding:0; box-sizing:border-box; }
			textarea{resize:none;}
			h1{backgrond-clolor:black; clolor:white; width:50%; border-radius:30px;}
			body{background-color:cadetblue;}
			
			.nav { background-color:black; }
			.nav a{ color:white; text-decoration:none; margin:2%; }

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
			</div><br/>

			<div class="container">
			<h1>Enquiry Form</h1><br/>
			<form method="POST">
				<input type="text" name="name" placeholder="Enter Your Full Name"/>
				<br/><br/>
				<input type="tel" name="phone" placeholder="Enter ur Phone"/>
				<br/><br/>
				<textarea name="query" placeholder="Enter Query" rows=3></textarea>
				<br/><br/>
				<p><button name="btn">Submit</button></p>
			</form>	
			</div>
			<% 
				if(request.getParameter("btn")!= null)
				{
					String name = request.getParameter("name");
					String phone = request.getParameter("phone");
					String query = request.getParameter("query");
					String dt = new java.util.Date().toString();

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

					else if(query.trim().length() == 0)
					{
						out.println("write query");
						return;
					}
				
					else if(!query.trim().matches("^[a-zA-Z ]*$"))
					{
						out.println("write query");	
						return;
					}

					else if(query.trim().length() < 5)
					{
						out.println("write proper query");	
						return;
					}

					else
						{		
						try
						{
							DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
							String url = "jdbc:mysql://localhost:3306/en_6jan23";
							Connection con = DriverManager.getConnection(url,"root","abc456");
							String sql = "insert into enquiry values(?,?,?,?)";
							PreparedStatement pst = con.prepareStatement(sql);
							pst.setString(1,name);
							pst.setString(2,phone);
							pst.setString(3,query);
							pst.setString(4,dt);
							pst.executeUpdate();
							out.println("we will get back in 2 hrs else your course free");

						//mail kaha se ayega
						Properties p = System.getProperties();
						p.put("mail.smtp.host","smtp.gmail.com");
						p.put("mail.smtp.port",587);
						p.put("mail.smtp.auth",true);
						p.put("mail.smtp.starttls.enable",true);

						//aapka un and pw ka authentication
						Session ms = Session.getInstance(p, new Authenticator(){
						public PasswordAuthentication getPasswordAuthentication(){
							String un = "ak.aniketnavghane01@gmail.com";
							String pw = "evwbtrobzycuaeet";
							return new PasswordAuthentication(un,pw);
						}
						});

						try
						{
							//mail ko draft krke bhejo
							MimeMessage msg = new MimeMessage(ms);
							String subject = "Enquiry From " + name;
							msg.setSubject(subject);
							String txt = "name="+name+"\nphone= "+phone+"\nquery= "+query;
							msg.setText(txt);
							msg.setFrom(new InternetAddress("ak.aniketnavghane01@gmail.com"));
							msg.addRecipient(Message.RecipientType.TO, new InternetAddress("samnavghane2002@gmail.com"));
							Transport.send(msg); 
						}
						catch(Exception e)
						{
							out.println("issue"+e);
						}
						
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
			<br/>
	</body>
</html>