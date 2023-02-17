const BASE = 'http://laravel_crudajax.test/';
const principal = document.getElementById('principal');
	const guardarEditar = document.getElementById('guardarEditar');
		const guardar = document.getElementById('guardar');
		const resultadosValidacion = document.getElementById('resultadosValidacion');
	guardarEditar.addEventListener('click', (e) => {
		const click = e.target.id;
		if (click == 'nuevo') 
			ajax('GET', BASE + 'nuevo', guardar);	
		if (click == 'guardar') {
			e.preventDefault();
			if (!validarFormulario())
				return false;	
			const formularioG = document.getElementById('formularioG');	
			const fd = new FormData(formularioG);
			const xhr = new XMLHttpRequest();
			xhr.open('POST', BASE + 'guardar');
			xhr.send(fd);
			xhr.onload = () => {			
				const respuesta = xhr.responseText;
				if (respuesta.substring(0, 1) == '1') {
					resultadosCRU(1, formularioG);	
					resetInputs(formularioG);
				} else 				
					resultadosCRU(0, null, respuesta);	
			};	
		}
		if (click == 'actualizar') {
			e.preventDefault();
			if (!validarFormulario())
				return false;	
			const formularioE = document.getElementById('formularioE');	
			const fd = new FormData(formularioE);
			const xhr = new XMLHttpRequest();
			xhr.open('POST', BASE + 'guardar');
			xhr.send(fd);
			xhr.onload = () => {
				const respuesta = xhr.responseText;
				if (respuesta == '1')
					resultadosCRU(1, formularioE);	
				else 				
					resultadosCRU(0, null, respuesta);	
			};	
		}
		if (click == 'resultadosValidacion') {
			resultadosValidacion.innerHTML = '';
			resultadosValidacion.style.display = 'none';
		}
		function resultadosCRU(resultado, formulario = null, respuesta = null) {
			resultadosValidacion.style.display = 'block';
			if (resultado == 1) {
				resultadosValidacion.innerHTML = 'Cambios guardados.';	
				resultadosValidacion.classList.remove('resultadosValidacion1');
				resultadosValidacion.classList.add('resultadosValidacion0');
				listar();
			} else {
				resultadosValidacion.innerHTML = respuesta;	
				resultadosValidacion.classList.remove('resultadosValidacion0');
				resultadosValidacion.classList.add('resultadosValidacion1');
			}
		}
		function resetInputs(formulario = null) {
			document.getElementById('name').classList.remove('inputCorrecto');
			document.getElementById('email').classList.remove('inputCorrecto');
			if (formulario != null)
				formulario.reset();
		}
	});
	guardarEditar.addEventListener('keyup', (e) => {
		const input = e.target;
		validarCampos(input);
	});
	guardarEditar.addEventListener('focusout', (e) => {
		const input = e.target.id;
		validarCampos(input);
	});
	const tabla = document.getElementById('tabla');		
		function listar() {			
			ajax('GET', BASE + 'listar', tabla);
		}
		listar();
		tabla.addEventListener('click', (e) => {
			const click = e.target.id;
			if (click.substring(0, 6) == 'editar') {
				const id = click.substring(6);
				ajax('GET',  BASE + 'editar/' + id, guardar);
			}
			if (click.substring(0, 8) == 'eliminar') {
				const id = click.substring(8);
				ajax('GET', BASE + 'eliminar/' + id, tabla);
				resultadosValidacion.style.display = 'block';
				resultadosValidacion.innerHTML = 'Usuario eliminado.';	
				resultadosValidacion.classList.remove('resultadosValidacion1');
				resultadosValidacion.classList.add('resultadosValidacion0');
			}	
		});