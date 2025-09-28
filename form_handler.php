<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Пример обработки данных из формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';

    // Простая валидация
    if (!empty($name) && !empty($email)) {
        // Здесь можно добавить логику для сохранения данных, например, в файл или базу данных
        $data = "Имя: " . $name . ", Email: " . $email . "\n";
        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);

        echo "Данные успешно сохранены!";
    } else {
        echo "Пожалуйста, заполните все поля формы.";
    }
} else {
    // Если запрос не POST, выводим форму
    echo '
    <form method="post" action="">
        Имя: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        <input type="submit" value="Отправить">
    </form>
    ';
}
?>