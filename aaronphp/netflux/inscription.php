<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style2.css">

    <title>Inscrivez-vous</title>
</head>

<body>
    <div class="cadre">
        <div class="cadrebody">
            <h1>Inscription</h1>

            <form id="inscription" action="traitement_inscription.php" method="post">
                <label for="identifiant">Identifiant:<span>*</span> </label>
                <input required type="text" minlength="8" name="identifiant" id="identifiant" />

                <label for="mdp">Mot de passe:<span>*</span> </label>
                <input required type="password" name="mdp" id="mdp" />

                <label class="inline" for="mdp2">Validation du Mot de passe : <span>*</span></label>
                <input class="inline" required type="password" minlength="8" name="mdp2" id="mdp2" />

                <label for="age">Age<span>*</span></label>
                <input required type="number" name="age" id="age" />

                <label for="mail">Mail<span>*</span></label>
                <input required type="email" name="mail" id="mail" />
                    <input type="submit" value="Valider">
                </div>
            </form>
            <p id="message"></p>

        </div>

        <footer>
            <p><a href="authentification.php">Retour à la page de connexion.</a></p>
        </footer>
    </div>

    <script src="api.js"></script>
</body>

</html>



