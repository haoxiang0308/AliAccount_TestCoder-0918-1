<?php

class Car {
    private string $make;
    private string $model;
    private bool $isRunning = false;

    public function __construct(string $make, string $model) {
        $this->make = $make;
        $this->model = $model;
    }

    public function start(): void {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->make} {$this->model} has started.\n";
        } else {
            echo "The {$this->make} {$this->model} is already running.\n";
        }
    }
}