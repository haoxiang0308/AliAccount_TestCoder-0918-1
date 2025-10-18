<?php
/**
 * PHP Script to Connect to MySQL Database
 * 
 * This script demonstrates different methods to connect to a MySQL database
 * using both MySQLi and PDO extensions.
 */

// Database configuration
$host = 'localhost';        // Database host
$username = 'your_username'; // Database username
$password = 'your_password'; // Database password
$database = 'your_database'; // Database name
$port = 3306;               // Database port (default: 3306)

// Method 1: MySQLi Procedural
echo "<h3>Method 1: MySQLi Procedural</h3>\n";
$connection = mysqli_connect($host, $username, $password, $database, $port);

if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

echo "Connected successfully using MySQLi (procedural)<br>\n";

// Perform a simple query to test the connection
$result = mysqli_query($connection, "SELECT VERSION() as version");
if ($result) {
    $row = mysqli_fetch_assoc($result);
    echo "MySQL Version: " . $row['version'] . "<br>\n";
    mysqli_free_result($result);
}

// Close the connection
mysqli_close($connection);

// Method 2: MySQLi Object-Oriented
echo "<h3>Method 2: MySQLi Object-Oriented</h3>\n";
$mysqli = new mysqli($host, $username, $password, $database, $port);

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

echo "Connected successfully using MySQLi (object-oriented)<br>\n";

// Perform a simple query to test the connection
$result = $mysqli->query("SELECT VERSION() as version");
if ($result) {
    $row = $result->fetch_assoc();
    echo "MySQL Version: " . $row['version'] . "<br>\n";
    $result->free();
}

// Close the connection
$mysqli->close();

// Method 3: PDO (PHP Data Objects)
echo "<h3>Method 3: PDO</h3>\n";
try {
    $dsn = "mysql:host=$host;dbname=$database;charset=utf8mb4;port=$port";
    $pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
    
    echo "Connected successfully using PDO<br>\n";
    
    // Perform a simple query to test the connection
    $stmt = $pdo->query("SELECT VERSION() as version");
    $row = $stmt->fetch();
    echo "MySQL Version: " . $row['version'] . "<br>\n";
    
    // Close the connection
    $pdo = null;
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

echo "<p>All connection methods completed successfully!</p>\n";
?>