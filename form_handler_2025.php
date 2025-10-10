<?php
// Проверяем, был ли запрос отправлен методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Определяем имена полей формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Простая валидация (проверка на пустоту)
    if (!empty($name) && !empty($email) && !empty($message)) {
        // Экранируем данные для вывода в HTML
        $name = htmlspecialchars($name);
        $email = htmlspecialchars($email);
        $message = htmlspecialchars($message);

        // Здесь можно добавить код для отправки email или сохранения в базу данных
        // mail($email, 'Обратная связь', $message);

        // Выводим сообщение об успешной обработке
        echo "<h2>Спасибо, $name! Ваше сообщение отправлено.</h2>";
        echo "<p><strong>Email:</strong> $email</p>";
        echo "<p><strong>Сообщение:</strong> $message</p>";
    } else {
        // Выводим сообщение об ошибке, если какие-то поля пусты
        echo "<p style='color:red;'>Ошибка: Пожалуйста, заполните все поля формы.</p>";
    }
} else {
    // Если запрос не POST, перенаправляем на главную страницу или показываем ошибку
    header("Location: /");
    exit();
}
?>