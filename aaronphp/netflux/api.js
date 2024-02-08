document.getElementById('inscription').addEventListener('submit', function(event) {


    const email = document.getElementById('mail').value;


    const req = new XMLHttpRequest();
    req.open('POST', 'traitement_inscription.php');

    req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    req.onreadystatechange = () => {
        if (req.readyState === XMLHttpRequest.DONE) {
            const status = req.status;
            if (status === 0 || (status >= 200 && status < 400)) {
                document.getElementById('message').innerText = req.responseText;
            } else {
                alert("Une erreur s'est produite");
            }
        }
    };
    req.send('mail=' + email);
});
