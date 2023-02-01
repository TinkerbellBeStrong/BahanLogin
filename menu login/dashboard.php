<?php
session_start();
if (empty($_SESSION['user']) OR empty($_SESSION['password'])){
    header("location:login.php")

} else{
    ?>
    <html>
        <head><title>dashboard</title></head>
        <body>
            <h1>dashboard</h1>
            <h4><?php echo date ("1, d F Y");
            ?></h4>
            <h3>Selamat datang <?php echo $_SESSION['nama'];?></h3>
            <a href="logout.php">Logout</a>
</body>
</html>
<?php } ?>

