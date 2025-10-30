<?php
function validarCorreo($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}
?>