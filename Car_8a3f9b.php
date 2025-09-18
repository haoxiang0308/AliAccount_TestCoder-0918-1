<?php

class Car {
    private $isRunning = false;
    private $model;

    public function __construct($model) {
        $this->model = $model;
    }

    public function start() {
        if ($this->isRunning) {
            echo "The car is already running.\n";
        } else {
            $this->isRunning = true;
            echo "The car {$this->model} has started.\n";
        }
    }

    public function stop() {
        if (!$this->isRunning) {
            echo "The car is already stopped.\n";
        } else {
            $this->isRunning = false;
            echo "The car {$this->model} has stopped.\n";
        }
    }

    public function isRunning() {
        return $this->isRunning;
    }
}

// Example usage:
// $myCar = new Car("Toyota Camry");
// $myCar->start();
// $myCar->stop();

?>