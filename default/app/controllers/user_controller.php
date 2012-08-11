<?php 
 
Load::model('usuarios');
 
class UserController extends AppController {

    public function index() {
         
    }
    
    public function menu() {
    
    }
    
    public function login() {
    	
    	if (Input::hasPost("nombre","password")) {
    			
    		$nombre = Input::post("nombre");
    		$password = sha1(Input::post("password"));
    		$usuario=new Usuarios();
    		$auth = new Auth("model", "class: usuarios", "nombre: $nombre", "password: $password");
    			
    		if ($auth->authenticate()) {
    			
    			Flash::notice('<div class="alert alert-info"><button class="close" data-dismiss="alert">×</button>Bienvenido(a): '.$nombre.'.</div>');
    			Router::redirect('menu/index');
    			
    			}else{
    				unset($password);
    				Flash::error('<div class="alert alert-error"><button class="close" data-dismiss="alert">×</button>El nombre de usuario o la contraseña introducidos no son correctos.</div>');
    				Router::redirect('user/index');
    	
    			}
    	
    		} else {
    			Flash::error("Falló:Loguing o Password Incorrectos ");
    		}
    	}
    
    public function logout() {
    	
    	Auth::destroy_identity('nombre');
    	Auth::destroy_identity('tipo');
    	Router::redirect('user/index');
    }
    
    public function crear() {
    	
    	$rol = Auth::get('tipo');
    	
    	if ($rol != 'f') { 
    	
    	$usuarios = new Usuarios();
         
        if (Input::hasPost('usuarios')) {
        	
            $usuarios = Input::post('usuarios');
             
            if ($usuarios['password'] == $usuarios['password2']) {
                 
                $usuarios['password'] = sha1($usuarios['password']);
                 
                $usuarios = new Usuarios($usuarios);
                 
                if ($usuarios->save()) {
                    Flash::success('<div class="alert alert-success"><button class="close" data-dismiss="alert">×</button>Los datos han sido almacenados correctamente</div>');
                } else {
                    Flash::error('<div class="alert alert-error"><button class="close" data-dismiss="alert">×</button>Error al procesar los Datos</div>');
                    unset($usuarios);
                }
                 
            } else { 
                Flash::warning('<div class="alert"><button class="close" data-dismiss="alert">×</button>Las claves no coinciden</div>');
                unset($usuarios['password']);
            }
        }
    } else {
    	
    	Flash::warning('No tiene privilegios para ejecutar esta accion');
    	Router::redirect('menu/index');
    }
    	
    }
     
}
 
?>