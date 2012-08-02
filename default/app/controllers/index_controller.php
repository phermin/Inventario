<?php

Load::model('usuarios');

class IndexController extends AppController {
	
	public function index() {
		
		Router::redirect('user/index');
		
	}
	
}
