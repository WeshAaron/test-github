<?php
$mail = $_POST['mail'];
$mdp = hash('sha256', $_POST['mdp']);

try {
    $bdd = new PDO(
        'mysql:host=localhost;dbname=user;charset=utf8',
        'root',
        ''
    );
} catch (Exception $e) {
    die('Erreur:'. $e->getMessage());
}

$sql_check_email = "SELECT COUNT(*) AS count FROM user WHERE mail = :mail";
$req_check_email = $bdd->prepare($sql_check_email);
$req_check_email->bindParam(":mail", $mail, PDO::PARAM_STR);
$req_check_email->execute();
$count_email = $req_check_email->fetchColumn();

if ($count_email == 1) {
    // Si l'adresse e-mail existe, vérification du mot de passe
    $sql = "SELECT COUNT(*) AS count FROM user WHERE mail = :mail AND mdp = :mdp";
    $req = $bdd->prepare($sql);
    $req->bindParam(":mail", $mail, PDO::PARAM_STR);
    $req->bindParam(":mdp", $mdp, PDO::PARAM_STR);
    $req->execute();
    $count = $req->fetchColumn();

    if ($count == 1) {
        session_start();
        $_SESSION["mail"] = $mail;
        header("Location:netflux/index.php");
    } else {
        header("Location: authentification.php?erreur=mot_de_passe");
    }
} else {
    header("Location: authentification.php?erreur=email");
}
?>
?>
 