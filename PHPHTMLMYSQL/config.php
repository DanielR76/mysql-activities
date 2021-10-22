<?php

class Conexion{
	
	public $user;
	public $pass;
	public $server;
	public $database;
	
	public function __construct(){
		
		$this->server = 'localhost';
		$this->user = 'root';
		$this->pass = '';
		$this->database = 'tutorials';
		
	}
	
	public function conectar(){
		
		$con = mysql_connect($this->server, $this->user, $this->pass);
		
		mysql_select_db($this->database, $con);
		
	}
	
}

?>