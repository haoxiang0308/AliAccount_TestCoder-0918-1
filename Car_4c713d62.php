<?php

class Car {
    private $make;
    private $model;

    public function __construct($make, $model) {
        $this->make = $make;
        $this->model = $model;
    }

    public function start() {
        echo "The {$this->make} {$this->model} is starting...\n";
    }
}
