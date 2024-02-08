<?php
$id=$_POST["identifiant"];
if(isset($_POST['mdp']) && $_POST['mdp'] != ""){
    if(isset($_POST['mdp2']) && $_POST['mdp2'] != ""){
        if($_POST['mdp'] === $_POST['mdp2'])
            $mdp = hash('sha256', $_POST['mdp']);
        else
            header("Location:inscription.php?erreur=invpass");
    }else{
        header("Location:inscription.php?erreur=invpass");
    }
}else{
    header("Location:inscription.php?erreur=invpass");
}
if(isset($_POST['mail']) && $_POST['mail'] != ""){
    $tmp_mail = filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL);
        if($tmp_mail){
            $mail = $tmp_mail;
        }else{
            header("Location:inscription.php?erreur=invmail");
        }
}else{
    header("Location:inscription.php?erreur=invmail");
}

$age=$_POST["age"];

try{
    $bdd = new PDO(
        'mysql:host=localhost;dbname=user;charset=utf8',
        'root',
        ''
    );
} catch(Exception $e){
    die('Erreur:'. $e->getMessage());
}


if(isset($_POST['mail'])) {
    $mail = $_POST['mail'];

    $sql_check_email = "SELECT COUNT(*) AS count FROM user WHERE mail = :mail";
    $req_check_email = $bdd->prepare($sql_check_email);
    $req_check_email->bindParam(":mail", $mail, PDO::PARAM_STR);
    $req_check_email->execute();
    $count_email = $req_check_email->fetchColumn();

}



$sql="INSERT INTO user(id,mdp,mail,age)VALUES(:id,:mdp,:mail,:age);";
$req=$bdd->prepare($sql);
$req->bindParam(":id", $id, PDO::PARAM_STR);
$req->bindParam(":mdp", $mdp, PDO::PARAM_STR);
$req->bindParam(":mail", $mail, PDO::PARAM_STR);
$req->bindParam(":age", $age, PDO::PARAM_INT);
$req->execute();
$resultat=$req->fetchAll();


header('Location: netflux/index.php');
?>
