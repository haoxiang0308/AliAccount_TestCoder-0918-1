<?php
// PHP script to handle form processing
// This script processes form data and saves it appropriately

// Set content type
header('Content-Type: text/html; charset=utf-8');

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize and validate input data
    $formData = [];
    
    foreach ($_POST as $key => $value) {
        // Sanitize input data
        $formData[$key] = htmlspecialchars(trim($value), ENT_QUOTES, 'UTF-8');
    }
    
    // Example validation (you can customize this)
    $errors = [];
    
    // Example: Check if required fields are present
    if (empty($formData['name'])) {
        $errors[] = "Name is required";
    }
    
    if (empty($formData['email'])) {
        $errors[] = "Email is required";
    } elseif (!filter_var($formData['email'], FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format";
    }
    
    // If no errors, process the data
    if (empty($errors)) {
        // Save data to a file (or database)
        $filename = 'form_submissions_' . date('Y-m-d') . '.txt';
        $data = date('Y-m-d H:i:s') . " - " . json_encode($formData) . "\n";
        
        // Append to file
        file_put_contents($filename, $data, FILE_APPEND | LOCK_EX);
        
        // Success response
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Thank you for your submission.</p>";
        echo "<p><a href=''>Submit another form</a></p>";
    } else {
        // Show errors
        echo "<h2>Errors in form submission:</h2>";
        echo "<ul>";
        foreach ($errors as $error) {
            echo "<li>" . htmlspecialchars($error, ENT_QUOTES, 'UTF-8') . "</li>";
        }
        echo "</ul>";
        echo "<p><a href=''>Go back to form</a></p>";
    }
} else {
    // Show a simple form for testing
    echo "
    <h2>Sample Form</h2>
    <form method='POST' action=''>
        <div>
            <label for='name'>Name:</label><br>
            <input type='text' id='name' name='name' required><br>
        </div>
        <div>
            <label for='email'>Email:</label><br>
            <input type='email' id='email' name='email' required><br>
        </div>
        <div>
            <label for='message'>Message:</label><br>
            <textarea id='message' name='message'></textarea><br>
        </div>
        <div>
            <input type='submit' value='Submit'>
        </div>
    </form>";
}
?>