<?php

class routeInformationGetter
{
    public static $googleMapsDirectionPrefix = "http://maps.googleapis.com/maps/api/directions/json?"; 
    public $parameters;
    public $timeType;
    public $timeTypeString;
    public $transitLine;
    public $transitType;
    public $timestamp;
    public $startLocation;
    public $endLocation;
    public $response;

    public function __construct ()
    {
        $this->parameters = $_GET;
        $this->timeType = $this->parameters["timeType"];
        $this->transitLine = $this->parameters["transitLine"];

        $this->transitType = "transit"; // Set transit type by default.
        $this->timestamp = $this->parameters["time"];
        $this->startLocation = $this->parameters["startLocation"];
        $this->endLocation = $this->parameters["endLocation"];

        switch ($this->timeType) {
            case "startTime":
                $this->timeTypeString = "&departure_time=$this->timestamp";
                break;
            case "endTime":
                $this->timeTypeString = "&arrival_time=$this->timeStamp";
            default:
                $this->returnError("The timeType parameter was invalid.");
        }
    }

    public function returnResponse ()
    {
        switch ($this->transitLine) {
            case "caltrain":
                $this->getCaltrainInformation();
                break;
            case "bart":
            $this->getBARTInformation();
                break;
            case "munirail":
                $this->getMUNIRailInformation();
                break;
            case "walk":
                $this->transitType = "walking";
                $this->getWalkingInformation();
                break;
            case "vtarail":
                $this->getVTARailInformation();
                break;
        }
    }

    public function getCaltrainInformation ()
    {
        $this->startLocation = "$this->startLocation Caltrain Station";
        $this->endLocation = "$this->endLocation Caltrain Station";
        $this->makeRequest();
    }

    public function getBARTInformation ()
    {
        $this->startLocation = "$this->startLocation BART Station";
        $this->endLocation = "$this->endLocation BART Station".
        $this->makeRequest();
    }

    public function getMUNIRailInformation ()
    {
        $this->startLocation = "$this->startLocation MUNI Rail Station";
        $this->endLocation = "$this->endLocation MUNI Rail Station";
        $this->makeRequest();
    }

    public function getWalkInformation ()
    {
        $this->makeRequest(); 
    }

    public function getVTARailInformation ()
    {
        $this->startLocation = "$this->startLocation VTA Rail Station";
        $this->endLocation = "$this->endLocation VTA Rail Station";
        $this->makeRequest();
    }

    private function makeRequest ()
    {
        // Construct URL parameter.
        $url = $googleMapsDirectionPrefix +
            "origin=$this->startLocation" +
            "&destination=$this->endLocation" +
            "&mode=$this->transitType" +
            "&sensor=false" +
            "$this->timeTypeString";
        
        // Make the initial cURL call, set URL to download, ask to 
        // return (not print out) the data, ask not to include header,
        $request = curl_init();
        curl_setopt($request, CURLOPT_URL, $url);
        curl_setopt($request, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($request, CURLOPT_HEADER, 1);

        $this->response = curl_exec($request);
        if($this->transitType == "walking")
	        $this->parseResponse();
    }

    private function parseResponse ()
    {
        $parsedResponse = json_decode($this->response);
		$string=file_get_contents($url);
		$json_response =json_decode($string, $assoc=true);
		$words = explode(' ', $duration_str); 
		$hrs = intval($words[0])*360000;
     	$mins = intval($words[2])*6000;
		
		if($this->timeType == 'startTime')
		{
        	$serverResponse = array(
            	"timeForDepart" => ($this->timestamp),
            	"timeToArrive" => ($this->timestamp+$hrs+$mins)
        		);
        }
        else
        {
        	$serverResponse = array(
            	"timeForDepart" => ($this->timestamp-$hrs-$mins),
            	"timeToArrive" => ($this->timestamp)
        		);
        }
        
    }

    private function returnSuccess ()
    {

    }

    private function returnError (string $message)
    {
        $response = array("status" => "error", "message" => $message);
        return json_encode($response);
    }
}

routeInformationGetter getter = new routeInformationGetter();
getter->returnResponse();
?>
