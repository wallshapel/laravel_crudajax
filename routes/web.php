<?php
    use Illuminate\Support\Facades\Route;
    use App\Http\Controllers\usuarios\UsuariosController; 
    Route::view('/', 'index');
    Route::controller(UsuariosController::class)->group(function () {
        Route::get('/listar', 'index');
        Route::get('/editar/{id}', 'editar');
        Route::get('/nuevo', 'nuevo');
        Route::post('/guardar', 'guardar');
        Route::get('/eliminar/{id}', 'eliminar');
    });    
?>