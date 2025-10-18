<?php

class Car {
    private $brand;
    private $model;
    private $isRunning;
    
    public function __construct($brand = 'Unknown', $model = 'Unknown') {
        $this->brand = $brand;
        $this->model = $model;
        $this->isRunning = false;
    }
    
    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->brand} {$this->model} engine has started.\n";
        } else {
            echo "The {$this->brand} {$this->model} is already running.\n";
        }
    }
    
    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->brand} {$this->model} engine has stopped.\n";
        } else {
            echo "The {$this->brand} {$this->model} is already stopped.\n";
        }
    }
    
    public function getBrand() {
        return $this->brand;
    }
    
    public function getModel() {
        return $this->model;
    }
    
    public function isRunning() {
        return $this->isRunning;
    }
}

// Example usage:
$myCar = new Car('Toyota', 'Camry');
$myCar->start();