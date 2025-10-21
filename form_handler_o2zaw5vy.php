<?php
// Form processing script
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message']) : '';
    
    // Validation
    $errors = [];
    if (empty($name)) {
        $errors[] = 'Name is required';
    }
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Valid email is required';
    }
    if (empty($message)) {
        $errors[] = 'Message is required';
    }
    
    if (empty($errors)) {
        // Save form data to a file or database
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Write to a log file
        $logFile = 'form_submissions.txt';
        file_put_contents($logFile, json_encode($data) . PHP_EOL, FILE_APPEND | LOCK_EX);
        
        echo "Form submitted successfully!";
    } else {
        echo "Errors occurred:" . PHP_EOL;
        foreach ($errors as $error) {
            echo "- " . $error . PHP_EOL;
        }
    }
} else {
    // Display form if accessed directly
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Sample Form</title>
    </head>
    <body>
        <form method="post" action="">
            <div>
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" required><br>
            </div>
            <div>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" required><br>
            </div>
            <div>
                <label for="message">Message:</label><br>
                <textarea id="message" name="message" required></textarea><br>
            </div>
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>
    <?php
}
?>