<?php

Load::model('categoria');

class CategoriaController extends AppController {
	
	public function index() {
		
	}
	
	public function agregar() {
		
		if (Input::hasPost('categoria')) {
			
			$categoria = new Categoria(Input::post('categoria'));
			
			if ($categoria->save()) {
				Flash::success('<div class="alert alert-success"><button class="close" data-dismiss="alert">×</button>Los datos han sido almacenados correctamente</div>');
				Input::delete();
				return;
			} else {
				Flash::warning('<div class="alert alert-error"><button class="close" data-dismiss="alert">×</button>Error al procesar los Datos</div>');
				Input::delete();
			}
		}
		
	}
	
}

?>