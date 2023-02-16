const BASE = 'http://laravel_crudajax.test/';
const contenedor = document.getElementById('contenedor');
	const tabla = document.getElementById('tabla');
		listar();
		function listar() {			
			ajax('GET', BASE + 'listar', tabla);
		}