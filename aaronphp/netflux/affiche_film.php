<?php
try {
    $bd = new PDO("mysql:host=127.0.0.1;dbname=netflux;charset=utf8", "root", "");
} catch (Exception $e) {
    echo $e->getMessage();
    die();
}

if(isset($_GET['IdVideo'])){
    $id_film=$_GET['IdVideo']
}
$sql = "SELECT * FROM Video";
$requete = $bd->prepare($sql);
$requete->execute();
$donnees = $requete->fetchAll();

foreach($donnees as $element){
    echo "<p>" . $element["titre"] . "</p>"; 
    echo "<p>" . $element["duree"] . "</p>";

    $img = "./images/".$element["titre"].".jpg";

    
}






?>