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

    echo "Connected successfully";

    // Example: Perform a simple query
    $stmt = $pdo->query("SELECT 1");
    $result = $stmt->fetch();

    // Print the result of the query
    print_r($result);

} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection (optional as it closes automatically at the end of the script)
$pdo = null;
?>