<?php

class routeInformationGetter
{
    public static final $googleMapsDirection = "http://maps.googleapis.com/maps/api/directions_json?"; 
    public $parameters;

    public function __construct ()
    {
        $this->parameters = $_GET;
        
    }

    public function returnResponse ()
    {
        switch ($this->parameters["action"]) {
            case "startTime":
                break;
            case "endTime":
                break;
        }
    }


    //need startTime, startLocation, endLocation
    //assume transportMode is 
    
	$url = 'http://maps.googleapis.com/maps/api/directions/json?';
    public function getCaltrainInformation ()
    {
	  if($this->parameters["timeType"] == "startTime")
	  { 
	    $url_request = $url.
	    	'departure_time='$this->parameters["startTime"].
			'&origin='.$this->parameters["startLocation"].'|Caltrain'.
			'&destination='.$this->paramters["endLocation"].'|Caltrain'.
			'&mode=transit'.
			'&sensor=false'; 
		
	  }
	  else // "endTime"
	  {
	    $url_request = $url.
	    	'arrival_time='.$this->parameters["endTime"].
			'&origin='.$this->parameters["startLocation"].'|Caltrain'.
			'&destination='.$this->parameters["endLocation"].'|Caltrain'
			'&mode=transit'.
			'&sensor=false'; 
	  }
    }

    public function getBARTInformation ()
    {
	  if($this->parameters["timeType"] == "startTime")
	  { 
		$url_request = $url.
			'departure_time='.$this->parameters["startTime"].
			'&origin='.$this->parameters["startLocation"].'|Bart'
			'&destination='.$this->paramters["endLocation"].'|Bart'.
			'&mode=transit'.
			'&sensor=false'; 
	  }
	  else
	  {
		$url_request = $url.
			'arrival_time='.$this->parameters["endTime"].
			'&origin='.$this->parameters["startLocation"].'|Bart'
			'&destination='.$this->paramters["endLocation"].'|Bart'.
			'&mode=transit'.
			'&sensor=false';	  
	  }
    }

    public function getMUNIRailInformation ()
    {
	  if($this->parameters["timeType"] == "startTime")
	  {
	  	$url_request = $url.
			'departure_time='.$this->parameters["startTime"].
			'&origin='.$this->parameters["startLocation"].'|Muni'.
			'&destination='.$this->paramters["endLocation"].'|Muni'.
			'&mode=transit'.
			'&sensor=false'; 
	  }
	  else
	  {
	  	$url_request = $url.
			'arrival_time='.$this->parameters["endTime"].
			'&origin='.$this->parameters["startLocation"].'|Muni'.
			'&destination='.$this->paramters["endLocation"].'|Muni'.
			'&mode=transit'.
			'&sensor=false'; 
	  }
    }

    public function getWalkInformation ()
    {
	  if($this->parameters["timeType"] == "startTime")
	  {
	  	$url_request = $url.
			'departure_time='.$this->parameters["startTime"].
			'&origin='.$this->parameters["startLocation"].
			'&destination='.$this->paramters["endLocation"].
			'&mode=walking'.
			'&sensor=false'; 
	  }
	  else
	  {
	  	$url_request = $url.
			'arrival_time='.$this->parameters["endTime"].
			'&origin='.$this->parameters["startLocation"].
			'&destination='.$this->paramters["endLocation"].
			'&mode=walking'.
			'&sensor=false'; 
	  }
    }
}

routeInformationGetter getter = new routeInformationGetter();
getter->returnResponse();
?>
