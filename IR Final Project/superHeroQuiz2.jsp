<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>SuperHero Quiz</title>
<style>
	*{ 
	margin: 0;
	padding: 0;
	font-family: Century Gothic;
	box-sizing: border-box;
	color: black; 
background-image: url('background7.jpg'); 
background-size: cover;
background-attachment: fixed;
font-size: 40px;

}
header{
	margin-top:25px;
	}

	ul { 
	font-size: 20px;
	float: right; 
	list-style-type: none;		
	margin-top: 25px;
	} 

ul li { 
	font-size: 20px;
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
#pgMainMenu{
background-color:black;
	color: white; 
	background-size: cover; 
	background-position: center;
}
#headerTitle{
	position: right;
	font-size: 90px;

	}

#bStartQuiz{
	height: 200px;
    width: 500px;
    font-size: 70px;
    padding: 50px;
    position: absolute;
	top: 45%;
	left:50%;
	transform: translate(-50%, -50%);
	background: black;
	color: white;

}
label {
	margin-left: auto;
    margin-right: auto;
    
}

input[type="radio"] {
	vertical-align: baseline;
margin-left: auto;
    margin-right: auto;
    

  
}

input[type="submit"] {
	border: none;
	background-color: blue;
	color: white;
	margin-left: auto;
    margin-right: auto;
    
}
 #options{
 	height: 200px;
    width: 500px;
    font-size: 70px;
    padding: 50px;
    position: absolute;
	top: 45%;
	left:50%;
	transform: translate(-50%, -50%);
	background-color:black;
	color: white; 
	background-size: cover; 
	background-position: center;


 }

 #question{
	margin-left: auto;
    margin-right: auto;
  font-style: bold;

 }
#bSubmitAnswer{
	text-decoration: none; 
	color: black; 
	padding: 15px 20px; 
	border:1px solid black;	
	transition:0.6s ease; 
 margin: 0;
  position: absolute;
  top: 80%;
  left: 40%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
   
}
#bResetQuiz{
	text-decoration: none; 
	color: black; 
	padding: 15px 20px; 
	border:1px solid black;	
	transition:0.6s ease; 
 margin: 0;
  position: absolute;
  top: 80%;
  left: 60%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);

}


}
</style>
</head>

<header>
			<div class = "main">
			<ul>
				<li> <a href="index.html">Home</a><li>
				<li class= "active"> <a href="searchhero.jsp"> Find A Hero </a><li>	
			</ul>
		</div> 


	</header>
<body onload="init()">
	<div id="pgMainMenu">
		<h1 id="headerTitle">Which SuperHero Am I?</h1>

		<p id="options">
			<button id="bStartQuiz" name="startQuiz" onclick="startQuiz()">Start Quiz</button>

		</p>
	</div>
	<div id="pgQuiz">
		<p id="question">Question</p> <br>
		<p>
			<input id="OptAnswer1" type="radio" name="answer" value="1"><label
				for="OptAnswer1"><span id="answerPos1">Answer1</span></label>
		</p>

		<p>
			<input id="OptAnswer2" type="radio" name="answer" value="2"><label
				for="OptAnswer2"><span id="answerPos2">Answer2</span></label>
		</p>

		<p>
			<input id="OptAnswer3" type="radio" name="answer" value="3"><label>
				<for="OptAnswer3"><span id="answerPos3">Answer3</span></label>
		</p>

		<p>
			<input id="OptAnswer4" type="radio" name="answer" value="4"><label
				for="OptAnswer4"><span id="answerPos4">Answer4</span></label>
		</p>
		<button id="bSubmitAnswer" onclick="checkAnswer()">Submit
			Answer</button>
		<button id="bResetQuiz" onclick="resetQuiz()">Cancel Quiz</button>
	</div>
	<div id="QuizResults">
		<h3>
			<span>Quiz Results</span>
		</h3>
		<p id="ResultMessage">Congratulations you did it!</p>
		<p id="QuizScore">Final Score: 0</p>
		<button id="bResetQuiz" onclick="resetQuiz()">Main Menu</button>
	</div>
</body>
<script type="text/javascript">
	var quiz = [];
	var currentQuiz;
	var quizScore;

	function init() {
		quizScore = 0;
		currentQuiz = 0;
		document.getElementById("pgQuiz").style.display = "none";
		document.getElementById("QuizResults").style.display = "none";
	}

	function loadQuiz() { 
		var Question1 = {
			qID : "1",
			questiontext : "If you were on your way to your day job, and saw a bank robbery. What would you do?",
			answer1 : "Put on a disguise and solve the issue.",
			answer2 : "I would mind my own business.",
			answer3 : "I would call the police.",
			answer4 : "I don't have a job.",
			asked : "false"
		};

		var Question2 = {
			qID : "2",
			questiontext : "On the weekends, what would you like to do?",
			answer1 : "Spend time with my family and friends.",
			answer2 : "Go to a bar.",
			answer3 : "Fight evil around the city.",
			answer4 : "Spend time with my significant other.",
			asked : "false"
		};

		var Question3 = {
			qID : "3",
			questiontext : "How often do you cook at home?",
			answer1 : "Takeout my go-to.",
			answer2 : "Eh.. whatever is at home.",
			answer3 : "Everynight.",
			answer4 : "Here and there.",
			asked : "false"
		};

		var Question4 = {
			qID : "4",
			questiontext : "If you lost a close friend.family member by hands of your enemy, what would you do?",
			answer1 : "Grieve them and take some off to get justice.",
			answer2 : "Find my enemy and take revenge.",
			answer3 : "Go on a klling spree to fight all evil.",
			answer4 : "Take out everything associated with my enemy.",
			asked : "false"
		};

		var Question5 = {
			qID : "5",
			questiontext : "In high school, were you:",
			answer1 : "The one who felt out of place",
			answer2 : "The person who was angry wiht everything.",
			answer3 : "The popular kid.",
			answer4 : "The jokester",
			asked : "false"
		};

		var Question6 = {
			qID : "6",
			questiontext : "If your secret identity was revealed, you would:",
			answer1 : "Ensure all my friends and family are safe first, and deal with the consequences.",
			answer2 : "Embrace my identity as it is.",
			answer3 : "Try to deny it and find a decoy to take my place.",
			answer4 : "Couldn't care less.",
			asked : "false"
		};

		var Question7 = {
			qID : "7",
			questiontext : "My favourity season is",
			answer1 : "Summer",
			answer2 : "Winter",
			answer3 : "Fall",
			answer4 : "Doesn't matter to me, what's a season.",
			asked : "false"
		};

		var Question8 = {
			qID : "8",
			questiontext : "You have to attend a black-tie event, what would you wear:",
			answer1 : "Something fancy.",
			answer2 : "Whatever I have lying around.",
			answer3 : "My superhero suit.",
			answer4 : "Show up half naked.",
			asked : "false"
		};

		var Question9 = {
			qID : "9",
			questiontext : "What are some powers you would want?",
			answer1 : "Ability to fly",
			answer2 : "Super healing",
			answer3 : "Hand-to-hand combat",
			answer4 : "Great swordsmanship",
			asked : "false"
		};

		var Question10 = {
			qID : "10",
			questiontext : "What would like for your birthday?",
			answer1 : "A ubereats gift card",
			answer2 : "Couldn't care less.",
			answer3 : "I hate everything I could ask for",
			answer4 : "Sharp toys.",
			asked : "false"
		};
		quiz[0] = Question1;
		quiz[1] = Question2;
		quiz[2] = Question3;
		quiz[3] = Question4;
		quiz[4] = Question5;
		quiz[5] = Question6;
		quiz[6] = Question7;
		quiz[7] = Question8;
		quiz[8] = Question9;
		quiz[9] = Question10;

	}

	function checkAnswer() {
		var answer = document.getElementsByName("answer");
		var selectedAnswer = 0;

		for (var i = 0; i < answer.length; i++) {
			if (answer[i].checked)
				selectedAnswer = answer[i].value;
		}
		if (selectedAnswer == "") {
			alert("You haven't chosen an answer");
			return false;
		} else {
			quizScore += parseInt(selectedAnswer);
		}
		quiz[currentQuiz].asked = "true";
		nextQuestion();
	}

	function nextQuestion() {
		document.getElementById("OptAnswer1").checked = false;
		document.getElementById("OptAnswer2").checked = false;
		document.getElementById("OptAnswer3").checked = false;
		document.getElementById("OptAnswer4").checked = false;
		var numberAsked = 0;
		for (var i = 9; i >= 0; i--) {
			if (quiz[i].asked == "true") {
				numberAsked++;
			} else {
				currentQuiz = i;
			}
		}
		if (numberAsked == 10) {
			ResultsInfo();
		} else {
			document.getElementById("question").innerHTML = quiz[currentQuiz].questiontext;
			document.getElementById("answerPos1").innerHTML = quiz[currentQuiz].answer1;
			document.getElementById("answerPos2").innerHTML = quiz[currentQuiz].answer2;
			document.getElementById("answerPos3").innerHTML = quiz[currentQuiz].answer3;
			document.getElementById("answerPos4").innerHTML = quiz[currentQuiz].answer4;
			document.getElementById("answerPos5").innerHTML = quiz[currentQuiz].answer5;
			document.getElementById("answerPos6").innerHTML = quiz[currentQuiz].answer6;
			document.getElementById("answerPos7").innerHTML = quiz[currentQuiz].answer7;
			document.getElementById("answerPos8").innerHTML = quiz[currentQuiz].answer8;
			document.getElementById("answerPos9").innerHTML = quiz[currentQuiz].answer9;
			document.getElementById("answerPos10").innerHTML = quiz[currentQuiz].answer10;
		}
	}

	function resetQuiz() {
		init();
		document.getElementById("pgMainMenu").style.display = "inline";
	}

	function startQuiz() {
		document.getElementById("pgMainMenu").style.display = "none";
		document.getElementById("pgQuiz").style.display = "inline";
		loadQuiz();
		nextQuestion();
	}

	function ResultsInfo() {
		var superHeroName = "Ironman";
		if (quizScore <= 10) {
			superHeroName = "SuperGirl";
		} else if (quizScore <= 15) {
			superHeroName = "Captain America";
		} else if (quizScore <= 20) {
			superHeroName = "Wolverine";
		} else if (quizScore <= 25) {
			superHeroName = "Iron Man";
		} else if (quizScore <= 30) {
			superHeroName = "Arrow";
		} else if (quizScore <= 40) {
			superHeroName = "Deadpool";
		}
		document.getElementById("pgQuiz").style.display = "none";
		document.getElementById("QuizResults").style.display = "inline";
		document.getElementById("QuizScore").innerHTML = "You are: <b>" + superHeroName + "</b>";
	}
</script>
</html>