<?php
	session_start();// ini script PHP untuk memulai sesi di browser client 
	if(isset($_SESSION['loginS']) and !empty($_SESSION['loginS']) ){
		require_once 'indexs.php';
	}else{
?>
<html> 
	<head> 
		<title>.:SISTER:.</title> 
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1 " />
		<script src="js/jquery-1.8.3.min.js"></script>
		<!-- site style -->
		<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head> 
	<body> 
		<img src="img/gear.png" id="OptionColor" /> 
		<img src="img/picture.png" id="OptionBack" /> 
		<div class="LoginBox"> 
			<img src="img/avatar.png" /> 
			<h2 class="loginMessage"></h2> 
			<div class="fields"> 
				<form autocomplete="off" id="frmLogin" /> 
					<input type="text" id="userTB" name="userTB" placeholder="Username" /> <p /> 
					<!-- <input type="text" id="pass2TB" name="pass2TB" /> <p />  -->
					<input type="password" id="passTB" name="passTB" placeholder="Password" /> 
					<button id="botLogIn"></button> 
					<img src="img/eye.png" class="seePass" /> 
				</form> 
			</div> 
		</div> 
		<!-- javascript for login -->
		<script src="js/jquery.md5.js"></script>
		<script src="js/MetroLogin.js"></script>
	</body> 
</html>
<?php
	}
?>
