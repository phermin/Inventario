<?php 

class Articulos extends ActiveRecord {
	
	protected $schema = 'cauchera';
	
	public function ListarArticulos($page, $ppage=20) {
		
		return $this->paginate("page: $page", "per_page: $ppage", 'order: id desc');
		
	}
	
	public function consulta($id) {
		
		return $this->find($id);
	}
	
}

?>