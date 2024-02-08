<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <title>Connectez-vous</title>
    <link rel="stylesheet" href="style2.css">
</head>

<body>
    <div class="cadre">
        <div class="cadrebody">
            <h1>Authentification</h1>

            <form action="traitement_connexion.php" method="post">
                <label for="email">Email : </label>
                <input required type="mail" name="mail" id="mail" />

                <label for="mdp">Mot de passe : </label>
                <input required type="password" name="mdp" id="mdp" />

                <input type="reset">
                <input type="submit" value="Valider">
            </form>
        </div>

        <footer>
            <p>Pas de compte ? <a href="inscription.php">Cliquez ici.</a></p>
        </footer>
    </div>
</body>

</html>
