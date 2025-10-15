<?php

class Car {
    private $brand;
    private $model;
    private $isRunning = false;
    
    public function __construct($brand = "Unknown", $model = "Unknown") {
        $this->brand = $brand;
        $this->model = $model;
    }
    
    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->brand} {$this->model} is now running.\n";
        } else {
            echo "The car is already running.\n";
        }
    }
    
    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->brand} {$this->model} has been stopped.\n";
        } else {
            echo "The car is already stopped.\n";
        }
    }
    
    public function getStatus() {
        return $this->isRunning ? "running" : "stopped";
    }
}

// Example usage:
// $myCar = new Car("Toyota", "Camry");
// $myCar->start();