<?php
try {
    $con = new PDO ('mysql:host=localhost;dbname=login_pwpb','root','' ,array(PDO::ATTR_PERSISTENT => true));
}catch (PDOException $e) {
    echo $e-> getMessage ();
}
include_once 'AuthClass.php';
$user = new Auth ($con);

?>