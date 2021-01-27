<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>


<html>


<style>
	*{ 
	margin: 0;
	padding: 0;
	font-family: Century Gothic;
	box-sizing: border-box;
	background-color:black;
	color: white; 
	background-size: cover; 
	background-position: center;


	}


header{
	margin-top:25px;
	}

ul { 
	float: right; 
	list-style-type: none;		
	margin-top: 25px;
	} 

ul li { 
	display: inline-block;
	}
#past,#future,#present{
    height: 600px;
    width: 300px;
	}

 ul li a{
	
	text-decoration: none; 
	color: #fff; 
	padding: 5px 20px; 
	border:1px solid transparent;	
	transition:0.6s ease; 
	}

ul li a:hover{
	background-color: #fff; 
	color: #000;
	}
ul li.active a{
	background-color: #fff; 
	color: #000;
	}


.title{ 
	position: absolute;
	top: 15%;
	left:50%;
	transform: translate(-50%, -50%);
	}		

.title h1{
		font-size: 70px;
	}

.display{
top:30%;
padding-top:150px;
padding-left: 150px;
left:50%;
display: inline-block;
	}


img{
	width:400px;
	hight:550px;
	padding-bottom: 10px; 

}		
.info{
padding: 10px;
left:50%;
display: inline-block;
}

</style>


<head>
<meta charset="ISO-8859-1">
<title>SuperHero</title>
</head>

	<header>
			<div class = "main">
			<ul>
				<li> <a href="index.html">Home</a><li>
				<li class= "active"> <a href="searchhero.jsp"> Find A Hero </a><li>
				<li> <a href="superHeroQuiz2.jsp"> Which hero are you? </a><li>	
			</ul>
		</div> 


	</header>

	<body>
		<div class ="title">
			<h1>Results</h1>
		</div> 
<div class="display">
	<%
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/superhero", "root", "123456");
		Statement st = connection.createStatement();
		ResultSet rs;
		String superheroName = request.getParameter("search");
		rs = st.executeQuery("select * from superhero.superhero_info where name like '%"+superheroName+"%'");
		while (rs.next()) {
			String name = rs.getString("Name");
			String alterEgos = rs.getString("AlterEgos");
			String placeOfBirth = rs.getString("PlaceOfBirth");
			String firstAppearance = rs.getString("FirstAppearance");
			String publisher = rs.getString("Publisher");
			String aliases = rs.getString("Aliases");
			String imageUrl = rs.getString("Image");
			String userid=rs.getString("Name");
			int sHeroId = rs.getInt("SuperHeroId");
	%>
   			
	
		
        
		
	<div class="info">
		<h1>
			<a href="superhero_2.jsp?sHeroId=<%=sHeroId%>"><%=name%> </a ><br>
		</h1>
		<img src='<%=imageUrl%>' alt='<%=name%>' > 
	</div>
		
	<%
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</div>
	
</body>
</html>
