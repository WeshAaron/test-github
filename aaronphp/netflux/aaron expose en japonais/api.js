
  
const req = new XMLHttpRequest();
req.open("POST", "api.php");

req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

req.onreadystatechange = () => {
    // In local files, status is 0 upon success in Mozilla Firefox
    if (req.readyState === XMLHttpRequest.DONE) {
        const status = req.status;
        if (status === 0 || (status >= 200 && status < 400)) {
        // The request has been completed successfully
            console.log(req.responseText);
        } else {
        // Oh no! There has been an error with the request!
        }
    }
};
req.send("monToto=toto");
  