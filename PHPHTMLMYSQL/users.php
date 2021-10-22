<?php

class Usuarios{
	
	public function __construct(){ 	}
	
	public function login_in(){
		
		$result = mysql_query("SELECT * FROM users WHERE loginName = '" . $_POST['usern'] . "' 
			AND passuser = '" . $_POST['pass'] . "' ");
		
		if($row=mysql_fetch_array($result)){
			
			$role = $row["profile"];
			
			switch($role){
				
				case 'default':
				
					header('location: defult/');
					break;
				
				case 'Admin':
					header('location: admin/');
					break;
					
				case 'secretary':
					header('location: secretary/');
					break;
				
			}
			
		}else{
			echo "Usuario no existe en la base de datos...";
		}
		
	}
	
}

?>