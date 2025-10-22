<?php
/**
 * PHP script to connect to a MySQL database
 */

// Database configuration
$host = 'localhost'; // Change this to your MySQL server host
$dbname = 'your_database_name'; // Change this to your database name
$username = 'your_username'; // Change this to your MySQL username
$password = 'your_password'; // Change this to your MySQL password

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database!";
    
    // Example: Perform a simple query
    $stmt = $pdo->query("SELECT VERSION()");
    $version = $stmt->fetch();
    echo "\nMySQL version: " . $version[0];
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection
$pdo = null;
?>