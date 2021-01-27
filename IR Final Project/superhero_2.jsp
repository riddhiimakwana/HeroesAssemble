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
top:150%;
padding: 40px;
	}
.display h1{
	position: absolute;
	top: 15%;
	left:50%;
	transform: translate(-50%, -50%);
	font-size: 70px;
	}

img{
	width:500px;
	height:650px;
	top:50%;

	

}		
.info{
	position: absolute;
	left:65%;
	transform: translate(-50%, -50%);
	top:65%;
	font-size: 16px;
}

</style>


<head>
<meta charset="ISO-8859-1">

<style type = "text/css">
</style>
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

<div class="display">
	<%
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/superhero", "root", "123456");
		Statement st = connection.createStatement();
		ResultSet rs;
		String superHeroId = request.getParameter("sHeroId");
		rs = st.executeQuery("select * from superhero.superhero_master where superHeroId = "+superHeroId+"");
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
			String gender = rs.getString("Gender");
			String race  = rs.getString("Race");
			String height = rs.getString("Height");
			String weight = rs.getString("Weight");
			String eyeColor = rs.getString("EyeColor");
			String hairColor = rs.getString("HairColor");
			String groupAffiliation  = rs.getString("GroupAffiliation");
			String relatives = rs.getString("Relatives");

	%>
   
	
	
			<h1>
				<p><%=name%> </p>
			</h1>

			<img src='<%=imageUrl%>' alt='<%=name%>' >
<div class="info">
		<h4>
			<p>Alter Ego: <%=alterEgos%> </p> <br>
		</h4>

		<h4>
			 <p>Place of Birth: <%=placeOfBirth%>  </p> <br>
		</h4>

		<h4>
			<p>First Appearance: <%=firstAppearance%> </p> <br>
		</h4>

		<h4>
			<p>Publisher: <%=publisher%>  </p><br>
		</h4>

		<h4>
			<p>Gender: <%=gender%>  </p> <br>
		</h4>

		<h4>
			<p>Race: <%=race%>  </p> <br>
		</h4>

		<h4>
			<p>Height: <%=height%>  </p> <br>
		</h4>

		<h4>
			<p>Weight: <%=weight%>  </p> <br>
		</h4>

		<h4>
			<p>Eye Color: <%=eyeColor%>  </p> <br>
		</h4>

		<h4>
			<p>Hair Color: <%=hairColor%>  </p> <br>
		</h4>

		<h4>
			<p>Group Affiliation: <%=groupAffiliation%>  </p> <br>
		</h4>

		<h4>
			<p>Relatives: <%=relatives%>  </p> 
		</h4>

</div>

		
	<%
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</div>
	<div id="graphDiv">
		<p> <h1> Power Stats</h1></p>
<canvas id="mycanvas" style=" left:10px; width:350px; height:100px;background-color: black;"></canvas>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.bundle.js"></script>
<script style="color:white">
	$(document).ready(function(){
		bargraph();
	})
	var bargraph = function(){
		$.ajax({
			url : "superHeroPowerstats.jsp?search=<%request.getParameter("search");%>",
					dataType: 'json',                          
					type: "GET",
					success : function(data){
						var str = "dataset";
						var powerstatsLabel = [];
						var dataset1 = [];
						console.log(data.powerstats);
						for(var i in data.powerstats) {
							dataset1.push(data.powerstats[i].Intelligence);
							dataset1.push(data.powerstats[i].Strength);
							dataset1.push(data.powerstats[i].Speed);
							dataset1.push(data.powerstats[i].Durability);
							dataset1.push(data.powerstats[i].Power);
							dataset1.push(data.powerstats[i].Combat);
						}
						powerstatsLabel.push("Intelligence");
						powerstatsLabel.push("Strength");
						powerstatsLabel.push("Speed");
						powerstatsLabel.push("Durability");
						powerstatsLabel.push("Power");
						powerstatsLabel.push("Combat");
						
						var chartdata = {
								labels : powerstatsLabel,
								datasets: [
									{
										fill : false,
										lineTension : 0,
										//backgroundColor: "rgba(130,224,170,0.75)",
										backgroundColor: ["red", "blue", "green", "orange", "purple", "yellow"],
										data: dataset1
									}]
						};
						
						var optionData = {
								responsive: true,
								maintainAspectRatio: true,
								legend: {
									display: false
								},
								hover: {
									mode: 'label'
								},
								scales: {
									xAxes: [{
										display: true,
										scaleLabel: {
											display: true,
											labelString: 'PowerStats Level'
										},
										ticks : {
											beginAtZero: true
										},
										gridLines: {
											display: false
										}
									}],
									yAxes: [{
										display: true,
										scaleLabel: {
											display: true,
											labelString: 'PowerStats'
										}
									}]
								}
						};
						
						var ctx = $("#mycanvas");
						var graph = new Chart(ctx, {
							type : 'horizontalBar',
							data: chartdata,
							options: optionData
						});
					},
					error : function(data){
						console.log(data);
					}
		});
	}
</script>
</html>