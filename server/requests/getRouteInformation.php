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

    public function getCaltrainInformation ()
    {

    }

    public function getBARTInformation ()
    {

    }

    public function getMUNIRailInformation ()
    {

    }

    public function getWalkInformation ()
    {

    }
}

routeInformationGetter getter = new routeInformationGetter();
getter->returnResponse();
?>
