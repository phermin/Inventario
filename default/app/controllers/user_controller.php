<?php 

Load::models('usuarios');

class UserController extends AppController {

	public function index() {

	}

	public function menu($page = 1) {

		$usuarios = new Usuarios();
		$this->usuarios = $usuarios->getUsuarios($page);

	}

	public function login() {

		if (Input::hasPost("nombre","password")) {

			$nombre = Input::post("nombre");
			$password = sha1(Input::post("password"));
			$usuario = new Usuarios();
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

		if (Auth::is_valid() and $rol != 'f') {

			$usuarios = new Usuarios();

			if (Input::hasPost('usuarios')) {

				$usuarios = Input::post('usuarios');

				if ($usuarios['password'] == $usuarios['password2']) {

					$usuarios['password'] = sha1($usuarios['password']);

					$usuarios = new Usuarios($usuarios);

					if ($usuarios->save()) {
						Flash::success('<div class="alert alert-success"><button class="close" data-dismiss="alert">×</button>Los datos han sido almacenados correctamente</div>');
						Router::redirect('user/menu');
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

			Flash::warning('<div class="alert"><button class="close" data-dismiss="alert">×</button>No tiene privilegios para realizar esta accion</div>');
			Router::redirect('menu/index');
		}

	}

	public function modificar($id) {

		$rol = Auth::get('tipo');

		if (Auth::is_valid() and $rol != 'f') {

			$usuarios = new Usuarios();

			if (Input::hasPost('usuarios')) {

				if ($usuarios->update(Input::post('usuarios'))) {

						Flash::success('Los datos fueron almacenados');
						Router::redirect('user/menu');

					} else {

						Flash::warning('error al procesar los datos');
						unset($usuarios);
						Router::redirect('user/menu');
					}

				} else {
					
					$this->usuarios = $usuarios->find_first((int)$id);
					
				}
					
		} else {
				
			Flash::warning('<div class="alert"><button class="close" data-dismiss="alert">×</button>No tiene privilegios para realizar esta accion</div>');
			Router::redirect('menu/index');
		}
	}

	public function eliminar($id) {

		$rol = Auth::get('tipo');

		if (Auth::is_valid() and $rol != 'f') {

			$usuario = new Usuarios();

			$this->usuario = $usuario->find_first((int)$id);

			if ($usuario->delete()) {

				Flash::success('<div class="alert alert-success"><button class="close" data-dismiss="alert">×</button>El usuario fue eliminado</div>');
				Router::redirect('user/menu');
			} else {

				Flash::error('<div class="alert alert-error"><button class="close" data-dismiss="alert">×</button>Error al procesar los Datos</div>');
				unset($usuario);
			}
		} else {

			Flash::warning('<div class="alert"><button class="close" data-dismiss="alert">×</button>No tiene privilegios para realizar esta accion</div>');
			Router::redirect('menu/index');
		}
	}
	
	public function pass() {

		$id = Auth::get('id');
		
		$usuario = new Usuarios();
		
		$this->usuario = $usuario->find_first((int)$id);
		
		if (Input::hasPost('usuarios')) {
			
			$usuario = Input::post('usuarios');
			
			//$password = sha1($usuario['password']);
			
			if ($usuario['password'] == $usuario['password2']) {
				
				$usuario = sha1($usuario['password']);
				
				$usuario = new Usuarios($usuario);
				
				if ($usuario->update_all($usuario)) {
					
					Flash::success('los datos fueron almacenados');
				} else {
					
					Flash::error('error al procesar los datos');
				}
				
			} else {
				
				Flash::success('las claves no coinciden');
			}
		}
		
	}

}

?>