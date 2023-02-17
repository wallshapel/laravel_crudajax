<div id="tabla">
	<table>
		<thead>
			<tr>
				<th>Nombre</th>
				<th>Correo</th>
				<th colspan="2">Acciones</th>
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