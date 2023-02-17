<?php
    namespace App\Models;
    // use Illuminate\Contracts\Auth\MustVerifyEmail;
    use Illuminate\Database\Eloquent\Factories\HasFactory;
    use Illuminate\Foundation\Auth\User as Authenticatable;
    use Illuminate\Notifications\Notifiable;
    use Laravel\Sanctum\HasApiTokens;
    use Illuminate\Support\Facades\DB;  // Necesario para hacer consultas con SQL nativo.
    class User extends Authenticatable {
        use HasApiTokens, HasFactory, Notifiable;
        /**
         * The attributes that are mass assignable.
         *
         * @var array<int, string>
         */
        protected $table = 'control_de_usuarios.users';
        protected $fillable = [
            'name',
            'email',
            'password'
        ];
        /**
         * The attributes that should be hidden for serialization.
         *
         * @var array<int, string>
         */
        protected $hidden = [
            'password',
            'remember_token',
        ];
        /**
         * The attributes that should be cast.
         *
         * @var array<string, string>
         */
        protected $casts = [
            'email_verified_at' => 'datetime',
        ];
        public static function validacion($id = null, $email_viejo = null) {
            $reglas = 
                [
                    'name'  => 'required|string|max:65',
                    'email' => 'required|string|max:65|email|unique:users'
                ];
            if ($id != null || $email_viejo != null) { 
                $email = DB::select('SELECT email FROM users WHERE users.id = ?', [$id]);
                if ($email[0]->email == $email_viejo) {
                    return [
                        'name'  => 'required|string|max:65',
                        'email' => 'required|string|email|max:65'
                    ];    
                } else 
                    return $reglas;
            }
            return $reglas;
        }
    }
?>