<?php

class MagicClass {
    private $data = array();
    
    // Magic method to set property values
    public function __set($name, $value) {
        echo "Setting '$name' to '$value'\n";
        $this->data[$name] = $value;
    }
    
    // Magic method to get property values
    public function __get($name) {
        echo "Getting '$name'\n";
        if (array_key_exists($name, $this->data)) {
            return $this->data[$name];
        }
        return null;
    }
    
    // Magic method to check if property exists
    public function __isset($name) {
        echo "Checking if '$name' is set\n";
        return isset($this->data[$name]);
    }
    
    // Magic method to unset property
    public function __unset($name) {
        echo "Unsetting '$name'\n";
        unset($this->data[$name]);
    }
    
    // Magic method called when object is treated as string
    public function __toString() {
        return 'MagicClass object with data: ' . json_encode($this->data);
    }
    
    // Magic method called when object is called as a function
    public function __invoke($param) {
        return 'MagicClass was called as a function with param: ' . $param;
    }
    
    // Magic method to call methods that don't exist
    public function __call($name, $arguments) {
        return 'Calling method ' . $name . ' with arguments: ' . json_encode($arguments);
    }
    
    // Magic method called when serializing
    public function __sleep() {
        echo "Serializing object\n";
        return array_keys($this->data);
    }
    
    // Magic method called when unserializing
    public function __wakeup() {
        echo "Unserializing object\n";
            $this->data = array();
        }
    }
    
    // Magic method called when cloning
    public function __clone() {
        echo "Cloning object\n";
        $this->data = unserialize(serialize($this->data));
    }
}

?>
