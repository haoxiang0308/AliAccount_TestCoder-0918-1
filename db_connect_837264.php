<?php
// Database configuration
$servername = "localhost";
$username = "your_username"; // Replace with your MySQL username
$password = "your_password"; // Replace with your MySQL password
$dbname = "your_database";   // Replace with your database name

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Connected successfully to the database!";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// It's good practice to close the connection when done, although PHP does it automatically at the end of the script.
// $pdo = null;
?>