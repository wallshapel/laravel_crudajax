<form action="#" method="POST" id="formularioE">
	@csrf
	<input type="hidden" name="id" id="id" value="{{ $id['id'] }}">
	<div>
		<label for="name">Usuario: </label>
		<input type="text" name="name" id="name" value="{{ $id['name'] }}">
	</div>
	<div>
		<label for="email">Email: </label>
		<input type="email" name="email" id="email" value="{{ $id['email'] }}">
	</div>
	<div>
		<input type="submit" value="Actualizar" id="actualizar">
	</div>	
</form>