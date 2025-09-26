<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Определяем переменные и устанавливаем им начальное пустое значение
    $name = $email = $comment = "";
    $nameErr = $emailErr = "";

    // Обработка поля 'name'
    if (empty($_POST["name"])) {
        $nameErr = "Имя обязательно.";
    } else {
        $name = test_input($_POST["name"]);
        // Проверяем, что имя содержит только буквы и пробелы
        if (!preg_match("/^[a-zA-Z-' ]*$/",$name)) {
            $nameErr = "Только буквы и пробелы разрешены.";
        }
    }

    // Обработка поля 'email'
    if (empty($_POST["email"])) {
        $emailErr = "Email обязателен.";
    } else {
        $email = test_input($_POST["email"]);
        // Проверяем формат email
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Неверный формат email.";
        }
    }

    // Обработка поля 'comment'
    if (!empty($_POST["comment"])) {
        $comment = test_input($_POST["comment"]);
    }


    // Если ошибок нет, можно обработать данные дальше (например, сохранить в базу данных)
    if (empty($nameErr) && empty($emailErr)) {
        // Пример: сохранение в файл (НЕ рекомендуется для продакшена без мер безопасности)
        $data = "Имя: " . $name . " | Email: " . $email . " | Комментарий: " . $comment . "\n";
        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);

        echo "<h2>Данные формы успешно отправлены!</h2>";
        echo "<p><strong>Имя:</strong> " . htmlspecialchars($name) . "</p>";
        echo "<p><strong>Email:</strong> " . htmlspecialchars($email) . "</p>";
        echo "<p><strong>Комментарий:</strong> " . nl2br(htmlspecialchars($comment)) . "</p>";
    } else {
        // Выводим ошибки
        echo "<h2>Ошибки валидации:</h2>";
        echo "<p><strong>Ошибка имени:</strong> " . $nameErr . "</p>";
        echo "<p><strong>Ошибка email:</strong> " . $emailErr . "</p>";
    }
} else {
    // Если это не POST-запрос, просто выведем сообщение
    echo "Для обработки формы используйте POST-запрос.";
}

// Функция для обработки данных формы
function test_input($data) {
  $data = trim($data); // Удаляем пробелы из начала и конца
  $data = stripslashes($data); // Удаляем экранированные символы
  $data = htmlspecialchars($data); // Преобразуем специальные символы в HTML-сущности
  return $data;
}
?>