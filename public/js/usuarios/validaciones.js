const expresiones = {
	//usuario: /^[a-zA-Z][a-zA-Z0-9_-]{8,20}$/, // Letras, numeros, guión y guión_bajo. Como primer caracter solo permite letras.
	//pass: /^.{6,20}$/ // 6 a 20 caracteres.
	name: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.	
	email: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
	//telefono: /^\d{7,14}$/ // 7 a 14 números.
}
const campos = {
	name: false,
	email: false
}
function validarCampos(input) {
	if (input.name == 'name') {
		if (expresiones.name.test(input.value)) {
			campos.name = true;
			inputCorrectoIncorrecto(input, true);
		} else {	
			campos.name = false;
			inputCorrectoIncorrecto(input, false);
		}
	}
	if (input.name == 'email') {
		if (expresiones.email.test(input.value)) {
			campos.email = true;
			inputCorrectoIncorrecto(input, true);		
		} else {
			campos.email = false;
			inputCorrectoIncorrecto(input, false);	
		}
	}
}
function validarFormulario() {
	let cont = 0;
	if (expresiones.name.test(document.getElementById('name').value))
		++cont;
	else {
		--cont;
		inputCorrectoIncorrecto(document.getElementById('name'), false);
	}
	if (expresiones.email.test(document.getElementById('email').value))
		++cont;
	else {
		--cont;
		inputCorrectoIncorrecto(document.getElementById('email'), false);
	}
	if (cont == 2) {
		cont = 0;		
		return true;
	} else 
		return false;
}
function inputCorrectoIncorrecto(input, estado) {
	if (estado) {
		input.classList.remove('inputIncorrecto');
		input.classList.add('inputCorrecto');
	} else {
		input.classList.remove('inputCorrecto');
		input.classList.add('inputIncorrecto');	
	}
}
