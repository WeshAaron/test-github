<?php
    session_start();
    if(isset($mail)){
        header("Location: traitement_connexion.php");
        exit();
    }
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Acceuil-NetFlux</title>
        <link rel="stylesheet" href="style3.css">
        <nav class="liste">
            <ul>
                <li>Acceuil</li>
                <li>Séries</li>
                <li>Film</li>
                <li>Nouveautés les plus regardés</li>
                <li>Ma liste</li>
                <li>Explorer par langue</li>
            </ul>
        </nav>
    </head>
    
    <body>
        <div class="td">
            <h1>Tendances actuelles</h1>
            <button id="précédant">Précédent</button>
            <ul class="imagesc">
                <li><img src="images/tendances/tendance1.jpg" alt=""></li>
                <li><img src="images/tendances/tendance2.webp" alt=""></li>
                <li><img src="images/tendances/tendance3.webp" alt=""></li>
                <li><img src="images/tendances/tendance4.webp" alt=""></li>
                <li><img src="images/tendances/tendance5.webp" alt=""></li>
                

            </ul>
            <button id="suivant">suivant</button>




        </div>
        
        
    </body>
    
    </div>
</html>