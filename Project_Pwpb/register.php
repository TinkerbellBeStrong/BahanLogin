<?php
require 'koneksi.php';
$username = $_POST["username"];
$email = $_POST["email"];
$password = $_POST["password"];
$md5 = md5($password);
$query_sql = "INSERT INTO tb_user (username, email, password)
            VALUES ('$username', '$email', '$md5')";
            
if (mysqli_query($conn, $query_sql)) {
    header("Location: index.html");
} else {
    echo "Pendaftaran Gagal : " . mysqli_error($conn);
}
?>