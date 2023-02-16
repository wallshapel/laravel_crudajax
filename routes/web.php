<?php
    use Illuminate\Support\Facades\Route;
    use App\Http\Controllers\usuarios\UsuariosController; 
    Route::view('/', 'index');
    Route::get('/listar', [UsuariosController::class, 'index']);
?>