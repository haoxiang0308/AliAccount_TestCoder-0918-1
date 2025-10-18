<?php
// Simple form handler script
if ($_POST) {
    // Sanitize input data
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $message = htmlspecialchars($_POST['message'] ?? '');
    
    // Validate required fields
    $errors = [];
    if (empty($name)) {
        $errors[] = "Name is required";
    }
    if (empty($email)) {
        $errors[] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format";
    }
    
    if (empty($errors)) {
        // Process the form data (e.g., save to database, send email, etc.)
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Save to a file (in a real app, you'd likely use a database)
        $logFile = 'form_submissions.txt';
        file_put_contents($logFile, json_encode($data) . "\n", FILE_APPEND | LOCK_EX);
        
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Thank you, {$name}. Your message has been received.</p>";
    } else {
        echo "<h2>Errors occurred:</h2><ul>";
        foreach ($errors as $error) {
            echo "<li>" . htmlspecialchars($error) . "</li>";
        }
        echo "</ul>";
        echo '<a href="javascript:history.back()">Go back</a>';
    }
} else {
    // Display the form if no POST data
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Form Example</title>
    </head>
    <body>
        <h2>Contact Form</h2>
        <form method="post" action="">
            <p>
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" required>
            </p>
            <p>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" required>
            </p>
            <p>
                <label for="message">Message:</label><br>
                <textarea id="message" name="message"></textarea>
            </p>
            <p>
                <input type="submit" value="Submit">
            </p>
        </form>
    </body>
    </html>
    <?php
}
?>