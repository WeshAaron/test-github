<?php
$id=$_POST["identifiant"];
if(isset($_POST['mdp']) && $_POST['mdp'] != ""){
    if(isset($_POST['mdp2']) && $_POST['mdp2'] != ""){
        if($_POST['pass'] === $_POST['pass2'])
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
        /* Pour etre sur d'avoir un email dans $mail */
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
    '');}
catch(Exception $e){
    die('Erreur:'. $e->getMessage());
}

$sql="INSERT INTO user(id,mdp,mail,age)VALUES(:id,:mdp,:mail,:age);";
$req=$bdd->prepare($sql);
$req->bindParam(":id", $id, PDO::PARAM_STR);
$req->bindParam(":mdp", $mdp, PDO::PARAM_STR);
$req->bindParam(":mail", $mail, PDO::PARAM_STR);
$req->bindParam(":age", $age, PDO::PARAM_INT);
$req->execute();
$resultat=$req->fetchAll();

header('Location:netflux/index.php');    
?>