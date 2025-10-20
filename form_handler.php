<?php
/**
 * PHP script to handle form processing
 * This script processes form data and saves it to a file
 */

// Function to generate a random filename
function generateRandomFileName($extension = 'txt') {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < 10; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString . '.' . $extension;
}

// Process the form if it's submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect form data
    $formData = [];
    
    // Process all POST data
    foreach ($_POST as $key => $value) {
        if (is_array($value)) {
            $formData[$key] = array_map('htmlspecialchars', $value);
        } else {
            $formData[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
        }
    }
    
    // Generate a random filename
    $randomFileName = generateRandomFileName('txt');
    $filePath = __DIR__ . '/' . $randomFileName;
    
    // Prepare data to save
    $dataToSave = "Form Submission - " . date('Y-m-d H:i:s') . "\n";
    $dataToSave .= "----------------------------------------\n";
    foreach ($formData as $key => $value) {
        if (is_array($value)) {
            $dataToSave .= "$key: " . implode(', ', $value) . "\n";
        } else {
            $dataToSave .= "$key: $value\n";
        }
    }
    $dataToSave .= "----------------------------------------\n\n";
    
    // Save the form data to the randomly named file
    if (file_put_contents($filePath, $dataToSave, FILE_APPEND | LOCK_EX)) {
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Form data saved to file: <strong>$randomFileName</strong></p>";
        echo "<p>Saved data:</p>";
        echo "<pre>" . htmlspecialchars($dataToSave) . "</pre>";
    } else {
        echo "<h2>Error saving form data!</h2>";
        echo "<p>Could not save the form data to a file.</p>";
    }
} else {
    // Display a simple form for testing
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Form Processing Example</title>
        <style>
            body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; font-weight: bold; }
            input, textarea, select { width: 100%; padding: 8px; margin-bottom: 5px; }
            button { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; cursor: pointer; }
            button:hover { background-color: #45a049; }
        </style>
    </head>
    <body>
        <h1>Form Processing Example</h1>
        <form method="POST" action="">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="subject">Subject:</label>
                <select id="subject" name="subject">
                    <option value="general">General Inquiry</option>
                    <option value="support">Support</option>
                    <option value="feedback">Feedback</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            
            <div class="form-group">
                <label>Interests (multiple selection allowed):</label>
                <input type="checkbox" id="interest1" name="interests[]" value="technology"> <label for="interest1">Technology</label><br>
                <input type="checkbox" id="interest2" name="interests[]" value="sports"> <label for="interest2">Sports</label><br>
                <input type="checkbox" id="interest3" name="interests[]" value="music"> <label for="interest3">Music</label><br>
            </div>
            
            <button type="submit">Submit Form</button>
        </form>
    </body>
    </html>
    <?php
}
?>