<?php

class mapImage
{
    public $parameters;

    public function __construct ()
    {
        $this->parameters = $_GET;
    }
    
    public function getMap()
    {
    	$url = 'http://maps.googleapis.com/maps/api/staticmap?'.
    			'&zoom='.$this->parameters["zoomValue"]. 
    			'&size=600x400&maptype=roadmap'.
    			'&markers=color:blue%7Clabel:B%7C'.$this->parameters["startLocation"].
    			'&markers=color:green%7Clabel:E%7C.'. $this->parameters["endLocation"].
    			'&sensor=false';
    	$arr = ["url" => $url];
    	echo json_encode($arr);
    }
    
    
}

?>
