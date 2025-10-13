<?php

class Car {
    private $make;
    private $model;
    private $year;

    public function __construct($make, $model, $year) {
        $this->make = $make;
        $this->model = $model;
        $this->year = $year;
    }

    public function start() {
        echo "The {$this->year} {$this->make} {$this->model} is starting...\n";
    }
}

?>