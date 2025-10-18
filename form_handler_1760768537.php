<?php
/**
 * Advanced Form Processing Script
 * Handles form submissions with validation, sanitization, and file logging
 */

// Configuration
define('LOG_FILE', 'form_logs_' . date('Y-m-d') . '.log');
define('DATA_FILE', 'form_data_' . date('Y-m-d') . '.json');

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Function to validate email
function validateEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

// Function to validate URL if present
function validateUrl($url) {
    if (empty($url)) return true; // URL is optional
    return filter_var($url, FILTER_VALIDATE_URL) !== false;
}

// Function to log form activity
function logActivity($message) {
    $timestamp = date('Y-m-d H:i:s');
    $logEntry = "[$timestamp] $message\n";
    file_put_contents(LOG_FILE, $logEntry, FILE_APPEND | LOCK_EX);
}

// Function to validate required fields
function validateRequired($field, $fieldName) {
    if (empty($field)) {
        return $fieldName . " is required.";
    }
    return null;
}

// Function to validate field length
function validateLength($field, $min, $max, $fieldName) {
    $len = strlen($field);
    if ($len < $min) {
        return $fieldName . " must be at least $min characters.";
    }
    if ($len > $max) {
        return $fieldName . " must not exceed $max characters.";
    }
    return null;
}

// Main form processing function
function processForm() {
    $errors = [];
    $success = false;
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Process name (required, 2-50 chars)
        $name = sanitizeInput($_POST["name"] ?? "");
        if ($error = validateRequired($name, "Name")) {
            $errors[] = $error;
        } elseif ($error = validateLength($name, 2, 50, "Name")) {
            $errors[] = $error;
        }
        
        // Process email (required)
        $email = sanitizeInput($_POST["email"] ?? "");
        if ($error = validateRequired($email, "Email")) {
            $errors[] = $error;
        } elseif (!validateEmail($email)) {
            $errors[] = "Invalid email format.";
        }
        
        // Process subject (optional, max 100 chars)
        $subject = sanitizeInput($_POST["subject"] ?? "");
        if (!empty($subject) && $error = validateLength($subject, 1, 100, "Subject")) {
            $errors[] = $error;
        }
        
        // Process message (required, 10-1000 chars)
        $message = sanitizeInput($_POST["message"] ?? "");
        if ($error = validateRequired($message, "Message")) {
            $errors[] = $error;
        } elseif ($error = validateLength($message, 10, 1000, "Message")) {
            $errors[] = $error;
        }
        
        // Process website URL (optional)
        $website = sanitizeInput($_POST["website"] ?? "");
        if (!empty($website) && !validateUrl($website)) {
            $errors[] = "Invalid website URL format.";
        }
        
        // Process consent checkbox
        $consent = isset($_POST["consent"]);
        if (!$consent) {
            $errors[] = "You must agree to the terms and conditions.";
        }
        
        // If no errors, save data
        if (empty($errors)) {
            $formData = [
                'name' => $name,
                'email' => $email,
                'subject' => $subject,
                'message' => $message,
                'website' => $website,
                'consent' => $consent,
                'ip_address' => $_SERVER['REMOTE_ADDR'] ?? '',
                'user_agent' => $_SERVER['HTTP_USER_AGENT'] ?? '',
                'timestamp' => date('Y-m-d H:i:s')
            ];
            
            // Save to JSON file
            $data = [];
            if (file_exists(DATA_FILE)) {
                $data = json_decode(file_get_contents(DATA_FILE), true) ?: [];
            }
            $data[] = $formData;
            
            if (file_put_contents(DATA_FILE, json_encode($data, JSON_PRETTY_PRINT))) {
                $success = true;
                logActivity("Form submission successful from $email");
            } else {
                $errors[] = "Failed to save form data.";
                logActivity("Form submission failed - could not save data");
            }
        } else {
            logActivity("Form submission failed - validation errors: " . implode(", ", $errors));
        }
    }
    
    return [
        'success' => $success,
        'errors' => $errors,
        'data' => $_POST
    ];
}

// Function to display form
function displayForm() {
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Advanced Contact Form</title>
        <style>
            body { 
                font-family: Arial, sans-serif; 
                max-width: 700px; 
                margin: 50px auto; 
                padding: 20px; 
                background-color: #f5f5f5;
            }
            .container {
                background: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            .form-group { 
                margin-bottom: 20px; 
            }
            label { 
                display: block; 
                margin-bottom: 8px; 
                font-weight: bold; 
                color: #333;
            }
            input, textarea, select { 
                width: 100%; 
                padding: 12px; 
                border: 1px solid #ddd; 
                border-radius: 4px; 
                box-sizing: border-box;
            }
            input:focus, textarea:focus, select:focus {
                outline: none;
                border-color: #4CAF50;
                box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
            }
            button { 
                background-color: #4CAF50; 
                color: white; 
                padding: 12px 30px; 
                border: none; 
                border-radius: 4px; 
                cursor: pointer; 
                font-size: 16px;
            }
            button:hover { 
                background-color: #45a049; 
            }
            .error { 
                color: #d9534f; 
                background-color: #f9f0f0;
                padding: 10px;
                border-radius: 4px;
                margin-bottom: 15px;
                border-left: 4px solid #d9534f;
            }
            .success { 
                color: #5cb85c; 
                background-color: #f0f9f0;
                padding: 15px;
                border-radius: 4px;
                margin-bottom: 15px;
                border-left: 4px solid #5cb85c;
            }
            .checkbox-group {
                display: flex;
                align-items: flex-start;
            }
            .checkbox-group input {
                width: auto;
                margin-right: 10px;
                margin-top: 5px;
            }
            .checkbox-group label {
                margin-bottom: 0;
                font-weight: normal;
                display: inline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Contact Us</h2>
            <form method="post" action="">
                <div class="form-group">
                    <label for="name">Full Name *</label>
                    <input type="text" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" id="subject" name="subject">
                </div>
                
                <div class="form-group">
                    <label for="website">Website (Optional)</label>
                    <input type="url" id="website" name="website" placeholder="https://example.com">
                </div>
                
                <div class="form-group">
                    <label for="message">Message *</label>
                    <textarea id="message" name="message" rows="6" placeholder="Please enter your message here..." required></textarea>
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="consent" name="consent" required>
                    <label for="consent">I agree to the terms and conditions and privacy policy *</label>
                </div>
                
                <button type="submit">Send Message</button>
            </form>
        </div>
    </body>
    </html>
    <?php
}

// Main execution
if ($_SERVER["REQUEST_METHOD"] != "POST") {
    displayForm();
} else {
    $result = processForm();
    
    if ($result['success']) {
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>Submission Successful</title>
            <style>
                body { 
                    font-family: Arial, sans-serif; 
                    max-width: 600px; 
                    margin: 50px auto; 
                    padding: 20px; 
                    background-color: #f5f5f5;
                }
                .container {
                    background: white;
                    padding: 30px;
                    border-radius: 8px;
                    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                    text-align: center;
                }
                .success { 
                    color: #5cb85c; 
                    background-color: #f0f9f0;
                    padding: 15px;
                    border-radius: 4px;
                    margin-bottom: 20px;
                    border-left: 4px solid #5cb85c;
                }
                a {
                    display: inline-block;
                    background-color: #4CAF50;
                    color: white;
                    padding: 10px 20px;
                    text-decoration: none;
                    border-radius: 4px;
                }
                a:hover {
                    background-color: #45a049;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="success">
                    <h2>Thank You!</h2>
                    <p>Your message has been submitted successfully.</p>
                    <p>We will get back to you as soon as possible.</p>
                </div>
                <a href="">Submit Another Form</a>
            </div>
        </body>
        </html>
        <?php
    } else {
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>Submission Failed</title>
            <style>
                body { 
                    font-family: Arial, sans-serif; 
                    max-width: 600px; 
                    margin: 50px auto; 
                    padding: 20px; 
                    background-color: #f5f5f5;
                }
                .container {
                    background: white;
                    padding: 30px;
                    border-radius: 8px;
                    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                }
                .error { 
                    color: #d9534f; 
                    background-color: #f9f0f0;
                    padding: 15px;
                    border-radius: 4px;
                    margin-bottom: 20px;
                    border-left: 4px solid #d9534f;
                }
                a {
                    display: inline-block;
                    background-color: #d9534f;
                    color: white;
                    padding: 10px 20px;
                    text-decoration: none;
                    border-radius: 4px;
                }
                a:hover {
                    background-color: #c9302c;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="error">
                    <h2>Submission Failed</h2>
                    <p>Please correct the following errors:</p>
                    <ul style="text-align: left;">
                        <?php foreach ($result['errors'] as $error): ?>
                            <li><?php echo htmlspecialchars($error); ?></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
                <a href="">Go Back and Try Again</a>
            </div>
        </body>
        </html>
        <?php
    }
}
?>