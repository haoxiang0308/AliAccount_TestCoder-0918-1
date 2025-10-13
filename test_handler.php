<?php
// Имитируем POST-запрос
$_POST['name'] = 'Test User';
$_POST['email'] = 'test@example.com';
$_SERVER['REQUEST_METHOD'] = 'POST';

// Включаем основной обработчик
include 'form_handler.php';
?>