<?php
// Обработчик формы

// Проверяем, был ли запрос методом POST
echo "<pre>";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Пример обработки данных формы
    $name = $_POST["name"] ?? "";
    $email = $_POST["email"] ?? "";

    // Валидация (простая валидация email)
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Ошибка: Некорректный email адрес.\n";
    } else {
        // Здесь можно добавить логику сохранения в файл или в базу данных
        $data = ["name" => $name, "email" => $email, "timestamp" => date("Y-m-d H:i:s")];
        $json_data = json_encode($data, JSON_PRETTY_PRINT);
        file_put_contents("form_data.json", $json_data . "\n", FILE_APPEND | LOCK_EX);
        echo "Данные успешно сохранены:\n";
        print_r($data);
    }
} else {
    echo "Форма не отправлена.\n";
}
echo "</pre>";
