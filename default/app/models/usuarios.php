<?php 

class Usuarios extends ActiveRecord {
	
	protected $schema = 'cauchera';
	
	public function getUsuarios($page, $ppage = 10) {
		
		return $this->paginate("page: $page", "ppage: $ppage", 'order: id asc' );
	}
}

?>