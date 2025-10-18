<?php
/**
 * Form Processing Script
 * Handles form submissions with validation and sanitization
 */

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Function to validate email
function validateEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

// Function to validate required fields
function validateRequired($field, $fieldName) {
    if (empty($field)) {
        return $fieldName . " is required.";
    }
    return null;
}

// Main form processing function
function processForm() {
    $errors = [];
    $success = false;
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Process name
        $name = sanitizeInput($_POST["name"] ?? "");
        $nameError = validateRequired($name, "Name");
        if ($nameError) {
            $errors[] = $nameError;
        }
        
        // Process email
        $email = sanitizeInput($_POST["email"] ?? "");
        $emailError = validateRequired($email, "Email");
        if ($emailError) {
            $errors[] = $emailError;
        } elseif (!validateEmail($email)) {
            $errors[] = "Invalid email format.";
        }
        
        // Process message
        $message = sanitizeInput($_POST["message"] ?? "");
        $messageError = validateRequired($message, "Message");
        if ($messageError) {
            $errors[] = $messageError;
        }
        
        // If no errors, save data
        if (empty($errors)) {
            $formData = [
                'name' => $name,
                'email' => $email,
                'message' => $message,
                'timestamp' => date('Y-m-d H:i:s')
            ];
            
            // Save to a file
            $filename = "form_submissions_" . date('Y-m-d') . ".json";
            $data = [];
            
            if (file_exists($filename)) {
                $data = json_decode(file_get_contents($filename), true) ?: [];
            }
            
            $data[] = $formData;
            
            if (file_put_contents($filename, json_encode($data, JSON_PRETTY_PRINT))) {
                $success = true;
            } else {
                $errors[] = "Failed to save form data.";
            }
        }
    }
    
    return [
        'success' => $success,
        'errors' => $errors,
        'data' => $_POST
    ];
}

// Generate HTML form if no POST data
if ($_SERVER["REQUEST_METHOD"] != "POST") {
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Form Example</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
            button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
            button:hover { background-color: #45a049; }
            .error { color: red; }
            .success { color: green; }
        </style>
    </head>
    <body>
        <h2>Contact Form</h2>
        <form method="post" action="">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>
    <?php
} else {
    // Process the form submission
    $result = processForm();
    
    if ($result['success']) {
        echo "<h2>Form Submitted Successfully!</h2>";
        echo "<p>Thank you for your submission.</p>";
        echo '<a href="">Submit another form</a>';
    } else {
        echo "<h2>Form Submission Failed</h2>";
        echo "<ul>";
        foreach ($result['errors'] as $error) {
            echo "<li class='error'>" . $error . "</li>";
        }
        echo "</ul>";
        echo '<a href="">Try again</a>';
    }
}
?>