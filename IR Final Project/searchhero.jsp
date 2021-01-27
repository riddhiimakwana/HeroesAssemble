<!DOCTYPE html> 
<html> 
<style>
	*{ 
	margin: 0;
	padding: 0;
	font-family: Century Gothic;
	 box-sizing: border-box;
	}

	header 
	{ 
	background-color:black;
	color: white;
	height: 140vh; 
	background-size: cover; 
	background-position: center;
	background-image: url('background3.jpg')
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


	.title
	{ 
		position: absolute;
		top: 15%;
		left:50%;
		transform: translate(-50%, -50%);
	}		

	.title h1
	{
		font-size: 70px;
	}	
	
form.example input[type=text] {
  padding: 10px;
  margin-top: 10%;
  font-size: 17px;
  border: 1px solid transparent;
  float: left;
  width: 80%;
  background: white;
  color:black;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: black;
  color: white;
  font-size: 17px;
  border: 1px solid white;
  border-left: none;
  cursor: pointer;
  margin-top:10%;
 
}

form.example button:hover {
  background: white;
  color: black;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
	
	
	</style>
	
	

<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>FindAHero</title> 
	</head>
	
	<body>
	<header>
			<div class = "main">
			<ul>
				<li> <a href="index.html">Home</a><li>
				<li class= "active"> <a href="searchhero.jsp"> Find A Hero </a><li>
				<li> <a href="superHeroQuiz2.jsp"> Which hero are you? </a><li>	
			</ul>
		</div> 
		<div class ="title">
			<h1> Find a Hero</h1>
		</div> 
		<form class="example" action="superhero_test2.jsp">
  <input type="text" placeholder="Search..." name="search" color=black>
  <button onclick="myFunction()">Click Me</button>

</form>
	</header>
	</body> 
	
	<script>
	function myFunction() {
		  var x = document.getElementById("myDIV");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
	</script>
</html> 