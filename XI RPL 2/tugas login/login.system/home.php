<?php
session_start();

if(isset($_SESSION['ID']) && isset($_SESSION['user_name'])) {

    ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HOME</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
   <h1>Hello, <?php echo $_SESSION['name']; ?></h1>
   <a href="logout.php">Logout</a> 
    
</body>
</html>

<?php
}else{
    header("Location: index.php");
    exit();

}
?>