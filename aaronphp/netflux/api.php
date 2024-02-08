<?php

$ma_var = $_POST["monToto"];

$ma_var = $ma_var . " mdr!";

echo $ma_var;


$sql_check_email = "SELECT COUNT(*) AS count FROM user WHERE mail = :mail";
$req_check_email = $bdd->prepare($sql_check_email);
$req_check_email->bindParam(":mail", $mail, PDO::PARAM_STR);
$req_check_email->execute();
$count_email = $req_check_email->fetchColumn();