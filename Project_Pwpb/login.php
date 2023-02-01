<?php
require 'koneksi.php';
$email = $_POST["email"];
$password = $_POST["password"];
$md5 = md5($password);
//echo $md5;
$query_sql = "SELECT * FROM tb_user
            WHERE email = '$email' AND password = '$md5'";

$result = mysqli_query($conn, $query_sql);
            
if (mysqli_num_rows($result) > 0) {
    header("Location: dashboard.html");
} else {
    echo "<center><h1>Email atau Password anda salah. Silahkan coba Login kembali.</h1>
            <button><strong><a href='index.html'>Login</a></strong></button></center>";
}
?>