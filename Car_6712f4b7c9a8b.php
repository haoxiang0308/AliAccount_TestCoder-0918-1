<?php

class Car
{
    private $isRunning = false;
    
    public function start()
    {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "Car started successfully!\n";
            return true;
        } else {
            echo "Car is already running.\n";
            return false;
        }
    }
    
    public function stop()
    {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "Car stopped successfully!\n";
            return true;
        } else {
            echo "Car is already stopped.\n";
            return false;
        }
    }
    
    public function isRunning()
    {
        return $this->isRunning;
    }
}

?>