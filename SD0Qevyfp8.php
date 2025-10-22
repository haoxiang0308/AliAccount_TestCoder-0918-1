<?php

class Car {
    private $isRunning = false;
    private $model;
    private $color;

    public function __construct($model = "Unknown", $color = "Unknown") {
        $this->model = $model;
        $this->color = $color;
    }

    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->color} {$this->model} car has started.\n";
        } else {
            echo "The car is already running.\n";
        }
    }

    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->color} {$this->model} car has stopped.\n";
        } else {
            echo "The car is already stopped.\n";
        }
    }

    public function getStatus() {
        return $this->isRunning ? "running" : "stopped";
    }
}

// Example usage:
$myCar = new Car("Toyota", "red");
echo "Car status: " . $myCar->getStatus() . "\n";
$myCar->start();
echo "Car status: " . $myCar->getStatus() . "\n";
$myCar->start(); // Try starting again
$myCar->stop();
echo "Car status: " . $myCar->getStatus() . "\n";