<?php
// MySQL Database Connection Script
// Generated on: <?php echo @date('Y-m-d H:i:s'); ?>

// Database configuration
$host = 'localhost';
$dbname = 'test_database';
$username = 'db_user';
$password = 'db_password';

try {
    // Create a new PDO connection
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ];
    
    $pdo = new PDO($dsn, $username, $password, $options);
    
    echo "Success: Connected to the MySQL database '$dbname' successfully.\n";
    
    // Example query to show database version
    $stmt = $pdo->query("SELECT VERSION() as version");
    $row = $stmt->fetch();
    echo "Database version: " . $row['version'] . "\n";
    
} catch (PDOException $e) {
    echo "Error: Connection failed - " . $e->getMessage() . "\n";
}

// Close connection
$pdo = null;
?>