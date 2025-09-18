<?php
// form_handler.php - A simple PHP script to handle form submissions

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect and sanitize input data
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $message = htmlspecialchars($_POST['message'] ?? '');
    
    // Validate input data
    if (empty($name) || empty($email) || empty($message)) {
        echo "All fields are required.";
        exit;
    }
    
    // Create a random filename
    $random_string = bin2hex(random_bytes(8));
    $filename = "/workspace/php_form_handler/submission_" . $random_string . ".txt";
    
    // Prepare data for saving
    $data = "Name: " . $name . "\n";
    $data .= "Email: " . $email . "\n";
    $data .= "Message: " . $message . "\n";
    $data .= "Submitted on: " . date("Y-m-d H:i:s") . "\n";
    $data .= str_repeat("-", 40) . "\n";
    
    // Save data to file
    if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
        echo "Form submitted successfully! Data saved to " . $filename;
    } else {
        echo "Error saving data.";
    }
} else {
    // Display the form if not a POST request
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Simple Form Handler</title>
    </head>
    <body>
        <h2>Contact Form</h2>
        <form method="post" action="">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Message:</label><br>
            <textarea id="message" name="message" rows="4" cols="50" required></textarea><br><br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
    </html>
    <?php
}
?>