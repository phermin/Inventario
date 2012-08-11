<?php

class Articulos extends ActiveRecord {

	protected $schema = 'cauchera';

	public function ListarArticulos($page, $ppage=10) {

		return $this->paginate("page: $page", "per_page: $ppage", 'order: categoria_id asc');
		//$sql = "select codart, descripcion_art, stock, precio, nombre from articulos as b inner join categoria as a on (b.categoria_id = a.id)";
		//return $this->paginate_by_sql($sql, "page: $page", "per_page: $ppage", 'order: categoria_id asc');

		//SQL Postgres select * from articulos inner join categoria on (articulos.categoria_id = categoria.id)
		//SQL Postgres SELECT codart, descripcion_art, stock, precio, nombre from articulos as b inner join categoria as a on (b.categoria_id = a.id)

	}
	
	public function filtro($id) {
		
		return $this->find('columns: categoria_id', "codart like '%{$id}%'");
		
	}

}

?>