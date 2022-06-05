
<?php 
	
	$bd =new mysqli("localhost","root","","bd_games");
	if($bd->connect_errno){
		echo "<p>  Erro  ao connectar com a base de dados $bd->errno --> $bd->connect_error <p>";
		die();

	}


?>