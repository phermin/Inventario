<?php

class Categoria extends ActiveRecord {
	
	protected $schema = 'cauchera';
	
	public function initialize() {
	
		$this->has_many('articulos');
	}

}

?>