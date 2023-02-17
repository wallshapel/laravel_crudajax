<?php
    namespace App\Http\Controllers\usuarios;
    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\User;
    use Illuminate\Support\Facades\Validator;
    class UsuariosController extends Controller {
        public function index() {
            $usuarios = User::get();
            return view('usuarios/index', compact('usuarios'));
        }
        public function editar(User $id) {
            return view('usuarios/editar', compact('id'));
        }
        public function nuevo() {
            return view('usuarios/nuevo');    
        }
        public function guardar(Request $req) {
            try {
                if (isset($req->id)) {  // Se trata de una actualización.
                    $id = $req->id;
                    $validador = Validator::make($req->all(), User::validacion($id, $req->email));
                    if ($validador->fails())
                        return $validador->errors();
                    $usuario = User::find($id);
                    $usuario->name  = $req->name;
                    $usuario->email = $req->email;
                    if ($usuario->save()) 
                        return '1';    
                } else {
                    $validador = Validator::make($req->all(), User::validacion());
                    if ($validador->fails())
                        return $validador->errors();
                    $usuario = new User();
                    $usuario->name      = $req->name;
                    $usuario->password  = password_hash('1234', PASSWORD_BCRYPT);;
                    $usuario->email     = $req->email;
                    if ($usuario->save()) 
                        return '1';        
                }                
            } catch (Exception $e) {
                return $e;
            }
        }
        public function eliminar(User $id) {
            $id->delete();
            return $this->index();
        }            
    }
?>