<!DOCTYPE html>
<?php

try{
    $bd = new PDO("mysql:host=127.0.0.1;dbname=netflux;charset=utf8", "root", "");
}catch(Exception $e){
    echo $e->getMessage();
    die();
}

$sql = "SELECT * FROM video LIMIT 5;";
$requete = $bd->prepare($sql);
$requete->execute();
$donnees = $requete->fetchAll();



    

?>

<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Netflux</title>
        <link rel="stylesheet" href="style_netflux.css">
    </head>

    <body>

        <div class="bannière">


            <header>


                <nav>

                    <ul>
                        <li>Accueil</li>
                        <li>Séries</li>
                        <li>Films</li>
                        <li>Les Acteurs</li>
                        <li>Recherche avec un titre</li>
                    </ul>

                </nav>



            </header>


        </div>


        <div class="video">

            <h2>Tendances actuelles</h2>

            <ul class="list">
                <button id="p"><img src="image/Fleche-gauche.png"style="height:75px;"></button>
                <?php
                foreach($donnees as $element){
                    echo "<div id='conteneur".$element["IdVideo"]."'>";
                    $image="./image/".$element["image"].".jpg";
                    echo '<img class="imagesfilms" id="detailimage'. $element["IdVideo"] .'" src="'.$image.'"alt="">';
                    echo "<div class='detail' id='detail".$element["IdVideo"]."' style='display:none;'>";

                    echo "<p><strong>Titre:</strong>" . $element["Titre"] . "</p>"; 
                    echo "<p><strong>Durée:</strong>" . $element["duree"] ." ". "minutes</p>";
                    echo "<p><strong>Date de sortie:</strong>" . $element["Date_Sortie"] . "</p>"; 
                 


                    echo "</div> </div>";
                    
                
                
                    
                }

                ?>
                 

                <button id="s"><img src="image/Fleche-droite.png" style="height:75px;"></button>            
            </ul>






        </div>




        <script src="film.js"></script>
    </body>
</html>
