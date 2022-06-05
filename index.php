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
		require_once "includes/bd.php" 
	?>
	<div id="corpo">
		<h2>Escolha o seu Jogo</h2>
		<div id="tabela">
			<table class="listagem">
				<?php
						$busca = $bd->query("select *from jogos order by nome");
						if (!$busca) {
								echo "<tr><td> Falha na busca!! $bd->error";
							}	else {if($busca->num_rows ==0) {
								echo"<tr><td> Nenhum registro encontrado !!";	
								}else{
								while ($reg=$busca->fetch_object()) {
									echo"<tr><td><img src='fotos/$reg->capa' class='capa'/>";
									echo "<td> <a href=''>$reg->nome </a>";	
									echo"<td>ADM";		
								}}}
				 ?>

			</table>
		</div>
	</div>

</body>
</html>