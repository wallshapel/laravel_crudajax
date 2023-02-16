<?php
    namespace App\Http\Controllers\usuarios;
    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\User;
    class UsuariosController extends Controller {
        public function index() {
            $usuarios = User::get();
            return view('usuarios/index', compact('usuarios'));
        }    
    }
?>