<?php 

class Proveedores extends ActiveRecord {
	
	protected $schema = 'cauchera';
	
	public function getProveedores($page, $ppage = 10) {
		
		return $this->paginate("page: $page", "per_page: $ppage", 'order: id asc');
	}
}

?>