<?php
// Скрипт для обработки данных формы

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем данные из формы
    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));

    // Валидация данных
    $errors = [];
    if (empty($name)) {
        $errors[] = "Имя обязательно для заполнения.";
    }
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Пожалуйста, введите корректный email.";
    }
    if (empty($message)) {
        $errors[] = "Сообщение не может быть пустым.";
    }

    // Если есть ошибки, выводим их
    if (!empty($errors)) {
        foreach ($errors as $error) {
            echo "<p style='color: red;'>$error</p>";
        }
    } else {
        // Обработка данных (например, сохранение в файл или отправка email)
        $data = "Имя: $name\nEmail: $email\nСообщение: $message\n\n";
        file_put_contents('form_submissions.txt', $data, FILE_APPEND | LOCK_EX);
        
        echo "<p style='color: green;'>Форма успешно отправлена!</p>";
    }
} else {
    // Если скрипт вызван не методом POST, показываем форму
    echo '
    <form method="post" action="">
        <label for="name">Имя:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="message">Сообщение:</label><br>
        <textarea id="message" name="message" rows="5" required></textarea><br><br>
        
        <input type="submit" value="Отправить">
    </form>
    ';
}
?>