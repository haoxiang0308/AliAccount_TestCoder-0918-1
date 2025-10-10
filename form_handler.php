<?php
// Обработка формы и сохранение данных в файл

// Проверяем, был ли отправлен запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Простая валидация (проверка на пустоту)
    if (empty($name) || empty($email) || empty($message)) {
        die("Все поля обязательны для заполнения.");
    }

    // Формируем строку для записи в файл
    $data = "Имя: " . $name . "\n";
    $data .= "Email: " . $email . "\n";
    $data .= "Сообщение: " . $message . "\n";
    $data .= "------------------------\n";

    // Генерируем случайное имя файла
    // В реальном приложении имя файла может зависеть от даты или других факторов
    // Для демонстрации используем uniqid()
    $filename = '/workspace/form_data_' . uniqid() . '.txt';

    // Пытаемся открыть файл для дозаписи
    $file = fopen($filename, 'a');

    if ($file) {
        // Записываем данные в файл
        fwrite($file, $data);
        fclose($file);
        echo "Данные успешно сохранены в файл: " . $filename;
    } else {
        echo "Ошибка: не удалось открыть файл для записи.";
    }
} else {
    // Если запрос не POST, выводим простую форму для тестирования
    ?>
    <html>
    <body>
        <form method="post" action="">
            <p><label>Имя: <input type="text" name="name" required></label></p>
            <p><label>Email: <input type="email" name="email" required></label></p>
            <p><label>Сообщение: <textarea name="message" required></textarea></label></p>
            <p><input type="submit" value="Отправить"></p>
        </form>
    </body>
    </html>
    <?php
}
?>