<?php
// MySQL Database Connection Script

// Database configuration
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database!";
    
    // Optional: Perform a simple query to test the connection
    $stmt = $pdo->query("SELECT 1");
    $result = $stmt->fetch();
    
    if ($result) {
        echo "\nDatabase query test successful!";
    }
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection
$pdo = null;
?>