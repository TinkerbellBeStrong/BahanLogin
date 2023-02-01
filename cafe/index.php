<?php
require_once "dbconfig.php";
if(!$user->isLoggedIn()) {
    header("location: login.php");
}

$currentUser = $user->getUser();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="style.css" media="screen" title="no title" charset="utf-8">
</head>
<body>
    <div class="container">
        <div class="info">
            <h1>Selamat datang <?php echo $currentUser['nama'] ?></h1>
</div>
<a href="logout.php"><button type="button">Logout</button></a>
</div>
</body>
</html>