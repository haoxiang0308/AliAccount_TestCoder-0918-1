<?php
// Include the magic class
require_once 'D4X9c1bPJQv6.php';

// Create an instance of the magic class
$obj = new MagicClass();

// Test the __set magic method
$obj->name = 'John Doe';
$obj->age = 30;

// Test the __get magic method
echo $obj->name . "\n";
echo $obj->age . "\n";

// Test the __isset magic method
var_dump(isset($obj->name));
var_dump(isset($obj->email));

// Test the __toString magic method
echo $obj . "\n";

// Test the __invoke magic method (if the object is called as a function)
echo $obj('test parameter') . "\n";

// Test the __call magic method (calling a method that doesn't exist)
echo $obj->someUndefinedMethod('arg1', 'arg2') . "\n";

// Test the __unset magic method
unset($obj->age);
var_dump(isset($obj->age));
?>