<div id="tabla">
	<table>
		<thead>
			<tr>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Correo</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($usuarios as $usuario)
			<tr>
				<td>{{ $usuario['name'] }}</td>
				<td>{{ $usuario['email'] }}</td>
				<td><button id="editar{{ $usuario['id'] }}">Editar</button></td>
				<td><button id="eliminar{{ $usuario['id'] }}">Eliminar</button></td>
			</tr>
			@endforeach
		</tbody>
	</table>
</div>