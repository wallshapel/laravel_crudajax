<form action="#" method="POST" id="formularioG">
	@csrf
	<div>
		<label for="name">Usuario: </label>
		<input type="text" name="name" id="name">
	</div>
	<div>
		<label for="email">Email: </label>
		<input type="email" name="email" id="email">	
	</div>
	<div>
		<input type="submit" value="Guardar" id="guardar">
	</div>	
</form>