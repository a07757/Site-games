<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="estilos/estilo.css">
	<link rel="stylesheet" type="text/css" href="estilos/bootstrap.min.css">
	<title></title>
</head>
<body>
	<?php
		#include  "includes/bd.php"  inclui o arq
		#require_once requer o arqui e só importa uma vez 
		require_once "includes/bd.php" ;
		require_once "includes/thumb.php";
	?>
	<div id="corpo">
		
		<div id="tabela">
			<?php
				$id = $_GET['id'] ?? 0;
				echo $id;
			?>

			
				
					<?php
						$busca = $bd->query("select *from jogos where id=$id");
						if (!$busca) {
							echo " Falha na busca!! $bd->error";
						}	else {if($busca->num_rows ==0) {
							echo" Nenhum registro encontrado !!";	
							}else{
							while ($reg=$busca->fetch_object()) {
								$t= thumb($reg->capa);
								echo" <h2>$reg->nome </h2>";
								echo"<div class='row'>" ;
								echo"<div class='col-md-7'> <img src='$t' class='capa'/> </div>";
								echo"<div class='col-md-5'><p> $reg->descrição </p></div>";
								echo"</div>";							

							}}}
					?>
				</div>
			</div>

		


</body>
</html>