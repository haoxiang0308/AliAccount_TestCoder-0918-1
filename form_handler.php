<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Получаем данные из формы. Пример для полей 'name' и 'email'.
    $name = $_POST['name'] ?? 'Не указано';
    $email = $_POST['email'] ?? 'Не указано';

    // Подготавливаем данные для сохранения
    $data = "Имя: " . $name . "\n";
    $data .= "Email: " . $email . "\n";
    $data .= "Дата отправки: " . date('Y-m-d H:i:s') . "\n\n";

    // Генерируем случайное (уникальное) имя файла
    $random_filename = '/workspace/form_data_' . uniqid() . '.txt';

    // Пытаемся сохранить данные в файл
    if (file_put_contents($random_filename, $data)) {
        echo "Данные формы успешно сохранены в файл: " . $random_filename;
    } else {
        echo "Произошла ошибка при попытке сохранить данные.";
    }
} else {
    echo "Доступ к скрипту возможен только через отправку формы (POST).";
}
?>