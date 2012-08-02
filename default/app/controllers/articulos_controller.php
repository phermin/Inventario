<?php 

Load::models('articulos', 'categoria');

class ArticulosController extends AppController {
	
	public function index() {
		
	}
	
	public function agregar() {
		
		if (Auth::is_valid()) {
				
		if (Input::hasPost('articulos')) {
			
			$articulos = new Articulos(Input::post('articulos'));
			
			if ($articulos->save()) {
				Flash::success('<div class="alert alert-success"><button class="close" data-dismiss="alert">×</button>Los datos han sido almacenados correctamente</div>');
				Input::delete();
				return;
			} else {
				Flash::warning('<div class="alert alert-error"><button class="close" data-dismiss="alert">×</button>Error al procesar los Datos</div>');
				Input::delete();
			}
		}
		
	} else {
		Flash::warning('<div class="alert alert-warning"><button class="close" data-dismiss="alert">×</button>No ha iniciado sesion.</div>');
		Router::redirect('user/index');
	}
	
	}
	
	public function ver($id) {
		
		if (Auth::is_valid()) {
			
			$articulos = new Articulos();
			$this->articulo = $articulos->consulta($id);
				
		}
		
	}
	
	public function modificar($id) {
		
		//if (Auth::is_valid()) {
			
			$articulos = new Articulos();
			
			if (Input::hasPost('articulos')) { print_r($articulos);
				
				if ($articulos->update(Input::post('articulos'))) {
					
					Flash::success('<div class="alert alert-success"><button class="close" data-dismiss="alert">×</button>Los datos han sido almacenados correctamente</div>');
					return Router::redirect();
					
				} else {
					
					Flash::warning('<div class="alert alert-error"><button class="close" data-dismiss="alert">×</button>Error al procesar los Datos</div>');
					//unset($articulos);
				}
				
			} else {
				
				$this->articulos = $articulos->consulta((int)$id);
			}
			
		//} else {
			
			//Flash::warning('<div class="alert alert-warning"><button class="close" data-dismiss="alert">×</button>No ha iniciado sesion.</div>');
		//}
	}
	
	public function eliminar($id) {
		
		if (Auth::is_valid()) {
			
			
		}
	}
	
	public function consulta($page = 1) {
		
		if (Auth::is_valid()) {
			
			$articulos = new Articulos();
			$this->lista = $articulos->ListarArticulos($page);
			
		} else {
			Flash::warning('<div class="alert alert-warning"><button class="close" data-dismiss="alert">×</button>No ha iniciado sesion.</div>');
		}
	}
	
}

?>